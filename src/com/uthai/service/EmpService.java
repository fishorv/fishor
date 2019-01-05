package com.uthai.service;

import com.uthai.po.TbEmp;
import net.sf.json.JSONArray;

public interface EmpService {
    boolean register(TbEmp emp);
    TbEmp selectEmp(String openid);
    boolean isFirstLoin(String openid);
    JSONArray getEmpList(String role, String openid);
}

