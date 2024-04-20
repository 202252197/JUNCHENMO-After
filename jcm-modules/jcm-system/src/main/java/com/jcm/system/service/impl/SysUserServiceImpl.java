package com.junchenmo.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.junchenmo.system.domain.SysUser;
import com.junchenmo.system.mapper.SysUserMapper;
import com.junchenmo.system.service.ISysUserService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author 吕世昊
 * @since 2024-04-01
 */
@Service
@AllArgsConstructor
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements ISysUserService {
    private SysUserMapper sysUserMapper;
    public List<SysUser> getAll() {
       return sysUserMapper.selectList(null);
    }
}
