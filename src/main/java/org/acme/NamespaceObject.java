package org.acme;

import io.quarkus.mongodb.panache.PanacheMongoEntity;
import java.util.List;
import java.util.Map;

public class NamespaceObject extends PanacheMongoEntity {

    private List<String> namespace;
    private String idempotent_key;
    private Map<String, String> properties;

    public NamespaceObject() {
    }

    public List<String> getNamespace() {
        return namespace;
    }

    public void setNamespace(List<String> namespace) {
        this.namespace = namespace;
    }

    public String getIdempotentKey() {
        return idempotent_key;
    }

    public void setIdempotentKey(String idempotent_key) {
        this.idempotent_key = idempotent_key;
    }

    public Map<String, String> getProperties() {
        return properties;
    }

    public void setProperties(Map<String, String> properties) {
        this.properties = properties;
    }
}
