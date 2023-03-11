package com.cashrich.commons;

import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.util.HashMap;

@Log4j2
public class ResponseHandler {

    public static ResponseEntity<Object> generateResponse(String message, HttpStatus status, Object responseObject) {

        HashMap<String, Object> response = new HashMap<>();
        response.put("message", message);
        response.put("status", status.value());
        response.put("data", responseObject);
        log.debug("Response is: {}", response);

        return new ResponseEntity<>(response, status);
    }
}