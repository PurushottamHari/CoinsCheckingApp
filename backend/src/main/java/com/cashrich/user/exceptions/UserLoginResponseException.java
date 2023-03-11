package com.cashrich.user.exceptions;

public class UserLoginResponseException extends RuntimeException{
    public UserLoginResponseException() {
    }

    public UserLoginResponseException(String message) {
        super(message);
    }

    public UserLoginResponseException(String message, Throwable cause) {
        super(message, cause);
    }

    public UserLoginResponseException(Throwable cause) {
        super(cause);
    }

    public UserLoginResponseException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
