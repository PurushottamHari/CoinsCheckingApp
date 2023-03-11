package com.cashrich.user.dto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginCredentialsDto {
    private String userName;
    private String password;

    public LoginCredentialsDto(String userName, String password) {
        this.userName = userName;
        this.password = password;
    }

    public LoginCredentialsDto(){}

    public String getUserName() {
        return userName;
    }

    public String getPassword() {
        return password;
    }

    public boolean verify(){
        if(this.userName != null && this.userName.length() >=4 && this.userName.length() <= 15 && this.password != null
                && this.password.length() >= 8 && this.password.length() <= 15){
            return true;
        }
        log.error("Verification failed!");
        return false;
    }
}
