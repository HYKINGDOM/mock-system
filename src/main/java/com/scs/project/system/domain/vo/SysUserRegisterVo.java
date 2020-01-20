package com.scs.project.system.domain.vo;


import lombok.Data;

import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;


/**
 * 用户注册实体类
 *
 * @author yihur
 */
@Data
public class SysUserRegisterVo {

    /**
     * 用户名
     */
    @Valid
    @NotBlank(message = "用户名不能为空")
    private String userName;

    /**
     * 密码
     */
    @Valid
    @NotBlank(message = "密码不能为空")
    private String password;

    /**
     * 用户昵称
     */
    @Valid
    @NotBlank(message = "昵称不能为空")
    private String nickName;


    /**
     * 用户邮箱
     */
    @Valid
    @Email(message = "邮箱格式不正确")
    private String email;

    /**
     * 手机号码
     */
    private String phoneNumber;
}
