package org.acme.dto.update;

import com.fasterxml.jackson.annotation.JsonTypeName;

@JsonTypeName("assign-uuid")
public record UpdateAssignUUID(String uuid) implements TableUpdate {

  @Override
  public String action() {
    return "assign-uuid";
  }
}
