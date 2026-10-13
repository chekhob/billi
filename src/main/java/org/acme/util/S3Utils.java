package org.acme.util;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.S3Uri;

import java.net.URI;

@ApplicationScoped
public class S3Utils {

    private static final String S3_SCHEME = "s3://";

    @Inject
    S3Client s3;

    public String toObjectKey(String location) {
        if (location == null || !location.startsWith(S3_SCHEME)) {
            return location;
        }
        S3Uri s3Uri = s3.utilities().parseUri(URI.create(location));
        return s3Uri.key().orElse("");
    }

    public String toBucket(String location) {
        if (location == null || !location.startsWith(S3_SCHEME)) {
            return null;
        }
        S3Uri s3Uri = s3.utilities().parseUri(URI.create(location));
        return s3Uri.bucket().orElse(null);
    }
}
