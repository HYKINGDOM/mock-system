package com.scs.project.scs.dbinfo.service;

import com.scs.project.scs.dbinfo.domain.DbInfo;

import java.util.List;
import java.util.Map;

/**
 * @author Administrator
 */
public interface DbConnectionService {


    /**
     * 新增接口,判断是否连接正确后保存
     * @param dbInfo
     * @return
     */
    Map<String,Object> queryDbConnectStateInfoAndSave(DbInfo dbInfo);

    /**
     * 更新用户连接数据
     * @param dbInfo
     */
    void updateDbInfo(DbInfo dbInfo);

    /**
     * 删除用户连接数据
     * @param dbInfo
     */
    void deleteDbInfo(DbInfo dbInfo);



    /**
     * 根据当前用户,查询用户是否已经连接过数据库,并返回数据库信息
     * @return
     */
    Map<String,Object> getDbConnectInfoByUserId();

    /**
     * 根据数据库名查询数据库下所有表,表的字段信息
     * @param map
     * @return
     */
    Map<String,Object> getDbNameInfoByUserId(Map<String,Object> map);

    /**
     * 根据前端传回SQL查询数据
     * @param map
     * @return
     */
    List<List<String>> queryDataInfoBySql(Map<String,Object> map);




    /**
     * 根据数据库连接信息连接数据库 并返回数据库信息
     * @param dbInfo
     * @return
     */
    List<String> getDbBaseByDbConnectInfo(DbInfo dbInfo);
}
