package com.scs.project.scs.dbinfo.controller;

import com.scs.common.utils.JsonUtil;
import com.scs.common.utils.RsaUtils;
import com.scs.framework.web.controller.BaseController;
import com.scs.framework.web.domain.AjaxResult;
import com.scs.project.scs.dbinfo.domain.DbInfo;
import com.scs.project.scs.dbinfo.service.DbConnectionService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.scs.common.utils.BaseUtils.flipStringAfterConcatenation;
import static com.scs.common.utils.BaseUtils.pruneStringsAfterFlipping;

/**
 * 数据可视化
 *
 * @author Administrator
 */
@Slf4j
@RestController
@RequestMapping("/prod-api/dbvisual")
public class DbConnectionController extends BaseController {

    @Autowired
    private DbConnectionService dbConnectionService;


    @Autowired
    private RsaUtils rsaUtils;

    /**
     * 查询根据返回参数连接数据库
     *
     * @return
     */
        @PostMapping("/queryDbConnectStateInfo")
    public AjaxResult queryDbConnectStateInfoAndSave(@RequestBody String param) {
        DbInfo dbInfo = JsonUtil.readValue(param, DbInfo.class);
        Map<String, Object> map = dbConnectionService.queryDbConnectStateInfoAndSave(dbInfo);
        return AjaxResult.success(map);
    }

    /**
     * 修改数据
     * @param param
     * @return
     */
    @PostMapping("/updateDbInfo")
    public AjaxResult updateDbInfo(@RequestBody String param) {
        DbInfo dbInfo = JsonUtil.readValue(param, DbInfo.class);
        dbConnectionService.updateDbInfo(dbInfo);
        return AjaxResult.success();
    }

    /**
     * 删除数据
     * @param param
     * @return
     */
    @PostMapping("/deleteDbInfo")
    public AjaxResult deleteDbInfo(@RequestBody String param) {
        DbInfo dbInfo = JsonUtil.readValue(param, DbInfo.class);
        dbConnectionService.deleteDbInfo(dbInfo);
        return AjaxResult.success();
    }



    /**
     * 查询当前用户名下所有的数据库，
     *
     * @return
     */
    @GetMapping("/queryUserDataInfo")
    public AjaxResult queryUserDataInfoByUserId() {
        Map<String, Object> dbConnectInfoByUserId = dbConnectionService.getDbConnectInfoByUserId();
        return AjaxResult.success(dbConnectInfoByUserId);
    }


    /**
     * 查询当前用户名下所有的数据库，
     *
     * @return
     */
    @GetMapping("/getDbNameInfoByUserId")
    public AjaxResult getDbNameInfoByUserId(String parentDbName, String dbName) {
        Map<String, Object> map = new HashMap<>(3);
        map.put("parentDbName", parentDbName);
        map.put("dbName", dbName);
        Map<String, Object> dbConnectInfoByUserId = dbConnectionService.getDbNameInfoByUserId(map);
        return AjaxResult.success(dbConnectInfoByUserId);
    }


    /**
     * 查询当前用户名下所有的数据库，
     *
     * @return
     */
    @PostMapping("/queryDataInfoBySql")
    public AjaxResult queryDataInfoBySql(@RequestBody String param) {
        Map<String, Object> map = JsonUtil.readValue(param, Map.class);
        if (map == null) {
            return AjaxResult.error();
        } else if (!map.containsKey("sql")) {
            return AjaxResult.error();
        } else if (map.get("sql") == null) {
            return AjaxResult.error();
        }

        List<List<String>> mapList = dbConnectionService.queryDataInfoBySql(map);
        return AjaxResult.success(mapList);
    }


    /**
     * 根据选择的数据库查看当前数据库下的表信息，目前支持表名和表内字段查看，具体字段类型等等，后端决定是否返回；
     *
     * @param param
     * @return
     */
    @GetMapping("/test")
    public AjaxResult export(@RequestBody String param) {
        String rsaEncrypt = rsaUtils.rsaEncrypt(param);
        log.info("加密后的字符串:{}", rsaEncrypt);
        String rsaDecrypt = rsaUtils.rsaDecrypt(rsaEncrypt);
        log.info("解密后的字符串:{}", rsaDecrypt);


        String flipStringAfterConcatenation = flipStringAfterConcatenation(rsaDecrypt);
        log.info("拼接倒序字符串:{}", flipStringAfterConcatenation);
        String pruneStringsAfterFlipping = pruneStringsAfterFlipping(flipStringAfterConcatenation);
        log.info("倒序删除字符串:{}", pruneStringsAfterFlipping);

        return AjaxResult.success();
    }

}
