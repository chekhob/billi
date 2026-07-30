package org.acme.context;

import jakarta.enterprise.context.RequestScoped;
import org.acme.entity.NamespaceObject;

@RequestScoped
public class RequestContext {

  private NamespaceObject namespace;

  public NamespaceObject getNamespace() {
    return namespace;
  }

  public void setNamespace(NamespaceObject namespace) {
    this.namespace = namespace;
  }
}
