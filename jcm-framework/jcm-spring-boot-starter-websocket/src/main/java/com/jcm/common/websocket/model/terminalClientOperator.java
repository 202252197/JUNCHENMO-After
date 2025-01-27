package com.jcm.common.websocket.model;

public enum terminalClientOperator {

    KEY("0"),

    CONNECT("1"),

    PING("2"),

    PONG("3"),

    RESIZE("4"),

    COMMAND("5"),

    CLEAR("6");

    terminalClientOperator(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
    private String value;
}
