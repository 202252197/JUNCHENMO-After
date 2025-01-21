package com.jcm.common.websocket.ceshi;

public class DestHost {
    private String host = "";
    private String username = "";
    private String password = "";
    private int port = 22;
    private int timeout = 60 * 60 * 1000;

    public DestHost(String host, String username, String password){
        this(host, username, password, 22, 60*60*1000);
    }

    public DestHost(String host, String username, String password, int timeout){
        this(host, username, password, 22, timeout);
    }

    public DestHost(String host, String username, String password, int port,
                    int timeout) {
        super();
        this.host = host;
        this.username = username;
        this.password = password;
        this.port = port;
        this.timeout = timeout;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getPort() {
        return port;
    }

    public void setPort(int port) {
        this.port = port;
    }

    public int getTimeout() {
        return timeout;
    }

    public void setTimeout(int timeout) {
        this.timeout = timeout;
    }
}