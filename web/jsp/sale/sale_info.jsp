<%--
  Created by IntelliJ IDEA.
  User: YYY
  Date: 2018/12/22
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
    <title>用户信息</title>
    <link rel="stylesheet" href="../../style/weui.css"/>
    <link rel="stylesheet" href="../../example/example.css"/>
    <script type="text/javascript" src="../../js/jquery.min.js"></script>
</head>
<body>
<div class="weui-cells__title">完善个人信息</div>
<div class="weui-cells weui-cells_form">
    <%--<form  id="getUserInfo" action="/user/formCustomer.do">--%>
    <div class="weui-cell" >
        <div class="weui-cell__hd"><label class="weui-label">姓名</label></div>
        <div class="weui-cell__bd">
            <input class="weui-input" id="userName" type="text" placeholder="请输入姓名"/>
        </div>
    </div>
    <div class="weui-cells__title">性别</div>
    <div class="weui-cells weui-cells_radio">
        <label class="weui-cell weui-check__label" for="x11">
            <div class="weui-cell__bd">
                <p>男</p>
            </div>
            <div class="weui-cell__ft">
                <input type="radio" class="weui-check" name="radio1" value="男" id="x11">
                <span class="weui-icon-checked"></span>
            </div>
        </label>
        <label class="weui-cell weui-check__label" for="x12">
            <div class="weui-cell__bd">
                <p>女</p>
            </div>
            <div class="weui-cell__ft">
                <input type="radio" name="radio1" class="weui-check" value="女" id="x12" checked="checked">
                <span class="weui-icon-checked"></span>
            </div>
        </label>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">生日</label></div>
        <div class="weui-cell__bd">
            <a href="javascript:;" class="weui-btn weui-btn_default" id="showDatePicker"></a>
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">地址</label></div>
        <div class="weui-cell__bd">
            <input class="weui-input" id="address" type="text" placeholder="请输入住址"/>
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">手机号</label></div>
        <div class="weui-cell__bd">
            <input class="weui-input" id="tel" type="text" placeholder="手机号"/>
        </div>
        <div class="weui-cell__ft">
            <button class="weui-vcode-btn" id="telCode">获取验证码</button>
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__hd">
            <label class="weui-label">验证码</label></div>
        <div class="weui-cell__bd">
            <input class="weui-input" name = "code" id="code" type="text"/>
        </div>
    </div>
    <div class="weui-btn-area">
        <a class="weui-btn weui-btn_primary" href="javascript:" id="doForm">确定</a>
    </div>
</div>
<div id="loadingToast" style="display:none;">
    <div class="weui-mask_transparent"></div>
    <div class="weui-toast">
        <i class="weui-loading weui-icon_toast"></i>
        <p class="weui-toast__content">数据加载中</p>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        var storage=window.sessionStorage;
        var $loadingToast= $('#loadingToast');
        var timeout= setTimeout(function () {
            $loadingToast.fadeOut(100);
        },5000);
        $loadingToast.fadeIn(100);
        $.get("/user/getOpenId.do",function (data) {
            openid=storage["openid"];
            console.log(openid);
            if (openid!=null){
                $.post("/user/getEmpInfo.do",{
                    "openid":openid
                },function (data) {
                    if (timeout) {
                        clearTimeout(timeout);
                        timeout=null;
                    }
                    if (data.gender=="男"){
                        $("#x11").prop("checked",true);
                        $("#x12").prop("checked",false);
                    }else {
                        $("#x12").prop("checked",true);
                        $("#x11").prop("checked",false);
                    }
                    $('#userName').val(data.userName);
                    $('#userAge').val(data.userAge);
                    $('#address').val(data.address);
                    $('#tel').val(data.userTel);
                    $loadingToast.fadeOut(100);
                },"json");
            }
            else {
                $loadingToast.fadeOut(100);
            }

        })

    });

    $('#showDatePicker').on('click', function () {
        weui.datePicker({
            start: 1990,
            end: new Date().getFullYear(),
            onChange: function (result) {
                console.log(result);
            },
            onConfirm: function (result) {
                console.log(result);
            }
        });
    });
    $('#telCode').on('click',function () {
        $.post("/user/sendCode.do",{
            "telNumber":$('#tel').val()
        })
    });
    $('#doForm').on('click',function () {
        $.post("/user/checkCode.do",{
            "code":$('#code').val()
        },function (data) {
            if (data=="false"){
                alert("验证码不正确！");
                return false;
            }
            else {
                var name=$('#userName').val();
                var age =$('#userAge').val();
                var gender  =$("input[name='radio1']:checked").val();
                var userTel =$('#tel').val();
                var address =$('#address').val();
                $.post("/user/formEmp.do",{
                    "name":name,
                    "age":age,
                    "position":position,
                    "gender":gender,
                    "telnumer":userTel,
                    "address":address
                },function (data) {
                    if (data=="true"){
                        window.location.href="/jsp/sale/aboutMe.jsp";
                    } else{
                        alert("创建失败");
                    }
                })
            }
        })

    });
    SetCookie= function ( name, value)//两个参数，一个是cookie的名子，一个是值
    {
        console.log("setCookie");
        var Days = 1; //此 cookie 将被保存 1 天
        var exp  = new Date();    //new Date("December 31, 9998");
        exp.setTime(exp.getTime() + Days*24*60*60*1000);
        document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
    }
    getCookie = function (name)//取cookies函数
    {
        console.log("getCookie");
        var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
        if(arr != null)
            return unescape(arr[2]);

        return null;

    }
    delCookie=function(name)//删除cookie
    {
        var exp = new Date();
        exp.setTime(exp.getTime() - 1);
        var cval=getCookie(name);
        if(cval!=null) document.cookie= name + "="+cval+";expires="+exp.toGMTString();
    }
</script>
</body>
</html>
