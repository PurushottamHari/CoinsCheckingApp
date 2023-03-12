package com.cashrich;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@SpringBootApplication(scanBasePackages={"com.cashrich"})
@EnableWebMvc
@EnableAspectJAutoProxy
public class CashRichSpringApplication {

    public static void main(String[] args) {
        SpringApplication.run(CashRichSpringApplication.class, args);
    }
}