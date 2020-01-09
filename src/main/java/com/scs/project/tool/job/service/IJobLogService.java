package com.scs.project.tool.job.service;


import com.scs.project.tool.job.domain.JobLog;

import java.util.List;

/**
 * 定时任务调度日志信息信息 服务层
 *
 * @author yihur
 */
public interface IJobLogService {
    /**
     * 获取quartz调度器日志的计划任务
     *
     * @param jobLog 调度日志信息
     * @return 调度任务日志集合
     */
    List<JobLog> selectJobLogList(JobLog jobLog);

    /**
     * 通过调度任务日志ID查询调度信息
     *
     * @param jobLogId 调度任务日志ID
     * @return 调度任务日志对象信息
     */
    JobLog selectJobLogById(Long jobLogId);

    /**
     * 新增任务日志
     *
     * @param jobLog 调度日志信息
     */
    void addJobLog(JobLog jobLog);

    /**
     * 批量删除调度日志信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteJobLogByIds(String ids);

    /**
     * 删除任务日志
     *
     * @param jobId 调度日志ID
     * @return 结果
     */
    int deleteJobLogById(Long jobId);

    /**
     * 清空任务日志
     */
    void cleanJobLog();
}
