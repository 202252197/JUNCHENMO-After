package com.jcm.common.websocket;

import cn.hutool.core.io.IoUtil;
import cn.hutool.core.thread.ThreadUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.extra.ssh.ChannelType;
import cn.hutool.extra.ssh.JschUtil;
import com.jcm.common.websocket.model.SshModel;
import com.jcraft.jsch.ChannelShell;
import com.jcraft.jsch.JSchException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Arrays;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * WebSocket消息处理类，用于管理客户端连接、消息传递和关闭事件。
 *
 * @author junchenmo
 */
@Component
@ServerEndpoint(value = "/websocket/message")
public class WebSocketServer {

    // 存储每个会话对应的HandlerItem对象
    private static final ConcurrentHashMap<String, WebSocketServer.HandlerItem> HANDLER_ITEM_CONCURRENT_HASH_MAP = new ConcurrentHashMap<>();

    /**
     * 初始化方法，在Spring容器启动时调用，打印加载信息。
     */
    @PostConstruct
    public void init() {
        System.out.println("websocket 加载");
    }

    // 日志记录器
    private static Logger log = LoggerFactory.getLogger(SshHandler.class);

    // 在线用户计数器
    private static final AtomicInteger OnlineCount = new AtomicInteger(0);

    // 线程安全的集合，存储所有活动的Session对象
    private static CopyOnWriteArraySet<Session> SessionSet = new CopyOnWriteArraySet<>();

    /**
     * 当WebSocket连接建立时调用的方法。
     * 初始化SSH连接并启动读取线程。
     *
     * @param session WebSocket会话对象
     * @throws Exception 如果初始化失败
     */
    @OnOpen
    public void onOpen(javax.websocket.Session session) throws Exception {
        SessionSet.add(session); // 将当前会话添加到集合中
        SshModel sshItem = new SshModel(); // 创建SshModel对象
        sshItem.setHost("192.168.56.101"); // 设置SSH主机地址
        sshItem.setPort(22); // 设置SSH端口
        sshItem.setUser("root"); // 设置SSH用户名
        sshItem.setPassword("lvshihao"); // 设置SSH密码
        int cnt = OnlineCount.incrementAndGet(); // 增加在线用户计数
        log.info("有连接加入，当前连接数为：{}, sessionId={}", cnt, session.getId()); // 记录日志
        HandlerItem handlerItem = new HandlerItem(session, sshItem); // 创建HandlerItem对象
        handlerItem.startRead(); // 启动读取线程
        HANDLER_ITEM_CONCURRENT_HASH_MAP.put(session.getId(), handlerItem); // 将HandlerItem存入Map
    }

    /**
     * 当WebSocket连接关闭时调用的方法。
     * 减少在线用户计数并移除会话。
     *
     * @param session WebSocket会话对象
     */
    @OnClose
    public void onClose(javax.websocket.Session session) {
        SessionSet.remove(session); // 移除当前会话
        int cnt = OnlineCount.decrementAndGet(); // 减少在线用户计数
        log.info("有连接关闭，当前连接数为：{}", cnt); // 记录日志
    }

    /**
     * 当收到客户端消息时调用的方法。
     * 发送命令到SSH会话。
     *
     * @param message 客户端发送的消息
     * @param session WebSocket会话对象
     * @throws Exception 如果发送命令失败
     */
    @OnMessage
    public void onMessage(String message, javax.websocket.Session session) throws Exception {
        log.info("来自客户端的消息：{}", message); // 记录日志
        HandlerItem handlerItem = HANDLER_ITEM_CONCURRENT_HASH_MAP.get(session.getId()); // 获取HandlerItem
        this.sendCommand(handlerItem, message); // 发送命令
    }

    /**
     * 当发生错误时调用的方法。
     * 记录错误信息。
     *
     * @param session WebSocket会话对象
     * @param error 错误信息
     */
    @OnError
    public void onError(javax.websocket.Session session, Throwable error) {
        log.error("发生错误：{}，Session ID： {}", error.getMessage(), session.getId()); // 记录错误日志
        error.printStackTrace(); // 打印堆栈跟踪
    }

    /**
     * 发送命令到SSH会话。
     *
     * @param handlerItem HandlerItem对象
     * @param data 命令内容
     * @throws Exception 如果发送命令失败
     */
    private void sendCommand(WebSocketServer.HandlerItem handlerItem, String data) throws Exception {
        if (handlerItem.checkInput(data)) { // 检查输入是否有效
            handlerItem.outputStream.write(data.getBytes()); // 发送命令
        } else {
            handlerItem.outputStream.write("没有执行相关命令权限".getBytes()); // 发送拒绝信息
            handlerItem.outputStream.flush();
            handlerItem.outputStream.write(new byte[]{3}); // 发送终止字符
        }
        handlerItem.outputStream.flush(); // 刷新输出流
    }

    /**
     * 内部类，用于处理每个WebSocket会话。
     */
    private class HandlerItem implements Runnable {
        private final javax.websocket.Session session; // WebSocket会话对象
        private final InputStream inputStream; // 输入流
        private final OutputStream outputStream; // 输出流
        private final com.jcraft.jsch.Session openSession; // SSH会话
        private final ChannelShell channel; // SSH通道
        private final SshModel sshItem; // SSH配置
        private final StringBuilder nowLineInput = new StringBuilder(); // 当前行输入缓存

        /**
         * 构造函数，初始化SSH连接。
         *
         * @param session WebSocket会话对象
         * @param sshItem SSH配置
         * @throws IOException 如果初始化失败
         */
        HandlerItem(javax.websocket.Session session, SshModel sshItem) throws IOException {
            this.session = session;
            this.sshItem = sshItem;
            this.openSession = JschUtil.openSession(sshItem.getHost(), sshItem.getPort(), sshItem.getUser(), sshItem.getPassword()); // 打开SSH会话
            this.channel = (ChannelShell) JschUtil.createChannel(openSession, ChannelType.SHELL); // 创建SSH通道
            this.inputStream = channel.getInputStream(); // 获取输入流
            this.outputStream = channel.getOutputStream(); // 获取输出流
        }

        /**
         * 启动读取线程。
         *
         * @throws JSchException 如果连接失败
         */
        void startRead() throws JSchException {
            this.channel.connect(); // 连接SSH通道
            ThreadUtil.execute(this); // 启动读取线程
        }

        /**
         * 添加命令到队列。
         *
         * @param msg 输入内容
         * @return 当前待确认的所有命令
         */
        private String append(String msg) {
            char[] x = msg.toCharArray();
            if (x.length == 1 && x[0] == 127) { // 处理退格键
                int length = nowLineInput.length();
                if (length > 0) {
                    nowLineInput.delete(length - 1, length); // 删除最后一个字符
                }
            } else {
                nowLineInput.append(msg); // 添加输入内容
            }
            return nowLineInput.toString();
        }

        /**
         * 检查输入是否有效。
         *
         * @param msg 输入内容
         * @return 是否允许执行命令
         */
        public boolean checkInput(String msg) {
            String allCommand = this.append(msg); // 添加命令到队列
            boolean refuse;
            if (StrUtil.equalsAny(msg, StrUtil.CR, StrUtil.TAB)) { // 检查特殊字符
                String join = nowLineInput.toString();
                if (StrUtil.equals(msg, StrUtil.CR)) { // 回车键
                    nowLineInput.setLength(0); // 清空当前行输入
                }
                refuse = SshModel.checkInputItem(sshItem, join); // 检查命令权限
            } else {
                // 复制输出
                refuse = SshModel.checkInputItem(sshItem, msg); // 检查命令权限
            }
            return refuse;
        }

        /**
         * 读取SSH输出并发送给客户端。
         */
        @Override
        public void run() {
            try {
                byte[] buffer = new byte[1024]; // 缓冲区
                int i;
                while ((i = inputStream.read(buffer)) != -1) { // 读取SSH输出
                    sendBinary(session, new String(Arrays.copyOfRange(buffer, 0, i), sshItem.getCharsetT())); // 发送输出到客户端
                }
            } catch (Exception e) {
                if (!this.openSession.isConnected()) { // 检查SSH会话是否已断开
                    return;
                }
                WebSocketServer.this.destroy(this.session); // 销毁资源
            }
        }
    }

    /**
     * 销毁资源，关闭SSH连接和WebSocket会话。
     *
     * @param session WebSocket会话对象
     */
    public void destroy(javax.websocket.Session session) {
        WebSocketServer.HandlerItem handlerItem = HANDLER_ITEM_CONCURRENT_HASH_MAP.get(session.getId()); // 获取HandlerItem
        if (handlerItem != null) {
            IoUtil.close(handlerItem.inputStream); // 关闭输入流
            IoUtil.close(handlerItem.outputStream); // 关闭输出流
            JschUtil.close(handlerItem.channel); // 关闭SSH通道
            JschUtil.close(handlerItem.openSession); // 关闭SSH会话
        }
        IoUtil.close(session); // 关闭WebSocket会话
        HANDLER_ITEM_CONCURRENT_HASH_MAP.remove(session.getId()); // 从Map中移除HandlerItem
    }

    /**
     * 发送二进制数据到客户端。
     *
     * @param session WebSocket会话对象
     * @param msg 数据内容
     */
    private static void sendBinary(javax.websocket.Session session, String msg) {
        try {
            System.out.println("#####:" + msg); // 打印输出内容
            session.getBasicRemote().sendText(msg); // 发送文本消息
        } catch (IOException e) {
            // 忽略异常
        }
    }
}
