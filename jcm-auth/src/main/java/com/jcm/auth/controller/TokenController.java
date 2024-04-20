package com.junchenmo.auth.controller;

import com.alibaba.csp.sentinel.cluster.TokenService;
import com.junchenmo.auth.service.SysLoginService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.RestController;

@AllArgsConstructor
@RestController
public class TokenController {
    private TokenService tokenService;

    private SysLoginService sysLoginService;

}
