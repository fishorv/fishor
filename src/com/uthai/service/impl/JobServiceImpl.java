package com.uthai.service.impl;

import com.uthai.mapper.DynamicMapper;
import com.uthai.mapper.TbCustomerMapper;
import com.uthai.mapper.TbJobMapper;
import com.uthai.po.Dynamic;
import com.uthai.po.TbCustomer;
import com.uthai.po.TbJob;
import com.uthai.po.TbJobExample;
import com.uthai.service.JobService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

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
        try {
            jobMapper.insert(job);
        }catch (Exception e)
        {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    @Override
    public JSONArray getJobList() {
        TbJobExample example= new TbJobExample();
        JSONArray result=new JSONArray();
        List<TbJob> jobs=jobMapper.selectByExample(example);
        for (TbJob job:jobs){
            try {
                if (job.getContent()==null){
                    job.setContent("");
                }
                if (job.getRemark()==null){
                    job.setRemark("");
                }if (job.getAddress()==null){
                    job.setAddress("");
                }if (job.getStatus()==null){
                    job.setStatus("");
                }
                result.add(JSONObject.fromObject(job));
            }catch (Exception e){
                continue;
            }
        }
         return result;
    }
}

