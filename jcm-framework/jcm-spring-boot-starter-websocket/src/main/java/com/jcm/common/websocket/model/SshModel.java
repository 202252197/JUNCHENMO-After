package com.jcm.common.websocket.model;

import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson2.JSONArray;

import java.nio.charset.Charset;
import java.util.List;

// 假设这些工具类存在
class EnumUtil {
    public static <T extends Enum<T>> T fromString(Class<T> enumClass, String value, T defaultValue) {
        // 简单示例实现，实际需完善
        try {
            return Enum.valueOf(enumClass, value);
        } catch (IllegalArgumentException e) {
            return defaultValue;
        }
    }
}

class StringUtil {
    public static <T> List<T> jsonConvertArray(String json, Class<T> clazz) {
        // 简单示例实现，实际需完善
        return null;
    }
}

class FileUtil {
    public static String normalize(String path) {
        // 简单示例实现，实际需完善
        return path;
    }
}

class CharsetUtil {
    public static final Charset CHARSET_UTF_8 = Charset.forName("UTF-8");
}

/**
 * @ProjectName SshModel
 * @author Administrator
 * @version 1.0.0
 * @Description SshModel实体类
 * @createTime 2022/5/2 0002 15:29
 */
public class SshModel {

    private String name;
    private String host;
    private Integer port;
    private String user;
    private String password;
    /**
     * 编码格式
     */
    private String charset;

    /**
     * 文件目录
     */
    private String fileDirs;

    /**
     * ssh 私钥
     */
    private String privateKey;

    private String connectType;

    /**
     * 不允许执行的命令
     */
    private String notAllowedCommand;

    /**
     * 允许编辑的后缀文件
     */
    private String allowEditSuffix;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNotAllowedCommand() {
        return notAllowedCommand;
    }

    public void setNotAllowedCommand(String notAllowedCommand) {
        this.notAllowedCommand = notAllowedCommand;
    }

    public ConnectType connectType() {
        return EnumUtil.fromString(ConnectType.class, this.connectType, ConnectType.PASS);
    }

    public String getConnectType() {
        return connectType;
    }

    public void setConnectType(String connectType) {
        this.connectType = connectType;
    }

    public String getPrivateKey() {
        return privateKey;
    }

    public void setPrivateKey(String privateKey) {
        this.privateKey = privateKey;
    }

    public String getFileDirs() {
        return fileDirs;
    }

    public void setFileDirs(String fileDirs) {
        this.fileDirs = fileDirs;
    }

    public List<String> fileDirs() {
        return StringUtil.jsonConvertArray(this.fileDirs, String.class);
    }

    public void fileDirs(List<String> fileDirs) {
        if (fileDirs != null) {
            for (int i = fileDirs.size() - 1; i >= 0; i--) {
                String s = fileDirs.get(i);
                fileDirs.set(i, FileUtil.normalize(s));
            }
            this.fileDirs = JSONArray.toJSONString(fileDirs);
        } else {
            this.fileDirs = null;
        }
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public Integer getPort() {
        return port;
    }

    public void setPort(Integer port) {
        this.port = port;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCharset() {
        return charset;
    }

    public void setCharset(String charset) {
        this.charset = charset;
    }

    public Charset getCharsetT() {
        Charset charset;
        try {
            charset = Charset.forName(this.getCharset());
        } catch (Exception e) {
            charset = CharsetUtil.CHARSET_UTF_8;
        }
        return charset;
    }

    public List<String> allowEditSuffix() {
        return StringUtil.jsonConvertArray(this.allowEditSuffix, String.class);
    }

    public void allowEditSuffix(List<String> allowEditSuffix) {
        if (allowEditSuffix == null) {
            this.allowEditSuffix = null;
        } else {
            this.allowEditSuffix = JSONArray.toJSONString(allowEditSuffix);
        }
    }

    public String getAllowEditSuffix() {
        return allowEditSuffix;
    }

    public void setAllowEditSuffix(String allowEditSuffix) {
        this.allowEditSuffix = allowEditSuffix;
    }

    /**
     * 检查是否包含禁止命令
     *
     * @param sshItem   实体
     * @param inputItem 输入的命令
     * @return false 存在禁止输入的命令
     */
    public static boolean checkInputItem(SshModel sshItem, String inputItem) {
        // 检查禁止执行的命令
        String notAllowedCommand = StrUtil.emptyToDefault(sshItem.getNotAllowedCommand(), StrUtil.EMPTY).toLowerCase();
        if (StrUtil.isEmpty(notAllowedCommand)) {
            return true;
        }
        List<String> split = StrUtil.split(notAllowedCommand, StrUtil.COMMA);
        inputItem = inputItem.toLowerCase();
        List<String> commands = StrUtil.split(inputItem, StrUtil.CR);
        commands.addAll(StrUtil.split(inputItem, "&"));
        for (String s : split) {
            //
            boolean anyMatch = commands.stream().anyMatch(item -> StrUtil.startWithAny(item, s + StrUtil.SPACE, ("&" + s + StrUtil.SPACE), StrUtil.SPACE + s + StrUtil.SPACE));
            if (anyMatch) {
                return false;
            }
            //
            anyMatch = commands.stream().anyMatch(item -> StrUtil.equals(item, s));
            if (anyMatch) {
                return false;
            }
        }
        return true;
    }

    public enum ConnectType {
        /**
         * 账号密码
         */
        PASS,
        /**
         * 密钥
         */
        PUBKEY
    }
}