package com.jcm.system.domain.DTO;

import lombok.Data;

@Data
public class RoleDTO {
    private Long userId;
    private Long[] rolesId;
}
