package com.jcm.system.service;

import com.jcm.system.domain.SysUserSetting;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 用户前端样式设置表 服务类
 * </p>
 *
 * @author 吕世昊
 * @since 2024-12-18
 */
public interface ISysUserSettingService extends IService<SysUserSetting> {

    SysUserSetting selectUserSettingByUserId(Long userId);

    int updateUserSetting(SysUserSetting userSetting);
}
