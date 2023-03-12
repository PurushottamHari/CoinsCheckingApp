package com.cashrich.aspects.exceptions;

public class RestApiTimeAspectException extends RuntimeException{
    public RestApiTimeAspectException() {
    }

    public RestApiTimeAspectException(String message) {
        super(message);
    }

    public RestApiTimeAspectException(String message, Throwable cause) {
        super(message, cause);
    }

    public RestApiTimeAspectException(Throwable cause) {
        super(cause);
    }

    public RestApiTimeAspectException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
