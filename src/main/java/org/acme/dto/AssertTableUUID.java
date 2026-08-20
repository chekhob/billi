package org.acme.dto;

import com.fasterxml.jackson.annotation.JsonTypeName;

@JsonTypeName("assert-table-uuid")
public record AssertTableUUID(String uuid) implements TableRequirement {
}
