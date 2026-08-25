package org.acme.enums;

public enum ActionType{
    ADD_SNAPSHOT("add-snapshot"),
    SET_SNAPSHOT_REF("set-snapshot-ref"),
    REMOVE_SNAPSHOT_REF("remove-snapshot-ref"),
    REMOVE_SNAPSHOTS("remove-snapshots"),
    ASSIGN_UUID("assign-uuid"),
    UPGRADE_FORMAT_VERSION("upgrade-format-version"),
    SET_LOCATION("set-location");

    private final String action;

    private ActionType(String action){
        this.action = action;
    }

    public String getAction(){
        return this.action;
    }
}
