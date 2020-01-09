package com.scs.project.scs.dbinfo.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.*;

/**
 * @author yihur
 */
@Slf4j
@RestController
@RequestMapping("/demo")
public class MysqlConnectController {

    @GetMapping("/test")
    public void testMysqlConnect() {
        connectMysql();
    }

    public void connectMysql() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1:3306?serverTimezone=GMT%2B8";
//      String url = "jdbc:mysql://127.0.0.1:3306/mysql";
            Connection con = DriverManager.getConnection(url, "root", "root");
            DatabaseMetaData dmd = con.getMetaData();
            System.out.println("Minor：" + dmd.getDatabaseMinorVersion());
            System.out.println("Major：" + dmd.getDatabaseMajorVersion());

            System.out.println("当前数据库是：" + dmd.getDatabaseProductName());
            System.out.println("当前数据库版本：" + dmd.getDatabaseProductVersion());
            System.out.println("当前数据库驱动：" + dmd.getDriverVersion());
            System.out.println("当前数据库URL：" + dmd.getURL());
            System.out.println("当前数据库是否是只读模式？：" + dmd.isReadOnly());
            System.out.println("当前数据库是否支持批量更新？：" + dmd.supportsBatchUpdates());
            System.out.println("当前数据库是否支持结果集的双向移动（数据库数据变动不在ResultSet体现）？："
                    + dmd.supportsResultSetType(ResultSet.TYPE_SCROLL_INSENSITIVE));
            System.out.println("当前数据库是否支持结果集的双向移动（数据库数据变动会影响到ResultSet的内容）？："
                    + dmd.supportsResultSetType(ResultSet.TYPE_SCROLL_SENSITIVE));
            System.out.println("===============下面是当前所有数据库=========================");

            Statement statement = con.createStatement();

            ResultSet resultSet = statement.executeQuery("SELECT SCHEMA_NAME FROM information_schema.SCHEMATA");
            while (resultSet.next()) {
                System.out.println(resultSet.getString(1));
            }

            System.out.println("===============下面是当前数据库中所有表=========================");
            String sql = "select table_name from information_schema.tables where table_schema='worm_reading'";
            ResultSet result = statement.executeQuery(sql);
            while (result.next()) {
                System.out.println("数据库表名：" + result.getString("TABLE_NAME"));
            }
            System.out.println("===============下面是当前数据库中表信息=========================");
            String tableDemo = "select * from information_schema.COLUMNS where TABLE_SCHEMA = (select database()) and TABLE_NAME='book_info'";
            ResultSet result2 = statement.executeQuery(tableDemo);
            while (result2.next()) {
                System.out.println("数据库表名：" + result2.getString("COLUMN_NAME"));
            }


        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

//    public void GetDbConnect() throws Exception {
//        DruidDataSource dataSource = null;
//        try{
//            dataSource  =new DruidDataSource();
//            //设置连接参数 (***自己定义传递的参数***)
//            dataSource.setUrl(requestDB.getUrl());
//            dataSource.setDriverClassName(requestDB.getDriver());
//            dataSource.setUsername(requestDB.getUserName());
//            dataSource.setPassword(requestDB.getPassword());
//            //配置初始化大小、最小、最大
//            dataSource.setInitialSize(1);
//            dataSource.setMinIdle(1);
//            dataSource.setMaxActive(20);
//            //连接泄漏监测
//            dataSource.setRemoveAbandoned(true);
//            dataSource.setRemoveAbandonedTimeout(30);
//            //配置获取连接等待超时的时间
//            dataSource.setMaxWait(20000);
//            //配置间隔多久才进行一次检测，检测需要关闭的空闲连接，单位是毫秒
//            dataSource.setTimeBetweenEvictionRunsMillis(20000);
//            //防止过期
//            dataSource.setValidationQuery("SELECT 'x'");
//            dataSource.setTestWhileIdle(true);
//            dataSource.setTestOnBorrow(true);
//        }catch(Exception e){
//            log.error("异常：", e);
//        }
//        // 建立了连接
//        Connection con=dataSource.getConnection();
//    }


    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url = "jdbc:oracle:thin:@192.168.100.251:1521:cstar";
            String user = "ticket";
            String pass = "ticket";
            conn = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    public void test() {
        Connection conn = getConnection();
        String sql = "select * from class";
        PreparedStatement stmt;
        try {
            stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery(sql);
            ResultSetMetaData data = rs.getMetaData();
            while (rs.next()) {
                for (int i = 1; i <= data.getColumnCount(); i++) {
                    // 获得所有列的数目及实际列数
                    int columnCount = data.getColumnCount();
                    // 获得指定列的列名
                    String columnName = data.getColumnName(i);
                    // 获得指定列的列值
                    String columnValue = rs.getString(i);
                    // 获得指定列的数据类型
                    int columnType = data.getColumnType(i);
                    // 获得指定列的数据类型名
                    String columnTypeName = data.getColumnTypeName(i);
                    // 所在的Catalog名字
                    String catalogName = data.getCatalogName(i);
                    // 对应数据类型的类
                    String columnClassName = data.getColumnClassName(i);
                    // 在数据库中类型的最大字符个数
                    int columnDisplaySize = data.getColumnDisplaySize(i);
                    // 默认的列的标题
                    String columnLabel = data.getColumnLabel(i);
                    // 获得列的模式
                    String schemaName = data.getSchemaName(i);
                    // 某列类型的精确度(类型的长度)
                    int precision = data.getPrecision(i);
                    // 小数点后的位数
                    int scale = data.getScale(i);
                    // 获取某列对应的表名
                    String tableName = data.getTableName(i);
                    // 是否自动递增
                    boolean isAutoInctement = data.isAutoIncrement(i);
                    // 在数据库中是否为货币型
                    boolean isCurrency = data.isCurrency(i);
                    // 是否为空
                    int isNullable = data.isNullable(i);
                    // 是否为只读
                    boolean isReadOnly = data.isReadOnly(i);
                    // 能否出现在where中
                    boolean isSearchable = data.isSearchable(i);
                    System.out.println(columnCount);
                    System.out.println("获得列" + i + "的字段名称:" + columnName);
                    System.out.println("获得列" + i + "的字段值:" + columnValue);
                    System.out.println("获得列" + i + "的类型,返回SqlType中的编号:"
                            + columnType);
                    System.out.println("获得列" + i + "的数据类型名:" + columnTypeName);
                    System.out.println("获得列" + i + "所在的Catalog名字:"
                            + catalogName);
                    System.out.println("获得列" + i + "对应数据类型的类:"
                            + columnClassName);
                    System.out.println("获得列" + i + "在数据库中类型的最大字符个数:"
                            + columnDisplaySize);
                    System.out.println("获得列" + i + "的默认的列的标题:" + columnLabel);
                    System.out.println("获得列" + i + "的模式:" + schemaName);
                    System.out
                            .println("获得列" + i + "类型的精确度(类型的长度):" + precision);
                    System.out.println("获得列" + i + "小数点后的位数:" + scale);
                    System.out.println("获得列" + i + "对应的表名:" + tableName);
                    System.out.println("获得列" + i + "是否自动递增:" + isAutoInctement);
                    System.out.println("获得列" + i + "在数据库中是否为货币型:" + isCurrency);
                    System.out.println("获得列" + i + "是否为空:" + isNullable);
                    System.out.println("获得列" + i + "是否为只读:" + isReadOnly);
                    System.out.println("获得列" + i + "能否出现在where中:"
                            + isSearchable);
                }
            }
        } catch (SQLException e) {
            System.out.println("数据库连接失败");
        }
    }


    public static void demoResultSetMetaData(ResultSetMetaData data) throws SQLException {
        for (int i = 1; i <= data.getColumnCount(); i++) {
            // 获得所有列的数目及实际列数
            int columnCount = data.getColumnCount();
            // 获得指定列的列名
            String columnName = data.getColumnName(i);
            // 获得指定列的列值
            // String columnValue = rs.getString(i);
            // 获得指定列的数据类型
            int columnType = data.getColumnType(i);
            // 获得指定列的数据类型名
            String columnTypeName = data.getColumnTypeName(i);
            // 所在的Catalog名字
            String catalogName = data.getCatalogName(i);
            // 对应数据类型的类
            String columnClassName = data.getColumnClassName(i);
            // 在数据库中类型的最大字符个数
            int columnDisplaySize = data.getColumnDisplaySize(i);
            // 默认的列的标题
            String columnLabel = data.getColumnLabel(i);
            // 获得列的模式
            String schemaName = data.getSchemaName(i);
            // 某列类型的精确度(类型的长度)
            int precision = data.getPrecision(i);
            // 小数点后的位数
            int scale = data.getScale(i);
            // 获取某列对应的表名
            String tableName = data.getTableName(i);
            // 是否自动递增
            boolean isAutoInctement = data.isAutoIncrement(i);
            // 在数据库中是否为货币型
            boolean isCurrency = data.isCurrency(i);
            // 是否为空
            int isNullable = data.isNullable(i);
            // 是否为只读
            boolean isReadOnly = data.isReadOnly(i);
            // 能否出现在where中
            boolean isSearchable = data.isSearchable(i);
            System.out.println(columnCount);
            System.out.println("获得列" + i + "的字段名称:" + columnName);
            // System.out.println("获得列" + i + "的字段值:" + columnValue);
            System.out.println("获得列" + i + "的类型,返回SqlType中的编号:" + columnType);
            System.out.println("获得列" + i + "的数据类型名:" + columnTypeName);
            System.out.println("获得列" + i + "所在的Catalog名字:" + catalogName);
            System.out.println("获得列" + i + "对应数据类型的类:" + columnClassName);
            System.out.println("获得列" + i + "在数据库中类型的最大字符个数:" + columnDisplaySize);
            System.out.println("获得列" + i + "的默认的列的标题:" + columnLabel);
            System.out.println("获得列" + i + "的模式:" + schemaName);
            System.out.println("获得列" + i + "类型的精确度(类型的长度):" + precision);
            System.out.println("获得列" + i + "小数点后的位数:" + scale);
            System.out.println("获得列" + i + "对应的表名:" + tableName);
            System.out.println("获得列" + i + "是否自动递增:" + isAutoInctement);
            System.out.println("获得列" + i + "在数据库中是否为货币型:" + isCurrency);
            System.out.println("获得列" + i + "是否为空:" + isNullable);
            System.out.println("获得列" + i + "是否为只读:" + isReadOnly);
            System.out.println("获得列" + i + "能否出现在where中:" + isSearchable);
        }
    }
}
