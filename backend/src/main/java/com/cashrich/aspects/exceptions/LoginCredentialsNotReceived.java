package com.cashrich.aspects.exceptions;

public class LoginCredentialsNotReceived extends RuntimeException{
    public LoginCredentialsNotReceived() {
    }

    public LoginCredentialsNotReceived(String message) {
        super(message);
    }

    public LoginCredentialsNotReceived(String message, Throwable cause) {
        super(message, cause);
    }

    public LoginCredentialsNotReceived(Throwable cause) {
        super(cause);
    }

    public LoginCredentialsNotReceived(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
