package org.acme.dto;

import com.fasterxml.jackson.annotation.JsonTypeName;

@JsonTypeName("assert-ref-snapshot-id")
public record AssertRefSnapshotId(String ref, Long snapshotId) implements TableRequirement {
}
