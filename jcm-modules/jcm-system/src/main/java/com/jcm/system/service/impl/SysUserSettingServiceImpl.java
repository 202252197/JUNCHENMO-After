package com.jcm.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jcm.common.core.utils.StringUtils;
import com.jcm.system.domain.SysUserSetting;
import com.jcm.system.mapper.SysUserSettingMapper;
import com.jcm.system.service.ISysUserSettingService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户前端样式设置表 服务实现类
 * </p>
 *
 * @author 吕世昊
 * @since 2024-12-18
 */
@Service
public class SysUserSettingServiceImpl extends ServiceImpl<SysUserSettingMapper, SysUserSetting> implements ISysUserSettingService {

    @Override
    public int insertUserSetting(SysUserSetting userSetting) {
        userSetting.setTheme(0).setThemeColor("#2174FF").setNavigationBar(true).setTabs(true).setTabsIcon(true).setBreadcrumb(true)
                .setMenu(true).setCopyright(true).setWatermark(true).setWeakColor(false).setGrayscale(false).setBlur(false).setContrast(false).setHueRotate(false).setSaturate(false).setDataLoading(false).setSize(10);
        return this.baseMapper.insert(userSetting);
    }

    /**
     * 查询当前用户的前端设置信息
     *
     * @param userId 用户ID
     * @return
     */
    @Override
    public SysUserSetting selectUserSettingByUserId(Long userId) {
        LambdaQueryWrapper<SysUserSetting> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(StringUtils.isNotNull(userId), SysUserSetting::getUserId, userId);
        return this.baseMapper.selectOne(lambdaQueryWrapper);
    }

    /**
     * 修改当前用户的前端设置信息
     *
     * @param userSetting
     * @return
     */
    @Override
    public int updateUserSetting(SysUserSetting userSetting) {
        LambdaQueryWrapper<SysUserSetting> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(StringUtils.isNotNull(userSetting.getUserId()), SysUserSetting::getUserId, userSetting.getUserId());
        return this.baseMapper.update(userSetting, lambdaQueryWrapper);
    }
}
