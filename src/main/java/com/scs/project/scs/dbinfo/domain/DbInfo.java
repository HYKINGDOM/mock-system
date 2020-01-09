package com.scs.project.scs.dbinfo.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * 数据库连接信息
 *
 * @author Administrator
 */
@Data
@TableName("db_connect_info")
public class DbInfo implements Serializable {

    @TableId("id")
    private Integer id;

    private Integer userId;

    private String dbConnectName;

    private String dbAddress;

    private String dbPort;

    private String dbUserName;

    private String dbPassword;

    private String dbType;

    private String dbEdition;

    private Integer dbState;
}
