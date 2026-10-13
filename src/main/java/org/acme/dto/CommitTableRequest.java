package org.acme.dto;

import java.util.List;

import org.acme.dto.requirement.TableRequirement;
import org.acme.dto.update.TableUpdate;

public class CommitTableRequest {
  private List<TableRequirement> requirements;
  private List<TableUpdate> updates;

  public CommitTableRequest() {
  }

  public CommitTableRequest(List<TableRequirement> requirements, List<TableUpdate> updates) {
    this.requirements = requirements;
    this.updates = updates;
  }

  public List<TableRequirement> getRequirements() {
    return requirements;
  }

  public <T extends TableRequirement> T requirement(Class<T> type) {
    if (requirements == null) {
      return null;
    }
    return requirements.stream()
        .filter(type::isInstance)
        .map(type::cast)
        .findFirst()
        .orElse(null);
  }

  public void setRequirements(List<TableRequirement> requirements) {
    this.requirements = requirements;
  }

  public List<TableUpdate> getUpdates() {
    return updates;
  }

  public void setUpdates(List<TableUpdate> updates) {
    this.updates = updates;
  }
}
