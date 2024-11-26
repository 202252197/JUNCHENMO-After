package com.jcm.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jcm.system.domain.SysDictData;
import com.jcm.system.mapper.SysDictDataMapper;
import com.jcm.system.service.ISysDictDataService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 字典配置值 服务实现类
 * </p>
 *
 * @author 吕世昊
 * @since 2024-11-24
 */
@Service
@AllArgsConstructor
public class SysDictDataServiceImpl extends ServiceImpl<SysDictDataMapper, SysDictData> implements ISysDictDataService {

    private final SysDictDataMapper sysDictDataMapper;

    /**
     * 根据条件分页查询字典配置值数据
     * @param dictData 字典值信息
     * @return 字典项数据集合信息
     */
    @Override
    public List<SysDictData> selectDictDataList(SysDictData dictData) {
        return this.lambdaQuery().list();
    }

}
