package com.cashrich.user.response.loginUser;

import com.cashrich.user.dto.UserDto;

public class UserLoginResponse {
    private UserLoginResponseEnum userLoginResponseEnum;
    private UserDto userDto;

    public UserLoginResponse(UserLoginResponseEnum userLoginResponseEnum, UserDto userDto) {
        this.userLoginResponseEnum = userLoginResponseEnum;
        this.userDto = userDto;
    }

    public UserLoginResponseEnum getUserLoginResponseEnum() {
        return userLoginResponseEnum;
    }

    public UserDto getUserDto() {
        return userDto;
    }
}
