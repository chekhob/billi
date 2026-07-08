package org.acme.services;

import io.vertx.core.json.Json;
import org.acme.dto.S3FormData;
import org.eclipse.microprofile.config.inject.ConfigProperty;
import software.amazon.awssdk.services.s3.model.GetObjectRequest;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

public abstract class S3Connector {

    @ConfigProperty(name = "bucket.name")
    String bucketName;

    // TODO: Fix this stupid method
    protected PutObjectRequest buildPutRequest(S3FormData formData) {
        return PutObjectRequest.builder()
            .bucket(bucketName)
            .key(formData.filename)
            .contentType(formData.mimetype.toString())
            .build();
    }

    protected GetObjectRequest buildGetRequest(String objectKey) {
        return GetObjectRequest.builder()
            .bucket(bucketName)
            .key(objectKey)
            .build();
    }
}
