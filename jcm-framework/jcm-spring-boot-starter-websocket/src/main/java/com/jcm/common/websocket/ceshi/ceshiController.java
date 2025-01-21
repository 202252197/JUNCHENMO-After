package com.jcm.common.websocket.ceshi;

import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.io.InputStream;

public class ceshiController {


        private static final String ENCODING = "UTF-8";

        public static Session getJSchSession(DestHost destHost) throws JSchException {
            JSch jsch = new JSch();

            Session session = jsch.getSession(destHost.getUsername(), destHost.getHost(), destHost.getPort());
            session.setPassword(destHost.getPassword());
            session.setConfig("StrictHostKeyChecking", "no");//第一次访问服务器不用输入yes
            session.setTimeout(destHost.getTimeout());
            session.connect();

            return session;
        }

        public static String execCommandByJSch(Session session, String command, String  resultEncoding) throws IOException,JSchException{

            //1.默认方式，执行单句命令
            ChannelExec channelExec = (ChannelExec) session.openChannel("exec");
            InputStream in = channelExec.getInputStream();
            channelExec.setCommand(command);
            channelExec.setErrStream(System.err);
            channelExec.connect();
            String result = IOUtils.toString(in, resultEncoding);
            channelExec.disconnect();

            return result;
        }

}
