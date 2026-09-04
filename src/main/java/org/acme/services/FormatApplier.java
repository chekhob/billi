package org.acme.services;

import java.util.Set;
import java.util.UUID;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.ws.rs.core.Response;

import org.acme.dto.IcebergMetadata;
import org.acme.dto.update.TableUpdate;
import org.acme.dto.update.UpdateAssignUUID;
import org.acme.dto.update.UpdateSetLocation;
import org.acme.dto.update.UpdateUpgradeFormatVersion;
import org.acme.enums.ActionType;
import org.acme.exceptions.InvalidUpdateException;

@ApplicationScoped
public class FormatApplier implements TableUpdateApplier {

  @Override
  public Set<String> actions() {
    return Set.of(
        ActionType.ASSIGN_UUID.getAction(),
        ActionType.UPGRADE_FORMAT_VERSION.getAction(),
        ActionType.SET_LOCATION.getAction());
  }

  @Override
  public void apply(IcebergMetadata metadata, TableUpdate update) {
    switch (update) {
      case UpdateAssignUUID(String uuid) -> {
        if (metadata.getTableUuid() != null) {
          throw new InvalidUpdateException(
              "Table UUID is already assigned: " + metadata.getTableUuid(),
              Response.Status.CONFLICT);
        }
        metadata.setTableUuid(UUID.fromString(uuid));
      }
      case UpdateUpgradeFormatVersion(Integer formatVersion) -> {
        metadata.setFormatVersion(formatVersion);
      }
      case UpdateSetLocation(String location) -> {
        metadata.setLocation(location);
      }
      default -> throw new InvalidUpdateException(
          "Unsupported format update: " + update.action(),
          Response.Status.BAD_REQUEST);
    }
  }
}
