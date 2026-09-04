package org.acme.dto.requirement;

import org.acme.dto.IcebergMetadata;
import org.acme.exceptions.InvalidRequirementException;

import com.fasterxml.jackson.annotation.JsonTypeName;

import jakarta.ws.rs.core.Response;

@JsonTypeName("assert-table-uuid")
public record AssertTableUUID(String uuid) implements TableRequirement {

  @Override
  public void validate(IcebergMetadata current) {
    if (!current.getTableUuid().toString().equals(uuid)) {
      throw new InvalidRequirementException(
          "Table UUID mismatch: expected " + uuid + " but was " + current.getTableUuid(),
          Response.Status.CONFLICT);
    }
  }
}
