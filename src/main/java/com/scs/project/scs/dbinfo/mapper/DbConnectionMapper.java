package com.scs.project.scs.dbinfo.mapper;

import com.scs.project.scs.dbinfo.domain.DbInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * @author Administrator
 */
@Mapper
public interface DbConnectionMapper{

    /**
     * 根据用户id 查询数据库信息
     * @param userId
     * @return
     */
    List<DbInfo> getDbConnectInfoByUserId(Integer userId);

    /**
     * 根据数据库名 查询数据库信息
     * @param dbName
     * @return
     */
    DbInfo getDbInfoByDbName(Map<String,Object> dbName);

    /**
     * 新增数据库连接信息
     * @param dbInfo
     */
    void insertDbInfo(DbInfo dbInfo);

    /**
     * 修改数据
     * @param dbInfo
     */
    void updateDbInfo(DbInfo dbInfo);

    /**
     * 删除数据
     * @param dbInfo
     */
    void deleteDbInfo(DbInfo dbInfo);
}
