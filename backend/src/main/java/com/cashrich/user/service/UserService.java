package com.cashrich.user.service;

import com.cashrich.user.dto.LoginCredentialsDto;
import com.cashrich.user.dto.UserDto;
import com.cashrich.user.exceptions.UserLoginResponseException;
import com.cashrich.user.exceptions.UserSignupResponseException;
import com.cashrich.user.mapping.UserDtoToUserModel;
import com.cashrich.user.mapping.UserModelToUserDto;
import com.cashrich.user.models.User;
import com.cashrich.user.repo.UserRepository;
import com.cashrich.user.response.getUser.UserGetResponse;
import com.cashrich.user.response.getUser.UserGetResponseEnum;
import com.cashrich.user.response.loginUser.UserLoginResponse;
import com.cashrich.user.response.loginUser.UserLoginResponseEnum;
import com.cashrich.user.response.signupUser.UserSignupResponseEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {

    @Autowired
    UserRepository userRepo;

    public UserSignupResponseEnum signUpUser(UserDto userDto){
        try{
            if(!userDto.verify()){
                return UserSignupResponseEnum.USER_VAIDATION_FAILED;
            }
            Optional<User> user = userRepo.findByUserName(userDto.getUserName());
            if(user.isPresent()){
                return UserSignupResponseEnum.USER_ALREADY_EXISTS;
            }
            userRepo.save(UserDtoToUserModel.convert(userDto));
            return UserSignupResponseEnum.USER_CREATED;
        }
        catch(Exception e){
          throw new UserSignupResponseException(e);
        }
    }

    public UserGetResponse getUser(LoginCredentialsDto loginCredentialsDto){
        try{
            if(!loginCredentialsDto.verify()){
                return new UserGetResponse(UserGetResponseEnum.USER_CREDENTIALS_NOT_VALID, null);
            }

            // Add Validation
            // Get User
            Optional<User> user = userRepo.findByUserName(loginCredentialsDto.getUserName());

            if(user.isPresent()){
                return new UserGetResponse(UserGetResponseEnum.USER_FOUND, UserModelToUserDto.convert(user.get()));
            }

            return new UserGetResponse(UserGetResponseEnum.USER_NOT_FOUND, null);
        }
        catch(Exception e){
            throw new UserSignupResponseException(e);
        }

    }

    public UserLoginResponse loginUser(LoginCredentialsDto loginCredentialsDto){
        try{
            if(!loginCredentialsDto.verify()){
                return new UserLoginResponse(UserLoginResponseEnum.USER_CREDENTIALS_INVAID, null);
            }
            UserGetResponse userGetResponse = getUser(loginCredentialsDto);

            if(userGetResponse.getUserGetResponseEnum() == UserGetResponseEnum.USER_FOUND){
                return new UserLoginResponse(UserLoginResponseEnum.USER_LOGGED_IN, userGetResponse.getUserDto());
            }
            return new UserLoginResponse(UserLoginResponseEnum.USER_NOT_AVAILABLE, null);
        }
        catch(Exception e){
            throw new UserLoginResponseException(e);
        }
    }
}
