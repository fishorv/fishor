package com.uthai.controller;

import com.uthai.po.TbJob;
import com.uthai.service.JobService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping(value = "/job")
public class JobController {
    @Resource
    JobService jobService;

    @RequestMapping(value = "/createJob")
    @ResponseBody
    public String createJob(TbJob job){
        return String.valueOf(jobService.createJob(job));
    }

}
