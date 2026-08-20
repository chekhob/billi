package org.acme.services;

import java.util.Set;

import org.acme.dto.IcebergMetadata;
import org.acme.dto.TableUpdate;

public interface TableUpdateApplier {

  Set<String> actions();

  void apply(IcebergMetadata metadata, TableUpdate update);
}
