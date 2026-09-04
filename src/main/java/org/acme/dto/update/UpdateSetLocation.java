package org.acme.dto.update;

import com.fasterxml.jackson.annotation.JsonTypeName;

@JsonTypeName("set-location")
public record UpdateSetLocation(String location) implements TableUpdate {

  @Override
  public String action() {
    return "set-location";
  }
}
