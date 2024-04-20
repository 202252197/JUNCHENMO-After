package com.jcm.common.mybatis.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.jcm.common.core.context.SecurityContextHolder;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@AutoConfiguration
@Component
public class MybatisPlusMetaObjectHeadlerConfig  implements MetaObjectHandler {
    /**
     * 使用mp做添加操作时候，这个方法执行
     * @param metaObject
     */
    @Override
    public void insertFill(MetaObject metaObject) {
        //设置属性值
        this.setFieldValByName("createTime", LocalDateTime.now(),metaObject);
        this.setFieldValByName("updateTime",  LocalDateTime.now(),metaObject);
        this.setFieldValByName("creator", SecurityContextHolder.getUserName(),metaObject);
    }

    /**
     * 使用mp做修改操作时候，这个方法执行
     * @param metaObject
     */
    @Override
    public void updateFill(MetaObject metaObject) {
        this.setFieldValByName("updateTime", LocalDateTime.now(),metaObject);
        this.setFieldValByName("updater", SecurityContextHolder.getUserName(),metaObject);
    }
}
