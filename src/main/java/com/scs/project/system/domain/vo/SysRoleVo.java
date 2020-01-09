package com.scs.project.system.domain.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * 角色返回数据用实体
 * @author yihur
 */
@Data
public class SysRoleVo implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * 角色ID
     */
    private Long roleId;

    /**
     * 角色名称
     */
    private String roleName;
}
