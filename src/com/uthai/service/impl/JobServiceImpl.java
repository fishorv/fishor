package com.uthai.service.impl;

import com.uthai.mapper.DynamicMapper;
import com.uthai.mapper.TbCustomerMapper;
import com.uthai.mapper.TbJobMapper;
import com.uthai.po.Dynamic;
import com.uthai.po.TbCustomer;
import com.uthai.po.TbJob;
import com.uthai.service.JobService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

@Service
public class JobServiceImpl implements JobService {
    @Resource
    TbJobMapper jobMapper;
    @Resource
    DynamicMapper dynamicMapper;
    @Resource
    TbCustomerMapper customerMapper;
    @Override
    public boolean createJob(TbJob job) {
        boolean result=true;
        Dynamic dynamic=dynamicMapper.selectByPrimaryKey(job.getOpenid());
        TbCustomer customer= customerMapper.selectByPrimaryKey(job.getOpenid());
        job.setSale(customer.getSalesman());
        job.setRoom(dynamic.getcHotel());
        job.setCreatedate(new Date());
//        job.setName("lufeicun");
//        job.setServername("doge");
        try {
            jobMapper.insert(job);
        }catch (Exception e)
        {
            e.printStackTrace();
            result = false;
        }
        return result;
    }
}
