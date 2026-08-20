package org.acme.enums;

public enum ActionType{
    ADD_SNAPSHOT("add-snapshot"),
    SET_SNAPSHOT_REF("set-snapshot-ref");

    private final String action;

    private ActionType(String action){
        this.action = action;
    }

    public String getAction(){
        return this.action;
    }
}
