package org.acme.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.enterprise.inject.Instance;
import jakarta.inject.Inject;
import jakarta.ws.rs.core.Response;

import org.acme.dto.IcebergMetadata;
import org.acme.dto.TableUpdate;
import org.acme.exceptions.InvalidUpdateException;

@ApplicationScoped
public class TableUpdateDispatcher {

  private final Map<String, TableUpdateApplier> appliers;

  @Inject
  TableUpdateDispatcher(Instance<TableUpdateApplier> all) {
    this.appliers = new HashMap<>();
    for (TableUpdateApplier applier : all) {
      for (String action : applier.actions()) {
        appliers.put(action, applier);
      }
    }
  }

  public void applyAll(IcebergMetadata metadata, List<TableUpdate> updates) {
    if (updates == null) {
      return;
    }
    for (TableUpdate update : updates) {
      TableUpdateApplier applier = appliers.get(update.action());
      if (applier == null) {
        throw new InvalidUpdateException(
            "Unsupported update action: " + update.action(),
            Response.Status.BAD_REQUEST);
      }
      applier.apply(metadata, update);
    }
  }
}
