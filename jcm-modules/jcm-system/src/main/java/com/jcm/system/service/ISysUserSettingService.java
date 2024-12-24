package com.jcm.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.jcm.system.domain.SysUserSetting;

/**
 * <p>
 * 用户前端样式设置表 服务类
 * </p>
 *
 * @author 吕世昊
 * @since 2024-12-18
 */
public interface ISysUserSettingService extends IService<SysUserSetting> {


    int insertUserSetting(SysUserSetting userSetting);

    SysUserSetting selectUserSettingByUserId(Long userId);

    int updateUserSetting(SysUserSetting userSetting);
}
