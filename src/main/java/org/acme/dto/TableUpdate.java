package org.acme.dto;

import com.fasterxml.jackson.annotation.JsonSubTypes;
import com.fasterxml.jackson.annotation.JsonTypeInfo;

@JsonTypeInfo(use = JsonTypeInfo.Id.NAME, property = "action")
@JsonSubTypes({
    @JsonSubTypes.Type(value = UpdateAddSnapshot.class, name = "add-snapshot"),
    @JsonSubTypes.Type(value = UpdateSetSnapshotRef.class, name = "set-snapshot-ref"),
    @JsonSubTypes.Type(value = UpdateRemoveSnapshotRef.class, name = "remove-snapshot-ref"),
    @JsonSubTypes.Type(value = UpdateRemoveSnapshots.class, name = "remove-snapshots"),
    @JsonSubTypes.Type(value = UpdateAssignUUID.class, name = "assign-uuid"),
    @JsonSubTypes.Type(value = UpdateUpgradeFormatVersion.class, name = "upgrade-format-version"),
    @JsonSubTypes.Type(value = UpdateSetLocation.class, name = "set-location")
})
public interface TableUpdate {

  String action();
}
