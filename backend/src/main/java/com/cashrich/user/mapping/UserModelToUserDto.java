package com.cashrich.user.mapping;

import com.cashrich.user.dto.UserDto;
import com.cashrich.user.models.User;

public class UserModelToUserDto {
    public static UserDto convert(User user){
        return new UserDto(
                user.getUserName(),
                user.getEmail(),
                user.getPassword(),
                user.getFirstName(),
                user.getLastName()
        );
    }
}
