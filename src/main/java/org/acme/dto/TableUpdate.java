package org.acme.dto;

import com.fasterxml.jackson.annotation.JsonSubTypes;
import com.fasterxml.jackson.annotation.JsonTypeInfo;

@JsonTypeInfo(use = JsonTypeInfo.Id.NAME, property = "action")
@JsonSubTypes({
    @JsonSubTypes.Type(value = UpdateAddSnapshot.class, name = "add-snapshot"),
    @JsonSubTypes.Type(value = UpdateSetSnapshotRef.class, name="set-snapshot-ref")
})
public interface TableUpdate {

  String action();
}
