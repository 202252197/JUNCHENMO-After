package com.jcm.gen.service;

import com.jcm.gen.JcmGenApplication;
import com.jcm.gen.domain.GenTable;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

@SpringBootTest(classes = JcmGenApplication.class)
@ExtendWith(SpringExtension.class) // 添加此行
class IGenTableServiceTest {
    @Autowired
    private IGenTableService genTableService;

    @Test
    void selectDbTableList() {
        List<GenTable> genTables = genTableService.selectDbTableList(null);
        genTables.stream().forEach(v->{
            System.out.println(v);
        });
        assert genTables != null;

    }

}