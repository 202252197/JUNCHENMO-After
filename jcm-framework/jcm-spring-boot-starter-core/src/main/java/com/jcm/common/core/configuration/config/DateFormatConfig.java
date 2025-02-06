package com.jcm.common.core.configuration.config;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.deser.std.StdScalarDeserializer;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.jackson.Jackson2ObjectMapperBuilderCustomizer;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.TimeZone;


/**
 * 自定义Jackson配置
 */
@Configuration
public class DateFormatConfig implements Jackson2ObjectMapperBuilderCustomizer , Ordered {

    @Value("yyyy-MM-dd HH:mm:ss")
    private String dateTimePattern;
    @Value("yyyy-MM-dd")
    private String datePattern;
    public static DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    @Override
    public void customize(Jackson2ObjectMapperBuilder builder) {
        // 将入参中的空字符串""转为null
        builder.deserializerByType(String.class, new StdScalarDeserializer<String>(String.class) {
            @Override
            public String deserialize(JsonParser jsonParser, DeserializationContext ctx)
                    throws IOException {
                // 重点在这儿:如果为空白则返回null
                String value = jsonParser.getValueAsString();
                if (value == null || "".equals(value.trim())) {
                    return null;
                }
                return value;
            }
        });

        // 设置java.util.Date时间类的序列化以及反序列化的格式
        builder.simpleDateFormat(dateTimePattern);

        JavaTimeModule javaTimeModule = new JavaTimeModule();
        //格式化java.sql.Date类型，默认格式为：yyyy-MM-dd
        javaTimeModule.addSerializer(java.sql.Date.class, new SqlDateSerializer());
        javaTimeModule.addDeserializer(java.sql.Date.class, new SqlDateDeserializer());
        //格式化java.time.LocalDateTime类型，默认格式为：yyyy-MM-dd HH:mm:ss
        javaTimeModule.addSerializer(LocalDateTime.class, new LocalDateTimeSerializer());
        javaTimeModule.addDeserializer(LocalDateTime.class, new LocalDateTimeDeserializer());
        //格式化java.time.LocalDate类型，默认格式为：yyyy-MM-dd
        javaTimeModule.addSerializer(LocalDate.class, new LocalDateSerializer());
        javaTimeModule.addDeserializer(LocalDate.class, new LocalDateDeserializer());
        builder.modules(javaTimeModule).timeZone(TimeZone.getDefault());
    }

    @Override
    public int getOrder() {
        return 1;
    }


    /**
     * @author junchenmo
     * @description java sql Date 时间类型装换
     * @date 2020/9/1 17:25
     */
    public class SqlDateSerializer extends JsonSerializer<java.sql.Date> {
        @Override
        public void serialize(java.sql.Date date, JsonGenerator gen, SerializerProvider provider) throws IOException {
            String formattedDate = dateFormat.format(date);
            gen.writeString(formattedDate);
        }
    }

    public class SqlDateDeserializer extends JsonDeserializer<java.sql.Date> {

        @Override
        public java.sql.Date deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException {
            try {
                return (java.sql.Date) dateFormat.parse(jsonParser.getValueAsString());
            } catch (ParseException e) {
                throw new RuntimeException("Could not parse date", e);
            }
        }
    }
    /**
     * @author junchenmo
     * @description LocalDateTime 时间类型装换
     * @date 2020/9/1 17:25
     */
    public class LocalDateTimeSerializer extends JsonSerializer<LocalDateTime> {
        @Override
        public void serialize(LocalDateTime value, JsonGenerator gen, SerializerProvider serializers) throws IOException {
            gen.writeString(value.format(DateTimeFormatter.ofPattern(dateTimePattern)));
        }
    }

    public class LocalDateTimeDeserializer extends JsonDeserializer<LocalDateTime> {
        @Override
        public LocalDateTime deserialize(JsonParser p, DeserializationContext deserializationContext) throws IOException {
            return LocalDateTime.parse(p.getValueAsString(), DateTimeFormatter.ofPattern(dateTimePattern));
        }
    }

    /**
     * @author junchenmo
     * @description LocalDate 时间类型装换
     * @date 2020/9/1 17:25
     */
    public class LocalDateSerializer extends JsonSerializer<LocalDate> {
        @Override
        public void serialize(LocalDate value, JsonGenerator gen, SerializerProvider serializers) throws IOException {
            gen.writeString(value.format(DateTimeFormatter.ofPattern(datePattern)));
        }
    }

    public class LocalDateDeserializer extends JsonDeserializer<LocalDate> {
        @Override
        public LocalDate deserialize(JsonParser p, DeserializationContext deserializationContext) throws IOException {
            return LocalDate.parse(p.getValueAsString(), DateTimeFormatter.ofPattern(datePattern));
        }
    }
}