package com.junchenmo.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.junchenmo.system.domain.SysUser;

import java.util.List;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author 吕世昊
 * @since 2024-04-01
 */
public interface ISysUserService extends IService<SysUser> {
     List<SysUser> getAll() ;
}
