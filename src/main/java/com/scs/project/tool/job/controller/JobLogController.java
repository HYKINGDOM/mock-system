package com.scs.project.tool.job.controller;


import com.scs.common.utils.poi.ExcelUtil;
import com.scs.framework.aspectj.lang.annotation.Log;
import com.scs.framework.aspectj.lang.enums.BusinessType;
import com.scs.framework.web.controller.BaseController;
import com.scs.framework.web.domain.AjaxResult;
import com.scs.framework.web.page.TableDataInfo;
import com.scs.project.tool.job.domain.JobLog;
import com.scs.project.tool.job.service.IJobLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.scs.framework.web.domain.AjaxResult.success;

/**
 * 调度日志操作处理
 *
 * @author yihur
 */
@Controller
@RequestMapping("/monitor/jobLog")
public class JobLogController extends BaseController {
    private String prefix = "monitor/job";

    @Autowired
    private IJobLogService jobLogService;

    @PreAuthorize("@ss.hasPermi('monitor:job:view')")
    @GetMapping()
    public String jobLog() {
        return prefix + "/jobLog";
    }

    @PreAuthorize("@ss.hasPermi('monitor:job:list')")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(JobLog jobLog) {
        startPage();
        List<JobLog> list = jobLogService.selectJobLogList(jobLog);
        return getDataTable(list);
    }

    @Log(title = "调度日志", businessType = BusinessType.DELETE)
    @PreAuthorize("@ss.hasPermi('monitor:job:remove')")
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(jobLogService.deleteJobLogByIds(ids));
    }

    @PreAuthorize("@ss.hasPermi('monitor:job:export')")
    @Log(title = "调度日志", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(JobLog jobLog) {
        List<JobLog> list = jobLogService.selectJobLogList(jobLog);
        ExcelUtil<JobLog> util = new ExcelUtil<JobLog>(JobLog.class);
        return util.exportExcel(list, "调度日志");
    }

    @PreAuthorize("@ss.hasPermi('monitor:job:detail')")
    @GetMapping("/detail/{jobLogId}")
    public String detail(@PathVariable("jobLogId") Long jobLogId, ModelMap mmap) {
        mmap.put("name", "jobLog");
        mmap.put("jobLog", jobLogService.selectJobLogById(jobLogId));
        return prefix + "/detail";
    }

    @Log(title = "调度日志", businessType = BusinessType.CLEAN)
    @PreAuthorize("@ss.hasPermi('monitor:job:remove')")
    @PostMapping("/clean")
    @ResponseBody
    public AjaxResult clean() {
        jobLogService.cleanJobLog();
        return success();
    }
}
