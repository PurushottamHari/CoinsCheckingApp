package com.cashrich.coins.controllers;

import com.cashrich.coins.response.CoinsGetResponse;
import com.cashrich.coins.service.CoinService;
import com.cashrich.commons.ResponseHandler;
import com.cashrich.user.dto.LoginCredentialsDto;
import com.cashrich.user.dto.UserDto;
import com.cashrich.user.exceptions.UserSignupResponseException;
import com.cashrich.user.response.signupUser.UserSignupResponseEnum;
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
@RequestMapping(value = "coin")
public class CoinController {
    @Autowired
    CoinService coinService;

    // Signup user case
    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<Object> getCoins(@Valid @RequestBody LoginCredentialsDto loginCredentialsDto, Errors errors) {
        //Handling Validation Errors
        if (errors.hasErrors()) {
            return ResponseHandler.generateResponse("The request body is not valid.", HttpStatus.BAD_REQUEST, null);
        }
        CoinsGetResponse coinsGetResponse =  coinService.getCoins(loginCredentialsDto);
        return generateCoinsGetResponse(coinsGetResponse);
    }


    private ResponseEntity<Object> generateCoinsGetResponse(CoinsGetResponse coinsGetResponse){
        switch(coinsGetResponse.getCoinsGetResponseEnum()){
            case COINS_FETCHED: return ResponseHandler.generateResponse("Successfully created new user!", HttpStatus.ACCEPTED, coinsGetResponse.getCoinDto());
            case COINS_FETCH_FAILED: return ResponseHandler.generateResponse("User already exists!", HttpStatus.INTERNAL_SERVER_ERROR, null);
            case USER_AUTH_FAILED: return ResponseHandler.generateResponse("User Validation Failed!", HttpStatus.NOT_ACCEPTABLE, null);
            default:
                throw new UserSignupResponseException();
        }
    }
}
