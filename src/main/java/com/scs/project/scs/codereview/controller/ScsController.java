package com.scs.project.scs.codereview.controller;

import com.scs.common.utils.JsonUtils;
import com.scs.common.utils.web.AbstractCustomResult;
import com.scs.framework.web.controller.BaseController;
import com.scs.project.scs.codereview.service.ScsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;
import java.util.concurrent.Callable;

import static com.scs.common.utils.web.AbstractCustomResult.*;


/**
 * todo v1.0需要的接口
 *      1,首页code review信息接口
 *      2,用户注册
 *      3,用户登录
 *
 *
 *
 *
 *
 *
 * @author Administrator
 */
@RestController
@RequestMapping(value = "/pmit-project-scs")
public class ScsController extends AbstractCustomResult {

    @Autowired
    private ScsService scsService;

    @PostMapping(value = "/getScsHomePageInfoPage")
    public Callable<Object> getScsHomePageInfoPage(@RequestBody String parameter) {
        Map<String, String> paramMap = JsonUtils.readValue(parameter, Map.class);
        if (paramMap == null) {
            return returnIsNullError();
        }
        Callable callable;
        try {
            int pageNum = Integer.parseInt(String.valueOf(paramMap.get("pageNum")));
            int pageSize = Integer.parseInt(String.valueOf(paramMap.get("pageSize")));
            callable = () -> scsService.getScsHomePageInfoPage(pageNum, pageSize, paramMap);
        } catch (Exception e) {
            return returnToException("查询异常", e.getClass() + ":" + e.getMessage());
        }
        return returnToCallable(200, callable, "查询成功", "scs home page query success", true);
    }
}
