package org.acme;

import jakarta.ws.rs.core.Response;

import java.util.Arrays;

public class ErrorResponse {
    public String error;
    public String message;
    public String stackTrace;

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
