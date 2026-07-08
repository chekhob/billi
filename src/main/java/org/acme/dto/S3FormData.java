package org.acme.dto;

import jakarta.activation.MimeType;
import jakarta.json.Json;

public class S3FormData {

    public String filename;
    public MimeType mimetype;
    public String json;
}
