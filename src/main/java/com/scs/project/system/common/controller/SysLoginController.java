package com.scs.project.system.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.scs.common.utils.bean.BeanUtils;
import com.scs.project.system.user.domain.SysUserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.scs.common.constant.Constants;
import com.scs.common.utils.ServletUtils;
import com.scs.framework.security.LoginUser;
import com.scs.framework.security.service.SysLoginService;
import com.scs.framework.security.service.SysPermissionService;
import com.scs.framework.security.service.TokenService;
import com.scs.framework.web.domain.AjaxResult;
import com.scs.project.system.menu.domain.SysMenu;
import com.scs.project.system.user.domain.SysUser;
import com.scs.project.system.menu.service.ISysMenuService;

/**
 * 登录验证
 *
 * @author yihur
 */
@RestController
@RequestMapping("/prod-api")
public class SysLoginController {
    @Autowired
    private SysLoginService loginService;

    @Autowired
    private ISysMenuService menuService;

    @Autowired
    private SysPermissionService permissionService;

    @Autowired
    private TokenService tokenService;

    /**
     * 登录方法
     *
     * @param username 用户名
     * @param password 密码
     * @param code     验证码
     * @param uuid     唯一标识
     * @return 结果
     */
    @PostMapping("/login")
    public AjaxResult login(String username, String password, String code, String uuid) {
        AjaxResult ajax = AjaxResult.success();
        // 生成令牌
        String token = loginService.login(username, password, code, uuid);
        ajax.put(Constants.TOKEN, token);
        return ajax;
    }

    /**
     * 获取用户信息
     * @param param 菲必填参数
     * @return 用户信息
     */
    @GetMapping("/getInfo")
    public AjaxResult getInfo(@RequestParam(value="param",required = false) String param) {
        LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
        SysUser user = loginUser.getUser();
        // 角色集合
        Set<String> roles = permissionService.getRolePermission(user);
        // 权限集合
        Set<String> permissions = permissionService.getMenuPermission(user);
        AjaxResult ajax = AjaxResult.success();
        //为scs系统提供的特殊接口当入参为scs时判断
        if ("scs".equals(param)) {
            SysUserVo sysUserVo = new SysUserVo();
            BeanUtils.copyBeanProp(sysUserVo, user);

            Map<String,Object> map = new HashMap<>(5);
            map.put("userId", sysUserVo.getUserId());
            map.put("userName", sysUserVo.getUserName());
            map.put("avatar", sysUserVo.getAvatar());
            map.put("email", sysUserVo.getEmail());
            map.put("phonenumber", sysUserVo.getPhonenumber());
            map.put("sex", sysUserVo.getSex());
            map.put("nickName", sysUserVo.getNickName());

            ajax.put("data", map);
        } else {
            ajax.put("user", user);
            ajax.put("roles", roles);
            ajax.put("permissions", permissions);
        }
        return ajax;
    }

    /**
     * 获取路由信息
     *
     * @return 路由信息
     */
    @GetMapping("/getRouters")
    public AjaxResult getRouters() {
        LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
        // 用户信息
        SysUser user = loginUser.getUser();
        List<SysMenu> menus = menuService.selectMenuTreeByUserId(user.getUserId());
        return AjaxResult.success(menuService.buildMenus(menus));
    }
}
