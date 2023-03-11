package com.cashrich.user.exceptions;

public class UserGetException extends RuntimeException{
    public UserGetException() {
    }

    public UserGetException(String message) {
        super(message);
    }

    public UserGetException(String message, Throwable cause) {
        super(message, cause);
    }

    public UserGetException(Throwable cause) {
        super(cause);
    }

    public UserGetException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
