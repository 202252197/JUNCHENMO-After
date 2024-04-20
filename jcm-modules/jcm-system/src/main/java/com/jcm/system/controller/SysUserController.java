package com.junchenmo.system.controller;


import com.jcm.common.core.domain.R;
import com.junchenmo.system.domain.SysUser;
import com.junchenmo.system.service.impl.SysUserServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author 吕世昊
 * @since 2024-04-01
 */
@RestController
@AllArgsConstructor
@RequestMapping("/sys-user")
public class SysUserController {
    private SysUserServiceImpl sysUserService;

    @GetMapping ("/getAll")
    public R<List<SysUser>> getAll(){
        List<SysUser> all = sysUserService.getAll();
        return R.ok(all);
    }

}
