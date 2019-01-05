package com.uthai.service.impl;

import com.uthai.mapper.TbEmpMapper;
import com.uthai.mapper.TbUserRoleMapper;
import com.uthai.po.*;
import com.uthai.service.EmpService;
import com.uthai.service.GetTokenFromServer;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("EmpService")
public class EmpServiceImpl implements EmpService {
    @Resource
    TbEmpMapper empMapper;
    @Resource
    TbUserRoleMapper userRoleMapper;
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

    @Override
    public JSONArray getEmpList(String role, String openid) {
        JSONArray result=new JSONArray();
        TbEmpExample example = new TbEmpExample();
        TbEmpExample.Criteria criteria = example.createCriteria();
        if (role.equals("sale")){
            criteria.andIdEqualTo(openid);
        }else if (role.equals("manager")){
            TbUserRole userRole=userRoleMapper.selectByPrimaryKey(openid);
            criteria.andDeptIdEqualTo(userRole.getBranchGroup());
        }
        example.setOrderByClause("createtime DESC");
        List<TbEmp> list=empMapper.selectByExample(example);
        for (TbEmp c:list){
            JSONObject object=new JSONObject();
            object.put("name",c.getName());
            object.put("openid",c.getId());
            result.add(object);
        }
        return result;
    }
}
