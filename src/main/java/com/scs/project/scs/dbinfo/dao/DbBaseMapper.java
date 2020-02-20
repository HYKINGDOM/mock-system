package com.scs.project.scs.dbinfo.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.scs.project.scs.dbinfo.domain.DbInfo;
import org.apache.ibatis.annotations.Mapper;

/**
 * 数据库基本操作接口
 * @author Administrator
 */
@Mapper
public interface DbBaseMapper extends BaseMapper<DbInfo> {



}
