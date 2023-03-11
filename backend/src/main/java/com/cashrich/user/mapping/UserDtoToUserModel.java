package com.cashrich.user.mapping;

import com.cashrich.user.dto.UserDto;
import com.cashrich.user.models.User;

public class UserDtoToUserModel {
    public static User convert(UserDto userDto){
        return new User(
                userDto.getUserName(),
                userDto.getFirstName(),
                userDto.getLastName(),
                userDto.getEmail(),
                userDto.getPassword()
        );
    }
}
