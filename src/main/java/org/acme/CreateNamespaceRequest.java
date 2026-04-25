package org.acme;

import java.util.List;
import java.util.Map;

public class CreateNamespaceRequest {
    private List<String> namespace;
    private Map<String, String> properties;

    public CreateNamespaceRequest(List<String> namespace, Map<String, String> properties) {
        this.namespace=namespace;
        this.properties=properties;
    }

    public List<String> getNamespace() {
        return namespace;
    }

    public void setNamespace(List<String> namespace) {
        this.namespace = namespace;
    }

    public Map<String, String> getProperties() {
        return properties;
    }

    public void setProperties(Map<String, String> properties) {
        this.properties = properties;
    }
}