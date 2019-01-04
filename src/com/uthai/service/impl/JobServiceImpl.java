package com.uthai.service.impl;

import com.uthai.mapper.TbJobMapper;
import com.uthai.po.TbJob;
import com.uthai.service.JobService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class JobServiceImpl implements JobService {
    @Resource
    TbJobMapper jobMapper;
    @Override
    public boolean createJob(TbJob job) {
        jobMapper.insert(job);
        return false;
    }
}
