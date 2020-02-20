package com.scs.project.system.user.controller;

import com.scs.common.utils.JsonUtils;
import com.scs.framework.web.controller.BaseController;
import com.scs.framework.web.domain.AjaxResult;
import com.scs.project.system.user.domain.SysUserRegisterVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.Objects;

/**
 * 注册用户
 *
 * @author yihur
 */
@Slf4j
@Api(value = "registerUserInfo", tags = {"用户信息注册"})
@RestController
@RequestMapping("/prod-api/system/user/register")
public class SysUserRegisterController extends BaseController {
    /**
     * 注册用户信息
     *
     * @param readValue
     * @return
     */
    @ApiOperation(value = "用户注册", notes = "根据用户信息校验通过后注册")
    @PostMapping("/registerUserInfo")
    public AjaxResult sysUserInfoRegister(@RequestBody @Valid SysUserRegisterVo readValue, BindingResult results) {
        if (results.hasErrors()) {
            return AjaxResult.error("数据有误!请检查!", Objects.requireNonNull(results.getFieldError()).getDefaultMessage());
        }

        //String returnErrorMassage = returnErrorMassageFun(readValue);

        log.info(JsonUtils.toJSON(readValue));

//        if (returnErrorMassage != null) {
//            return AjaxResult.error("数据为空,请校验数据!");
//        }
        return AjaxResult.success();
    }

    /**
     * 用户注册的参数校验方法
     *
     * @param readValue
     * @return
     */
    private String returnErrorMassageFun(SysUserRegisterVo readValue) {
        String errorMassage = null;
        if (readValue == null) {
            errorMassage = ("数据为空,请校验数据!");
        }


        return errorMassage;
    }

}
