package com.scs.project.scs.dbinfo.service.serviceimp;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.scs.common.utils.RsaUtils;
import com.scs.framework.security.service.TokenService;
import com.scs.project.scs.dbinfo.domain.DbInfo;
import com.scs.project.scs.dbinfo.mapper.DbBaseMapper;
import com.scs.project.scs.dbinfo.mapper.DbConnectionMapper;
import com.scs.project.scs.dbinfo.service.DbConnectionService;
import com.scs.project.system.domain.SysUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author Administrator
 */
@Slf4j
@Service
public class DbConnectionServiceImpl implements DbConnectionService {

    @Autowired
    private DbConnectionMapper dbConnectionMapper;

    @Autowired
    private TokenService tokenService;


    @Autowired
    private RsaUtils rsaUtils;


    /**
     * 当前登录用户, 新建保存数据库连接
     *
     * @param dbInfo
     * @return
     */
    @Override
    public Map<String, Object> queryDbConnectStateInfoAndSave(DbInfo dbInfo) {
        List<String> strings = connectMysql(dbInfo);
        Map<String, Object> mapInfo = new HashMap<>(2);
        mapInfo.put(dbInfo.getDbConnectName(), strings);
        SysUser sysUserInfo = tokenService.getLoginSysUserInfo();
        Long userId = sysUserInfo.getUserId();
        dbInfo.setUserId(Integer.parseInt(String.valueOf(userId)));
        dbInfo.setDbState(1);
        dbInfo.setDbType("mysql");
        dbInfo.setDbEdition("5.6");
        dbConnectionMapper.insertDbInfo(dbInfo);
        return mapInfo;
    }

    /**
     * 修改数据信息
     *
     * @param dbInfo
     */
    @Override
    public void updateDbInfo(DbInfo dbInfo) {
        dbConnectionMapper.updateDbInfo(dbInfo);
    }

    /**
     * 删除数据库连接信息
     *
     * @param dbInfo
     */
    @Override
    public void deleteDbInfo(DbInfo dbInfo) {
        dbConnectionMapper.deleteDbInfo(dbInfo);
    }

    /**
     * 1,根据当前用户查询数据库,
     * 2,存在数据库信息则直接连接数据库并返回信息
     * 存在后查询数据信息,根据数据库状态刷新数据
     * 3,如果不存在,则返回null
     *
     * @return
     */
    @Override
    public Map<String, Object> getDbConnectInfoByUserId() {
        SysUser sysUserInfo = tokenService.getLoginSysUserInfo();
        Long userId = sysUserInfo.getUserId();
        List<DbInfo> dbConnectInfoByUserId = dbConnectionMapper.getDbConnectInfoByUserId(Integer.parseInt(String.valueOf(userId)));
        if (dbConnectInfoByUserId == null) {
            return null;
        }
        Map<String, Object> mapInfo = new HashMap<>(dbConnectInfoByUserId.size() + 2);
        for (DbInfo dbInfo : dbConnectInfoByUserId) {
            Map<String, Object> info = new HashMap<>(3);
            List<String> stringList = connectMysql(dbInfo);
            info.put("info", dbInfo);
            info.put("dataName", stringList);
            mapInfo.put(dbInfo.getDbConnectName(), info);
        }
        return mapInfo;
    }

    /**
     * 1,根据返回的数据库连接名加上用户名查询用户数据库的连接信息
     * 2,根据返回的数据库连接信息加上前端传入的数据库名,查询数据库下表信息和字段信息返回
     *
     * @param dbInfo
     * @return
     */
    @Override
    public Map<String, Object> getDbNameInfoByUserId(Map<String, Object> dbInfo) {
        SysUser sysUserInfo = tokenService.getLoginSysUserInfo();
        Long userId = sysUserInfo.getUserId();
        dbInfo.put("userId", Integer.parseInt(String.valueOf(userId)));
        DbInfo dbConnectInfoByUserId = dbConnectionMapper.getDbInfoByDbName(dbInfo);
        String dbName = dbInfo.get("dbName").toString();
        return getDbTableInfoForMysql(dbConnectInfoByUserId, dbName);
    }

    /**
     * 根据前端传回SQL查询数据
     *
     * @param map
     * @return
     */
    @Override
    public List<List<String>> queryDataInfoBySql(Map<String, Object> map) {
        SysUser sysUserInfo = tokenService.getLoginSysUserInfo();
        Long userId = sysUserInfo.getUserId();
        map.put("userId", Integer.parseInt(String.valueOf(userId)));
        DbInfo dbInfo = dbConnectionMapper.getDbInfoByDbName(map);
        List<List<String>> resultToList = new ArrayList<>();
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://" + dbInfo.getDbAddress() + ":" + dbInfo.getDbPort() + "/" + map.get("dbName").toString() + "?serverTimezone=GMT%2B8";
            log.info("数据库连接地址:{}", url);
            con = DriverManager.getConnection(url, dbInfo.getDbUserName(), rsaUtils.rsaDecrypt(dbInfo.getDbPassword()));
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(map.get("sql").toString());
            ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
            int count = resultSetMetaData.getColumnCount();
            List<String> list = new ArrayList<>();
            for (int i = 1; i < count; i++) {
                list.add(resultSetMetaData.getColumnName(i));
            }
            resultToList.add(list);
            //总列数
            int columnCount = resultSet.getMetaData().getColumnCount();
            int maxData = 1;
            //查询出的数据 返回一百行 拼接  , 检查null和"" 是否能正常显示
            while (resultSet.next()) {
                //组装一百行数据之后返回
                if (maxData == 100) {
                    break;
                }
                List<String> columnList = new ArrayList<>(columnCount);
                for (int i = 1; i < columnCount; i++) {
                    String string = resultSet.getString(i);
                    log.info(string);
                    columnList.add(string);
                }
                resultToList.add(columnList);
                maxData++;
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            log.info("错误日志:{}", e.toString());
            throw new RuntimeException("错误! " + e.toString());
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                log.info(e.toString());
            }
        }
        return resultToList;
    }

    /**
     * @param dbInfo
     * @return
     */
    @Override
    public List<String> getDbBaseByDbConnectInfo(DbInfo dbInfo) {


        return null;
    }

    /**
     * 根据数据库连接信息, 返回返回连接下的所有数据库名
     *
     * @param dbInfo
     * @return
     */
    public List<String> connectMysql(DbInfo dbInfo) {
        List<String> resultList = new ArrayList<>();
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://" + dbInfo.getDbAddress() + ":" + dbInfo.getDbPort() + "?serverTimezone=GMT%2B8";
            con = DriverManager.getConnection(url, dbInfo.getDbUserName(), rsaUtils.rsaDecrypt(dbInfo.getDbPassword()));
            DatabaseMetaData dmd = con.getMetaData();
            log.info("Minor：" + dmd.getDatabaseMinorVersion());
            log.info("Major：" + dmd.getDatabaseMajorVersion());
            log.info("当前数据库是：" + dmd.getDatabaseProductName());
            log.info("当前数据库版本：" + dmd.getDatabaseProductVersion());
            log.info("当前数据库驱动：" + dmd.getDriverVersion());
            log.info("当前数据库URL：" + dmd.getURL());
            log.info("当前数据库是否是只读模式？：" + dmd.isReadOnly());
            log.info("当前数据库是否支持批量更新？：" + dmd.supportsBatchUpdates());
            log.info("当前数据库是否支持结果集的双向移动（数据库数据变动不在ResultSet体现）？：" + dmd.supportsResultSetType(ResultSet.TYPE_SCROLL_INSENSITIVE));
            log.info("当前数据库是否支持结果集的双向移动（数据库数据变动会影响到ResultSet的内容）？：" + dmd.supportsResultSetType(ResultSet.TYPE_SCROLL_SENSITIVE));
            log.info("===============下面是当前所有数据库=========================");
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT SCHEMA_NAME FROM information_schema.SCHEMATA");

            if (resultSet == null) {
                return resultList;
            }
            while (resultSet.next()) {
                String string = resultSet.getString(1);
                log.info(string);
                resultList.add(string);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            log.info("错误日志:{}", e.toString());
            throw new RuntimeException("错误! " + e.toString());
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                log.info(e.toString());
            }
        }
        return resultList;
    }


    /**
     * 根据SQL执行后的数据  返回结果
     *
     * @param dbInfo
     * @param dbName
     * @return
     */
    public Map<String, Object> getDbTableInfoForMysql(DbInfo dbInfo, String dbName) {
        Map<String, Object> mapTableInfo = null;
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://" + dbInfo.getDbAddress() + ":" + dbInfo.getDbPort() + "?serverTimezone=GMT%2B8";
            con = DriverManager.getConnection(url, dbInfo.getDbUserName(), rsaUtils.rsaDecrypt(dbInfo.getDbPassword()));
            Statement statement = con.createStatement();
            String sql = "select table_name from information_schema.tables where table_schema='" + dbName + "'";
            ResultSet result = statement.executeQuery(sql);
            List<String> resultTableNameList = new ArrayList<>();
            while (result.next()) {
                String tableName = result.getString("TABLE_NAME");
                log.info("数据库表名：" + tableName);
                resultTableNameList.add(tableName);
            }
            mapTableInfo = new HashMap<>(resultTableNameList.size() + 2);
            for (String table : resultTableNameList) {
                List<String> resultInfoList = new ArrayList<>();
                String tableDemo = "select COLUMN_NAME,DATA_TYPE,COLUMN_COMMENT from information_schema.COLUMNS where TABLE_NAME='" + table + "'" + "and table_schema='" + dbName + "'";
                ResultSet resultSet = statement.executeQuery(tableDemo);
                while (resultSet.next()) {
                    StringBuilder stringBuilder = new StringBuilder();
                    String columnName = resultSet.getString("COLUMN_NAME");
                    String dataType = resultSet.getString("DATA_TYPE");
                    String columnComment = resultSet.getString("COLUMN_COMMENT");
                    stringBuilder.append(columnName);
                    stringBuilder.append(",");
                    stringBuilder.append(dataType);
                    stringBuilder.append(",");
                    stringBuilder.append(columnComment);
                    String toString = stringBuilder.toString();
                    log.info("数据库字段名拼接：" + toString);
                    resultInfoList.add(toString);
                }
                mapTableInfo.put(table, resultInfoList);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            log.info("错误日志:{}", e.toString());
            throw new RuntimeException("错误! " + e.toString());
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                log.info(e.toString());
            }
        }
        return mapTableInfo;
    }

}
