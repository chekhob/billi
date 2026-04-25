package org.acme;

public class NamespaceProperties {
    public String owner;
    public String location;

    public NamespaceProperties(String owner){
        this.owner = owner;
    }
    public String getOwner() {
        return owner;
    }
    public String getLocation(){
        return location;
    }
    
    public void setLocation(String location) {
        this.location = location;
    }
    
    public void setOwner(String owner) {
        this.owner = owner;
    }
    
    public NamespaceProperties() {
        // no-args constructor for Jackson
    }
}