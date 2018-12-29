package com.uthai.service;

import com.uthai.po.TbEmp;

public interface EmpService {
    boolean register(TbEmp emp);
    TbEmp selectEmp(String openid);
    boolean isFirstLoin(String openid);
}
