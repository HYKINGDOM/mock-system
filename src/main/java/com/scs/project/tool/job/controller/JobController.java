package com.scs.project.tool.job.controller;


import com.scs.common.exception.TaskException;
import com.scs.common.utils.poi.ExcelUtil;
import com.scs.framework.aspectj.lang.annotation.Log;
import com.scs.framework.aspectj.lang.enums.BusinessType;
import com.scs.framework.web.controller.BaseController;
import com.scs.framework.web.domain.AjaxResult;
import com.scs.framework.web.page.TableDataInfo;
import com.scs.project.tool.job.domain.Job;
import com.scs.project.tool.job.service.IJobService;
import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.scs.framework.web.domain.AjaxResult.success;

/**
 * 调度任务信息操作处理
 *
 * @author yihur
 */
@Controller
@RequestMapping("/monitor/job")
public class JobController extends BaseController {
    private String prefix = "monitor/job";

    @Autowired
    private IJobService jobService;

    @PreAuthorize("@PermissionService.hasPermi('monitor:job:view')")
    @GetMapping()
    public String job() {
        return prefix + "/job";
    }

    @PreAuthorize("@PermissionService.hasPermi('monitor:job:list')")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Job job) {
        startPage();
        List<Job> list = jobService.selectJobList(job);
        return getDataTable(list);
    }

    @PreAuthorize("@PermissionService.hasPermi('monitor:job:export')")
    @Log(title = "定时任务", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Job job) {
        List<Job> list = jobService.selectJobList(job);
        ExcelUtil<Job> util = new ExcelUtil<Job>(Job.class);
        return util.exportExcel(list, "定时任务");
    }

    @PreAuthorize("@PermissionService.hasPermi('monitor:job:remove')")
    @Log(title = "定时任务", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) throws SchedulerException {
        jobService.deleteJobByIds(ids);
        return success();
    }

    @PreAuthorize("@PermissionService.hasPermi('monitor:job:detail')")
    @GetMapping("/detail/{jobId}")
    public String detail(@PathVariable("jobId") Long jobId, ModelMap mmap) {
        mmap.put("name", "job");
        mmap.put("job", jobService.selectJobById(jobId));
        return prefix + "/detail";
    }

    /**
     * 任务调度状态修改
     */
    @Log(title = "定时任务", businessType = BusinessType.UPDATE)
    @PreAuthorize("@PermissionService.hasPermi('monitor:job:changeStatus')")
    @PostMapping("/changeStatus")
    @ResponseBody
    public AjaxResult changeStatus(Job job) throws SchedulerException {
        Job newJob = jobService.selectJobById(job.getJobId());
        newJob.setStatus(job.getStatus());
        return toAjax(jobService.changeStatus(newJob));
    }

    /**
     * 任务调度立即执行一次
     */
    @Log(title = "定时任务", businessType = BusinessType.UPDATE)
    @PreAuthorize("@PermissionService.hasPermi('monitor:job:changeStatus')")
    @PostMapping("/run")
    @ResponseBody
    public AjaxResult run(Job job) throws SchedulerException {
        jobService.run(job);
        return success();
    }

    /**
     * 新增调度
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存调度
     */
    @Log(title = "定时任务", businessType = BusinessType.INSERT)
    @PreAuthorize("@PermissionService.hasPermi('monitor:job:add')")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@Validated Job job) throws SchedulerException, TaskException {
        return toAjax(jobService.insertJob(job));
    }

    /**
     * 修改调度
     */
    @GetMapping("/edit/{jobId}")
    public String edit(@PathVariable("jobId") Long jobId, ModelMap mmap) {
        mmap.put("job", jobService.selectJobById(jobId));
        return prefix + "/edit";
    }

    /**
     * 修改保存调度
     */
    @Log(title = "定时任务", businessType = BusinessType.UPDATE)
    @PreAuthorize("@PermissionService.hasPermi('monitor:job:edit')")
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@Validated Job job) throws SchedulerException, TaskException {
        return toAjax(jobService.updateJob(job));
    }

    /**
     * 校验cron表达式是否有效
     */
    @PostMapping("/checkCronExpressionIsValid")
    @ResponseBody
    public boolean checkCronExpressionIsValid(Job job) {
        return jobService.checkCronExpressionIsValid(job.getCronExpression());
    }
}
