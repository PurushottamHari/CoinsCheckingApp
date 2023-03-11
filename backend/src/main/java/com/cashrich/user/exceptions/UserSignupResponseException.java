package com.cashrich.user.exceptions;

public class UserSignupResponseException extends RuntimeException{
    public UserSignupResponseException() {
    }

    public UserSignupResponseException(String message) {
        super(message);
    }

    public UserSignupResponseException(String message, Throwable cause) {
        super(message, cause);
    }

    public UserSignupResponseException(Throwable cause) {
        super(cause);
    }

    public UserSignupResponseException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
