package com.jcm.gen.configuration;

import com.alibaba.dashscope.aigc.conversation.Conversation;
import com.alibaba.dashscope.aigc.conversation.ConversationParam;
import com.alibaba.dashscope.aigc.conversation.ConversationResult;
import com.alibaba.dashscope.common.Message;
import com.alibaba.dashscope.common.Role;
import com.alibaba.dashscope.exception.ApiException;
import com.alibaba.dashscope.exception.InputRequiredException;
import com.alibaba.dashscope.exception.NoApiKeyException;
import com.alibaba.fastjson2.JSONObject;
import com.jcm.common.redis.service.RedisService;
import io.reactivex.Flowable;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

/**
 * @author lvshihao
 */
@Component
@AllArgsConstructor
public class TableGeneratorConfig {

    /**
     * 系统生成表的消息内容配置
     */
    private static final String SYSTEM_TABLE_MESSAGE_CONTENT = "{" +
            "    id: number\n" +
            "    name: string | undefined\n" +
            "    type: string | undefined\n" +
            "    length: number | undefined\n" +
            "    point: number | undefined\n" +
            "    notNull: boolean\n" +
            "    primaryKey: boolean\n" +
            "    comment: string\n" +
            "}你是一个专业的mysql数据库管理员，你可以生成所有描述场景的表结构而且非常详细，结构是Json数组类型，name是列的名称，" +
            "type是列的类型(类型名称小写),length是列数据的长度,point是列的小数点位数,notNull代表这个字段不能为空,primaryKey代表这是主键,comment是列的注释。最后要求只需要给我json数组的数据，要求是纯文本json字符串,除此以外不要返回任何数据。";
    /**
     * 系统生成Sql的消息内容配置
     */
    private static final String SYSTEM_TABLE_SQL_MESSAGE_CONTENT = "" +
            "你是一个专业的mysql数据库管理员，按照我给你数据表的JSON数组数据生成创建表的Sql语句，每一个json都是一行列的信息，name是列的名称，" +
            "type是列的类型(类型名称小写),length是列数据的长度,point是列的小数点位数,notNull代表这个字段不能为空,primaryKey代表这是主键,comment是列的注释。最后要求只需要给我创建表的sql语句，要求是纯文本sql字符串,除此以外不要返回任何数据。";
    private final TableGeneratorProperties properties;
    private final RedisService redisService;

    /**
     * 根据给定的表名称生成相应的MySQL表结构的JSON数组数据
     *
     * @param prompts 要生成表结构的prompts
     * @return 生成的表结构对应的JSON数组数据，如果出现异常则返回null
     */
    public HashMap<String, String> generateTableStructure(String prompts) throws ApiException {
        try {
            HashMap<String, String> data = new HashMap<>();
            String[] split = prompts.split("\\|jcm\\|");
            //第二次请求
            if (split.length == 2 && redisService.hasKey("aiTable:" + split[0])) {
                String requestId = split[0];
                return handleQuestionPrompts(requestId, prompts, data, true);
            } else {
                return handleQuestionPrompts(null, prompts, data, false);
            }

        } catch (ApiException | NoApiKeyException | InputRequiredException e) {
            System.err.println("错误信息：" + e.getMessage());
            System.out.println("请参考文档：https://help.aliyun.com/zh/model-studio/developer-reference/error-code");
            return null;
        }
    }

    private HashMap<String, String> handleQuestionPrompts(String requestId, String prompts, HashMap<String, String> data, boolean isAfterward) throws NoApiKeyException, InputRequiredException {
        List<JSONObject> messageList = new ArrayList<>();
        if (isAfterward) {
            // 获取上一次的消息集合
            messageList = redisService.getCacheList("aiTable:" + requestId);
        } else {
            // 添加系统消息
            JSONObject system = new JSONObject();
            system.put("role", Role.SYSTEM.getValue());
            system.put("content", SYSTEM_TABLE_MESSAGE_CONTENT);
            messageList.add(system);
        }

        // 添加用户消息
        JSONObject user = new JSONObject();
        user.put("role", Role.USER.getValue());
        user.put("content", prompts);
        messageList.add(user);

        // 将jsonObj转换成Message
        List<Message> messages = new ArrayList<>();
        messageList.stream().forEach(jsonObject -> {
            Message message = new Message();
            message.setRole(String.valueOf(jsonObject.get("role")));
            message.setContent(String.valueOf(jsonObject.get("content")));
            messages.add(message);
        });

        ConversationParam param = ConversationParam.builder()
                .apiKey(properties.getApiKey())
                .model(properties.getModel())
                .messages(messages)
                .build();
        Conversation gen = new Conversation();
        Flowable<ConversationResult> result = gen.streamCall(param);

        List<String> tests = new ArrayList<>();
        AtomicReference<String> requestIdRef = new AtomicReference<>(requestId);
        result.blockingForEach(msg -> {
            if (!isAfterward) {
                requestIdRef.set(msg.getRequestId());
            }
            String text = msg.getOutput().getText();
            tests.add(text);
        });

        // 获取更新后的requestId
        requestId = requestIdRef.get();

        // 添加助手消息
        JSONObject assistant = new JSONObject();
        assistant.put("role", Role.ASSISTANT.getValue());
        assistant.put("content", tests.get(tests.size() - 1));
        messageList.add(assistant);

        // 保存消息列表到Redis
        redisService.setCacheList("aiTable:" + requestId, messageList);
        data.put("context", tests.get(tests.size() - 1));
        data.put("requestId", requestId);
        return data;
    }

    public String generateSqlStructure(String prompts) {
        try {
            // 添加系统消息
            Message system = new Message();
            system.setRole(Role.SYSTEM.getValue());
            system.setContent(SYSTEM_TABLE_SQL_MESSAGE_CONTENT);
            // 添加用户消息
            Message user = new Message();
            user.setRole(Role.USER.getValue());
            user.setContent(prompts);

            ConversationParam param = ConversationParam.builder()
                    .apiKey(properties.getApiKey())
                    .model(properties.getModel())
                    .messages(Arrays.asList(system, user))
                    .build();
            Conversation gen = new Conversation();
            Flowable<ConversationResult> result = gen.streamCall(param);

            List<String> tests = new ArrayList<>();
            result.blockingForEach(msg -> {
                String text = msg.getOutput().getText();
                tests.add(text);
            });
            System.out.println("返回数据:\n" + tests.get(tests.size() - 1));
            return tests.get(tests.size() - 1);
        } catch (ApiException | NoApiKeyException | InputRequiredException e) {
            System.err.println("错误信息：" + e.getMessage());
            System.out.println("请参考文档：https://help.aliyun.com/zh/model-studio/developer-reference/error-code");
            return null;
        }
    }
}