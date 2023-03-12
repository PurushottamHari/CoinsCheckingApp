package com.cashrich.coins.service;

import com.cashrich.coins.dto.CoinDto;
import com.cashrich.coins.response.CoinsGetResponse;
import com.cashrich.coins.response.CoinsGetResponseEnum;
import com.cashrich.user.dto.LoginCredentialsDto;
import com.cashrich.user.response.getUser.UserGetResponse;
import com.cashrich.user.response.getUser.UserGetResponseEnum;
import com.cashrich.user.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class CoinService {

    @Autowired
    UserService userService;

    public CoinsGetResponse getCoins(LoginCredentialsDto loginCredentialsDto){
        try{
            UserGetResponse userGetResponse = userService.getUser(loginCredentialsDto);
            if(userGetResponse == null || userGetResponse.getUserGetResponseEnum() != UserGetResponseEnum.USER_FOUND){
                return new CoinsGetResponse(CoinsGetResponseEnum.USER_AUTH_FAILED, null);
            }

            CoinDto coinDto = getCoinsDto();
            return new CoinsGetResponse(CoinsGetResponseEnum.COINS_FETCHED, coinDto);
        }
        catch(Exception e) {
            log.error("Exception while fetching coins: " + e.getMessage());
            return new CoinsGetResponse(CoinsGetResponseEnum.COINS_FETCH_FAILED, null);
        }
    }
}
