package com.cashrich.user.response.getUser;

import com.cashrich.user.dto.UserDto;

public class UserGetResponse {
    private UserGetResponseEnum userGetResponseEnum;
    private UserDto userDto;

    public UserGetResponse(UserGetResponseEnum userGetResponseEnum, UserDto userDto) {
        this.userGetResponseEnum = userGetResponseEnum;
        this.userDto = userDto;
    }

    public UserGetResponseEnum getUserGetResponseEnum() {
        return userGetResponseEnum;
    }

    public UserDto getUserDto() {
        return userDto;
    }
}
