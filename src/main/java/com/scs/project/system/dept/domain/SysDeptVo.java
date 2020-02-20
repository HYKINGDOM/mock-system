package com.scs.project.system.dept.domain;

import lombok.Data;

import java.io.Serializable;

/**
 * 部门返回数据用实体
 * @author yihur
 */
@Data
public class SysDeptVo implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * 部门ID
     */
    private Long deptId;

    /**
     * 父部门ID
     */
    private Long parentId;

    /**
     * 部门名称
     */
    private String deptName;

}
