package com.uthai.service.impl;

import com.uthai.mapper.TbCustomerMapper;
import com.uthai.mapper.TbUserRoleMapper;
import com.uthai.po.TbCustomer;
import com.uthai.po.TbCustomerExample;
import com.uthai.po.TbUserRole;
import com.uthai.service.UserService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import netscape.javascript.JSObject;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
@Service("UserService")
public class UserServiceImpl implements UserService {
    @Resource
    TbUserRoleMapper userRoleMapper;
    @Resource
    TbCustomerMapper customerMapper;
    @Override
    public TbUserRole login(Map<String, String> map) {
        String openid=map.get("openid");
        TbUserRole userRole=userRoleMapper.selectByPrimaryKey(openid);
        if (userRole!=null){
            return  userRole;
        }
        return null;
    }

    @Override
    public int register(TbUserRole userRole) {
        int result=0;
        try {
            String saltSource = "fishor";
            String hashAlgorithmName = "MD5";
            String credentials = userRole.getPass();
            Object salt = new Md5Hash(saltSource);
            int hashIterations = 1024;
            Object pass = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations);
            userRole.setPass(pass.toString());
            userRoleMapper.insert(userRole);
        } catch (Exception e){
            result=1;
            e.printStackTrace();
        }
        return result;
    }

    /**
     *
     * @param userName
     * @return 0未存在，1已存在
     */
    @Override
    public boolean checkIfExit(String userName) {
        boolean result = false;
        List<TbUserRole> list=userRoleMapper.selectAll();
        for (TbUserRole t:list){
            if (userName.equals(t.getUserId()))
            {
                result = true;
                break;
            }
        }
        return result;
    }

    @Override
    public boolean isFirstLoin(String openid) {
        TbCustomer customer = customerMapper.selectByPrimaryKey(openid);
        return customer==null;
    }

    @Override
    public TbCustomer selectCustomer(String openid) {
        return customerMapper.selectByPrimaryKey(openid);
    }

    @Override
    public boolean saveCustomer(TbCustomer customer) {
        boolean result=true;
        try {
            customerMapper.insert(customer);
        }catch (Exception e){
            e.printStackTrace();
            result=false;
        }
        return result;
    }
    @Override
    public boolean updataCustomer(TbCustomer customer) {
        boolean result=true;
        try {
            customerMapper.updateByPrimaryKeySelective(customer);
        }catch (Exception e){
            e.printStackTrace();
            result=false;
        }
        return result;
    }

    @Override
    public JSONArray getCustomerList(String role , String openid) {
        JSONArray result=new JSONArray();
        TbCustomerExample example = new TbCustomerExample();
        TbCustomerExample.Criteria criteria = example.createCriteria();
        if (role.equals("sale")){
            criteria.andSalesIdEqualTo(openid);
        }else if (role.equals("manager")){
            TbUserRole userRole=userRoleMapper.selectByPrimaryKey(openid);
            criteria.andBranchEqualTo(userRole.getBranchGroup());
        }
        example.setOrderByClause("create_date DESC");
        List<TbCustomer> list=customerMapper.selectByExample(example);
        for (TbCustomer c:list){
            JSONObject object=new JSONObject();
            object.put("name",c.getUserName());
            object.put("openid",c.getUserId());
            result.add(object);
        }
        return result;
    }
}
