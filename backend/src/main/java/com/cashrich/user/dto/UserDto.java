package com.cashrich.user.dto;

import lombok.extern.slf4j.Slf4j;

import java.util.Objects;

@Slf4j
public class UserDto {
    private String userName;
    private String email;
    private String password;
    private String firstName;
    private String lastName;

    public UserDto(String userName,
                   String email,
                   String password,
                   String firstName,
                   String lastName) {
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public UserDto(){}

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public boolean verify(){
        if(this.email != null && this.firstName != null && this.lastName != null && this.userName != null
         && this.userName.length() >=4 && this.userName.length() <= 15 && this.password != null
                && this.password.length() >= 8 && this.password.length() <= 15){
            return true;
        }
        log.error("Verification failed!");
        return false;
    }

}
