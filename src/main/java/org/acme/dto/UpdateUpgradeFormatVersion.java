package org.acme.dto;

import com.fasterxml.jackson.annotation.JsonTypeName;

@JsonTypeName("upgrade-format-version")
public record UpdateUpgradeFormatVersion(Integer formatVersion) implements TableUpdate {

  @Override
  public String action() {
    return "upgrade-format-version";
  }
}
