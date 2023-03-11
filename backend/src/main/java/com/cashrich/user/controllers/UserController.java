package com.cashrich.user.controllers;

import com.cashrich.commons.ResponseHandler;
import com.cashrich.user.dto.LoginCredentialsDto;
import com.cashrich.user.response.getUser.UserGetResponse;
import com.cashrich.user.response.loginUser.UserLoginResponse;
import com.cashrich.user.response.signupUser.UserSignupResponseEnum;
import com.cashrich.user.service.UserService;
import com.cashrich.user.dto.UserDto;
import com.cashrich.user.exceptions.UserSignupResponseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
@RequestMapping(value = "user")
class UserController{

    @Autowired
    UserService userService;

    // Signup user case
    @RequestMapping(value = "sign-up",method = RequestMethod.POST)
    public ResponseEntity<Object> signUpUser(@Valid @RequestBody UserDto userDto, Errors errors) {
        //Handling Validation Errors
        if (errors.hasErrors()) {
            return ResponseHandler.generateResponse("The request body is not valid.", HttpStatus.BAD_REQUEST, null);
        }
        UserSignupResponseEnum userSignupResponseEnum = userService.signUpUser(userDto);
        return generateUserSignupResponse(userSignupResponseEnum, userDto);
    }


    // Get User
    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<Object> getUserProfile(@Valid @RequestBody LoginCredentialsDto loginCredentialsDto, Errors errors){
        //Handling Validation Errors
        if (errors.hasErrors()) {
            return ResponseHandler.generateResponse("The request body is not valid.", HttpStatus.BAD_REQUEST, null);
        }

        UserGetResponse userGetResponse = userService.getUser(loginCredentialsDto);

        return generateUserGetResponse(userGetResponse, loginCredentialsDto);
    }

    // Login User
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ResponseEntity<Object> loginUserProfile(@Valid @RequestBody LoginCredentialsDto loginCredentialsDto, Errors errors){
        //Handling Validation Errors
        if (errors.hasErrors()) {
            return ResponseHandler.generateResponse("The request body is not valid.", HttpStatus.BAD_REQUEST, null);
        }

        UserLoginResponse userLoginResponse = userService.loginUser(loginCredentialsDto);

        return generateUserLoginResponse(userLoginResponse, loginCredentialsDto);
    }



    ResponseEntity<Object> generateUserSignupResponse(UserSignupResponseEnum userSignupResponseEnum, UserDto userDto){
        switch(userSignupResponseEnum){
            case USER_CREATED: return ResponseHandler.generateResponse("Successfully created new user!", HttpStatus.ACCEPTED, userDto);
            case USER_ALREADY_EXISTS: return ResponseHandler.generateResponse("User already exists!", HttpStatus.NOT_ACCEPTABLE, userDto);
            case USER_VAIDATION_FAILED: return ResponseHandler.generateResponse("User Validation Failed!", HttpStatus.NOT_ACCEPTABLE, userDto);
            default:
                throw new UserSignupResponseException();
        }
    }

    ResponseEntity<Object> generateUserGetResponse(UserGetResponse userGetResponse, LoginCredentialsDto loginCredentialsDto){
        switch(userGetResponse.getUserGetResponseEnum()){
            case USER_FOUND: return ResponseHandler.generateResponse("Successfully found user!", HttpStatus.FOUND, userGetResponse.getUserDto());
            case USER_NOT_FOUND: return ResponseHandler.generateResponse("User not found!", HttpStatus.NOT_FOUND, loginCredentialsDto);
            case USER_CREDENTIALS_NOT_VALID: return ResponseHandler.generateResponse("User Validation Failed!", HttpStatus.NOT_ACCEPTABLE, loginCredentialsDto);
            default:
                throw new UserSignupResponseException();
        }
    }

    ResponseEntity<Object> generateUserLoginResponse(UserLoginResponse userLoginResponse, LoginCredentialsDto loginCredentialsDto){
        switch(userLoginResponse.getUserLoginResponseEnum()){
            case USER_LOGGED_IN: return ResponseHandler.generateResponse("Successfully logged in user!", HttpStatus.FOUND, userLoginResponse.getUserDto());
            case USER_NOT_AVAILABLE:
            case USER_PASSWORD_INCORRECT:
            case USER_CREDENTIALS_INVAID:
                return ResponseHandler.generateResponse("Invalid Data!", HttpStatus.NOT_ACCEPTABLE, loginCredentialsDto);
            default:
                throw new UserSignupResponseException();
        }
    }

}