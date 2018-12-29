package com.uthai.service.impl;

import com.uthai.mapper.TbEmpMapper;
import com.uthai.mapper.TbUserRoleMapper;
import com.uthai.po.TbCustomer;
import com.uthai.po.TbEmp;
import com.uthai.po.TbUserRole;
import com.uthai.po.TbUserRoleExample;
import com.uthai.service.EmpService;
import com.uthai.service.GetTokenFromServer;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("EmpService")
public class EmpServiceImpl implements EmpService {
    @Resource
    TbEmpMapper empMapper;
    @Override
    public boolean register(TbEmp emp) {
        boolean result = true;
        try {
            empMapper.insert(emp);
        }catch (Exception e){
            result= false;
        }
        return result;
    }

    @Override
    public TbEmp selectEmp(String openid) {
        return empMapper.selectByOpenId(openid);
    }

    @Override
    public boolean isFirstLoin(String openid) {
        TbEmp emp = empMapper.selectByOpenId(openid);
        return emp==null;
    }

}
