package com.jcm.common.websocket;

import com.jcm.common.websocket.ceshi.DestHost;
import com.jcm.common.websocket.ceshi.ceshiController;
import com.jcraft.jsch.JSchException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.Semaphore;

import static com.jcm.common.websocket.ceshi.ceshiController.execCommandByJSch;

/**
 * websocket 消息处理
 * 
 * @author junchenmo
 */
@Component
@ServerEndpoint(value = "/websocket/message")
public class WebSocketServer
{
    /**
     * WebSocketServer 日志控制器
     */
    private static final Logger LOGGER = LoggerFactory.getLogger(WebSocketServer.class);

    /**
     * 默认最多允许同时在线人数100
     */
    public static int socketMaxOnlineCount = 100;

    private static Semaphore socketSemaphore = new Semaphore(socketMaxOnlineCount);

    /**
     * 连接建立成功调用的方法
     */
    @OnOpen
    public void onOpen(Session session) throws Exception
    {
        boolean semaphoreFlag = false;
        // 尝试获取信号量
        semaphoreFlag = SemaphoreUtils.tryAcquire(socketSemaphore);
        if (!semaphoreFlag)
        {
            // 未获取到信号量
            LOGGER.error("\n 当前在线人数超过限制数- {}", socketMaxOnlineCount);
            WebSocketUsers.sendMessageToUserByText(session, "当前在线人数超过限制数：" + socketMaxOnlineCount);
            session.close();
        }
        else
        {
            // 添加用户
            DestHost destHost =new DestHost("192.168.56.101","root","lvshihao");
            try {
                WebSocketSystem.put(session.getId(),ceshiController.getJSchSession(destHost));
            } catch (JSchException e) {
                throw new RuntimeException(e);
            }
            WebSocketUsers.put(session.getId(), session);
            LOGGER.info("\n 建立连接 - {}", session);
            LOGGER.info("\n 当前人数 - {}", WebSocketUsers.getUsers().size());
            WebSocketUsers.sendMessageToUserByText(session, "连接成功");
        }
    }

    /**
     * 连接关闭时处理
     */
    @OnClose
    public void onClose(Session session)
    {
        LOGGER.info("\n 关闭连接 - {}", session);
        // 移除用户
        boolean removeFlag = WebSocketUsers.remove(session.getId());
        if (!removeFlag)
        {
            // 获取到信号量则需释放
            SemaphoreUtils.release(socketSemaphore);
        }
    }

    /**
     * 抛出异常时处理
     */
    @OnError
    public void onError(Session session, Throwable exception) throws Exception
    {
        if (session.isOpen())
        {
            // 关闭连接
            session.close();
        }
        String sessionId = session.getId();
        LOGGER.info("\n 连接异常 - {}", sessionId);
        LOGGER.info("\n 异常信息 - {}", exception);
        // 移出用户
        WebSocketUsers.remove(sessionId);
        // 获取到信号量则需释放
        SemaphoreUtils.release(socketSemaphore);
    }

    /**
     * 服务器接收到客户端消息时调用的方法
     */
    @OnMessage
    public void onMessage(String message, Session session) throws JSchException, IOException {
        System.out.println(message);
        String[] split = message.split("jcm");
        System.out.println(split);
        com.jcraft.jsch.Session systemSession = WebSocketSystem.getSystemSession(session.getId());
        if(split[0].equals("~")){
            // 模拟服务端消息处理
            String context = execCommandByJSch(systemSession, split[1]+";pwd;", "UTF-8");
            System.out.println(context);
            String pwd = "~";
            String[] parts = context.split("\n");
            if (parts.length >= 2) {
                pwd = parts[parts.length - 1];
            } else {
                pwd = parts[0];
            }
            WebSocketUsers.sendMessageToUserByText(session,pwd+"||"+context );
        }else{
            // 模拟服务端消息处理
            String context = execCommandByJSch(systemSession, "cd "+split[0]+";"+split[1]+";pwd;", "UTF-8");
            System.out.println(context);
            String pwd = "~";
            String[] parts = context.split("\n");
            if (parts.length >= 2) {
                pwd = parts[parts.length - 1];
                WebSocketUsers.sendMessageToUserByText(session,pwd+"||"+context.replace(parts[parts.length - 1],"") );

            } else {
                pwd = parts[0];
                WebSocketUsers.sendMessageToUserByText(session,pwd+"||"+"");
            }
        }
     ;
    }
}
