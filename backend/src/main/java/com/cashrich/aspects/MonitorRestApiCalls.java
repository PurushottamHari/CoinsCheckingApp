package com.cashrich.aspects;

import com.cashrich.aspects.exceptions.LoginCredentialsNotReceived;
import com.cashrich.aspects.exceptions.RestApiTimeAspectException;
import com.cashrich.aspects.pointcuts.CashRichPointcuts;
import com.cashrich.user.dto.LoginCredentialsDto;
import com.cashrich.user.models.UserTime;
import com.cashrich.user.repo.UserRestApiTimeRepository;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Slf4j
@AllArgsConstructor
@Aspect
@Component
public class MonitorRestApiCalls {
    @Autowired
    private final UserRestApiTimeRepository userRestApiTimeRepository;

    @AfterReturning("forGetCoinsMethod()")
    public void logCustomerTime(JoinPoint joinPoint) {
        try{
            log.info("Monitor Rest API Aspect interception called!: " + joinPoint.getSignature());
            Object[] args = joinPoint.getArgs();
            addUserTimeData(args);
            log.info("Monitor Rest API Aspect inteception complete!");

        }
        catch(Throwable throwable){
            throw new RestApiTimeAspectException("Error while processing aspect: " + throwable.getMessage());
        }

    }

    @Pointcut(CashRichPointcuts.COIN_REST_CALL)
    public void forGetCoinsMethod(){

    }

    private void addUserTimeData(Object args[]){
        // Extract LoginCredentials from args
        LoginCredentialsDto loginCredentialsReceived = null;
        for(int itr = 0; itr<args.length; itr++){
            Object arg = args[itr];
            if(arg instanceof LoginCredentialsDto){
                loginCredentialsReceived = (LoginCredentialsDto) arg;
                break;
            }

        }

        if(loginCredentialsReceived == null){
            throw new LoginCredentialsNotReceived("Login Credentials was not received in args!");
        }

        // Add the time data to the table
        userRestApiTimeRepository.save(new UserTime(loginCredentialsReceived.getUserName(), Long.toString(System.currentTimeMillis())));
    }

}
