package org.acme.dto.requirement;

import org.acme.dto.IcebergMetadata;

import com.fasterxml.jackson.annotation.JsonSubTypes;
import com.fasterxml.jackson.annotation.JsonTypeInfo;

@JsonTypeInfo(use = JsonTypeInfo.Id.NAME, property = "type")
@JsonSubTypes({
    @JsonSubTypes.Type(value = AssertTableUUID.class, name = "assert-table-uuid"),
    @JsonSubTypes.Type(value = AssertRefSnapshotId.class, name = "assert-ref-snapshot-id")
})
public interface TableRequirement {

  void validate(IcebergMetadata current);
}
