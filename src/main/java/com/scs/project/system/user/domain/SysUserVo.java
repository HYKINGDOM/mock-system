package com.scs.project.system.user.domain;

import lombok.Data;

import java.io.Serializable;

/**
 * 用户返回实体类
 * @author yihur
 */
@Data
public class SysUserVo implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long userId;

    /**
     * 用户账号
     */
    private String userName;

    /**
     * 用户昵称
     */
    private String nickName;

    /**
     * 用户邮箱
     */
    private String email;

    /**
     * 手机号码
     */
    private String phonenumber;

    /**
     * 用户性别
     */
    private String sex;

    /**
     * 用户头像
     */
    private String avatar;

}
