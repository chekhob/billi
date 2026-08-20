package org.acme.exceptions;

import jakarta.ws.rs.core.Response;

public class InvalidRequirementException extends RuntimeException {

    public final Response.Status code;
    public final String element;
    public final String type = "InvalidRequirementException";

    public InvalidRequirementException(String element, Response.Status code) {
        // super(element);
        this.element = element;
        this.code = code;
    }
}
