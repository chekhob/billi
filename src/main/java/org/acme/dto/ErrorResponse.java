package org.acme.dto;

public class ErrorResponse {

    public String error;
    public String message;
    public String stackTrace;

    public ErrorResponse() {}

    public ErrorResponse(String error, String message, String stackTrace) {
        this.error = error;
        this.message = message;
        this.stackTrace = stackTrace;
    }

    public ErrorResponse(String message, String stackTrace) {
        this.error = "error";
        this.message = message;
        this.stackTrace = stackTrace;
    }
}
