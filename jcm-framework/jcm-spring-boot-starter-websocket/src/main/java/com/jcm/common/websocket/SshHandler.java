package com.jcm.common.websocket;

import cn.hutool.core.io.IoUtil;
import cn.hutool.core.thread.ThreadUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.extra.ssh.ChannelType;
import cn.hutool.extra.ssh.JschUtil;
import com.jcm.common.websocket.model.SshModel;
import com.jcraft.jsch.ChannelShell;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Arrays;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * @ProjectName SshHandler
 * @author qingfeng
 * @version 1.0.0
 * @Description ssh 处理
 * @createTime 2022/5/2 0002 15:26
 */
@ServerEndpoint(value = "/ws/ssh")
@Component
public class SshHandler {
    private static final ConcurrentHashMap<String, HandlerItem> HANDLER_ITEM_CONCURRENT_HASH_MAP = new ConcurrentHashMap<>();

    @PostConstruct
    public void init() {
        System.out.println("websocket 加载");
    }

    private static Logger log = LoggerFactory.getLogger(SshHandler.class);
    private static final AtomicInteger OnlineCount = new AtomicInteger(0);
    // concurrent包的线程安全Set，用来存放每个客户端对应的Session对象。
    private static CopyOnWriteArraySet<javax.websocket.Session> SessionSet = new CopyOnWriteArraySet<>();


    /**
     * 连接建立成功调用的方法
     */
    @OnOpen
    public void onOpen(javax.websocket.Session session) throws Exception {
        SessionSet.add(session);
        SshModel sshItem = new SshModel();
        sshItem.setHost("127.0.0.1");
        sshItem.setPort(22);
        sshItem.setUser("root");
        sshItem.setPassword("root");
        int cnt = OnlineCount.incrementAndGet(); // 在线数加1
        log.info("有连接加入，当前连接数为：{},sessionId={}", cnt, session.getId());
        SendMessage(session, "连接成功，sessionId=" + session.getId());
        HandlerItem handlerItem = new HandlerItem(session, sshItem);
        handlerItem.startRead();
        HANDLER_ITEM_CONCURRENT_HASH_MAP.put(session.getId(), handlerItem);
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose(javax.websocket.Session session) {
        SessionSet.remove(session);
        int cnt = OnlineCount.decrementAndGet();
        log.info("有连接关闭，当前连接数为：{}", cnt);
    }

    /**
     * 收到客户端消息后调用的方法
     *
     * @param message 客户端发送过来的消息
     */
    @OnMessage
    public void onMessage(String message, javax.websocket.Session session) throws Exception {
        log.info("来自客户端的消息：{}", message);
        //        SendMessage(session, "收到消息，消息内容："+message);
        HandlerItem handlerItem = HANDLER_ITEM_CONCURRENT_HASH_MAP.get(session.getId());
        this.sendCommand(handlerItem, message);
    }

    /**
     * 出现错误
     *
     * @param session
     * @param error
     */
    @OnError
    public void onError(javax.websocket.Session session, Throwable error) {
        log.error("发生错误：{}，Session ID： {}", error.getMessage(), session.getId());
        error.printStackTrace();
    }

    private void sendCommand(HandlerItem handlerItem, String data) throws Exception {
        if (handlerItem.checkInput(data)) {
            handlerItem.outputStream.write(data.getBytes());
        } else {
            handlerItem.outputStream.write("没有执行相关命令权限".getBytes());
            handlerItem.outputStream.flush();
            handlerItem.outputStream.write(new byte[]{3});
        }
        handlerItem.outputStream.flush();
    }

    /**
     * 发送消息，实践表明，每次浏览器刷新，session会发生变化。
     *
     * @param session
     * @param message
     */
    public static void SendMessage(javax.websocket.Session session, String message) {
        try {
            //            session.getBasicRemote().sendText(String.format("%s (From Server，Session ID=%s)",message,session.getId()));
            session.getBasicRemote().sendText(message);
            session.getBasicRemote().sendText("anxingtao>$");
        } catch (IOException e) {
            log.error("发送消息出错：{}", e.getMessage());
            e.printStackTrace();
        }
    }

    protected class HandlerItem implements Runnable {
        private final javax.websocket.Session session;
        private final InputStream inputStream;
        private final OutputStream outputStream;
        private final Session openSession;
        private final ChannelShell channel;
        private final SshModel sshItem;
        private final StringBuilder nowLineInput = new StringBuilder();

        HandlerItem(javax.websocket.Session session, SshModel sshItem) throws IOException {
            this.session = session;
            this.sshItem = sshItem;
            this.openSession = JschUtil.openSession(sshItem.getHost(), sshItem.getPort(), sshItem.getUser(), sshItem.getPassword());
            this.channel = (ChannelShell) JschUtil.createChannel(openSession, ChannelType.SHELL);
            this.inputStream = channel.getInputStream();
            this.outputStream = channel.getOutputStream();
        }

        void startRead() throws JSchException {
            this.channel.connect();
            ThreadUtil.execute(this);
        }


        /**
         * 添加到命令队列
         *
         * @param msg 输入
         * @return 当前待确认待所有命令
         */
        private String append(String msg) {
            char[] x = msg.toCharArray();
            if (x.length == 1 && x[0] == 127) {
                // 退格键
                int length = nowLineInput.length();
                if (length > 0) {
                    nowLineInput.delete(length - 1, length);
                }
            } else {
                nowLineInput.append(msg);
            }
            return nowLineInput.toString();
        }

        public boolean checkInput(String msg) {
            String allCommand = this.append(msg);
            boolean refuse;
            if (StrUtil.equalsAny(msg, StrUtil.CR, StrUtil.TAB)) {
                String join = nowLineInput.toString();
                if (StrUtil.equals(msg, StrUtil.CR)) {
                    nowLineInput.setLength(0);
                }
                refuse = SshModel.checkInputItem(sshItem, join);
            } else {
                // 复制输出
                refuse = SshModel.checkInputItem(sshItem, msg);
            }
            return refuse;
        }


        @Override
        public void run() {
            try {
                byte[] buffer = new byte[1024];
                int i;
                //如果没有数据来，线程会一直阻塞在这个地方等待数据。
                while ((i = inputStream.read(buffer)) != -1) {
                    sendBinary(session, new String(Arrays.copyOfRange(buffer, 0, i), sshItem.getCharsetT()));
                }
            } catch (Exception e) {
                if (!this.openSession.isConnected()) {
                    return;
                }

                SshHandler.this.destroy(this.session);
            }
        }
    }

    public void destroy(javax.websocket.Session session) {
        HandlerItem handlerItem = HANDLER_ITEM_CONCURRENT_HASH_MAP.get(session.getId());
        if (handlerItem != null) {
            IoUtil.close(handlerItem.inputStream);
            IoUtil.close(handlerItem.outputStream);
            JschUtil.close(handlerItem.channel);
            JschUtil.close(handlerItem.openSession);
        }
        IoUtil.close(session);
        HANDLER_ITEM_CONCURRENT_HASH_MAP.remove(session.getId());
    }

    private static void sendBinary(javax.websocket.Session session, String msg) {
        //		if (!session.isOpen()) {
        //			// 会话关闭不能发送消息 @author jzy 21-08-04
        //			return;
        //		}

        //		synchronized (session.getId()) {
        //			BinaryMessage byteBuffer = new BinaryMessage(msg.getBytes());
        try {
            System.out.println("#####:" + msg);
            session.getBasicRemote().sendText(msg);
        } catch (IOException e) {
        }
        //		}
    }
}