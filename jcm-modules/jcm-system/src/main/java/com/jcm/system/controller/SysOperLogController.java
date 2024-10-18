package com.jcm.system.controller;


import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.mybatis.controller.PageBaseController;
import com.jcm.common.security.annotation.InnerAuth;
import com.jcm.system.api.domain.SysOperLog;
import com.jcm.system.service.ISysOperLogService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 操作日志记录 前端控制器
 * </p>
 *
 * @author 吕世昊
 * @since 2024-05-03
 */
@RestController
@AllArgsConstructor
@RequestMapping("/operlog")
public class SysOperLogController extends PageBaseController {

    private final ISysOperLogService sysOperLogService;
    @InnerAuth
    @PostMapping
    public AjaxResult add(@RequestBody SysOperLog operLog)
    {
        return toAjax(sysOperLogService.insertOperlog(operLog));
    }

}
