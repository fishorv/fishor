package com.uthai.controller;

import com.uthai.po.TbCustomer;
import com.uthai.po.TbUserRole;
import com.uthai.service.WXService;
import com.uthai.service.impl.UserServiceImpl;
import com.uthai.service.impl.WXServiceImpl;
import net.sf.json.JSONObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/user")
public class userController {
    @Resource
    WXServiceImpl wxService;
    @Resource
    UserServiceImpl userService;
    @RequestMapping(value = "/firstLogin")
    @ResponseBody
    public String isFirstLogin(HttpSession session){
        String result="false";
        JSONObject userInfo= (JSONObject) session.getAttribute("user_info");
        String user = userInfo.getString("openid");
        if (userService.isFirstLoin(user)){
            result="true";
        }
        return result;
    }@RequestMapping(value = "/regist")
    public ModelAndView regist(@Param("userName")String userName, @Param("password")String password , @Param("code")String code, HttpSession session){
        TbUserRole userRole= new TbUserRole();
        JSONObject jsonObject= (JSONObject) session.getAttribute("user_info");
        userRole.setUserId(userName);
        userRole.setOpenId(jsonObject.getString("openid"));
        userRole.setPass(password);
        userRole.setUserRole("customer");
        ModelAndView av= new ModelAndView();
        String sessionCode= (String) session.getAttribute("code");
        code=code.toUpperCase();
        System.out.println(code+sessionCode);
        if (!code.equals(sessionCode)){
            av.addObject("status","验证码错误！");
            av.addObject("userName",userName);
            av.setViewName("regist");
            return  av;
        }
        if (userService.checkIfExit(userName)){
            av.addObject("status","用户名已存在！");
            av.addObject("userName",userName);
            av.setViewName("regist");
            return av;
        }
        int result=userService.register(userRole);
        if (result==0) //注册成功
        {
            av.addObject("userRole",userRole.getUserRole());
            av.addObject("branch",userRole.getBranchGroup());
            av.setViewName(userRole.getUserRole());
            return av;
        }
        return av;
    }
    @RequestMapping(value = "/formCustomer")
    @ResponseBody
    public String formCustomer(TbCustomer customer,HttpSession session){
        JSONObject userInfo = (JSONObject) session.getAttribute("user_info");
        customer.setUserId(userInfo.getString("openid"));
        boolean result=userService.saveCustomer(customer);
        System.out.println(customer.getGender());
        return String.valueOf(result);
    }
    @RequestMapping(value = "/sendCode")
    public void sendCode(@Param("telNumber") String telNumber){
        System.out.println(telNumber);
    }
    @RequestMapping(value = "/checkCode")
    @ResponseBody
    public String checkCode(@Param("code") String code){
    String codeFromBD="1234";
    if (code.equals(codeFromBD))
        return "true";
    return "false";
    }
    @RequestMapping(value = "/getCustomerInfo")
    @ResponseBody
    public TbCustomer getCustomerInfo(String openid){
        return userService.selectCustomer(openid);
    }
    @RequestMapping(value = "/getOpenId")
    @ResponseBody
    public String getOpenId(HttpSession session){
        JSONObject jsonObject= (JSONObject) session.getAttribute("user_info");
        return jsonObject.getString("openid");
    }
}
