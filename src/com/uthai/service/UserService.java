package com.uthai.service;

import com.uthai.po.TbCustomer;
import com.uthai.po.TbUserRole;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.List;
import java.util.Map;

public interface UserService {
    TbUserRole login(Map<String,String> map);
    int register(TbUserRole userRole);
    boolean checkIfExit(String userName);
    boolean isFirstLoin(String openid);
    boolean saveCustomer(TbCustomer customer);
    TbCustomer selectCustomer(String openid);
    boolean updataCustomer(TbCustomer customer);
    JSONArray getCustomerList(String role, String openid);
}
