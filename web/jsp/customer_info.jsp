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
    <link rel="stylesheet" href="../style/weui.css"/>
    <link rel="stylesheet" href="../example/example.css"/>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
</head>
<body>
<div class="weui-cells__title">完善个人信息</div>
<div class="weui-cells weui-cells_form">
    <form  id="getUserInfo" action="/user/formCustomer.do">
    <div class="weui-cell" >
        <div class="weui-cell__hd"><label class="weui-label">姓名</label></div>
        <div class="weui-cell__bd">
            <input class="weui-input" id="userName" type="text" placeholder="请输入姓名"/>
        </div>
    </div>
    <div class="weui-cells__title">性别</div>
    <div class="weui-cells weui-cells_radio" id="gender">
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
        <div class="weui-cell__hd"><label class="weui-label">年龄</label></div>
        <div class="weui-cell__bd">
            <input class="weui-input" id="userAge" type="text" placeholder="请输入年龄"/>
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">手机号</label></div>
        <div class="weui-cell__bd">
            <input class="weui-input" id="tel" type="text" placeholder="手机号"/>
        </div>
        <div class="weui-cell__ft">
        <button class="weui-vcode-btn" id="getCode">获取验证码</button>
        </div>
    </div>
    <div class="weui-btn-area">
        <a class="weui-btn weui-btn_primary" href="javascript:" id="doForm">确定</a>
    </div>
    </form>
</div>
<script type="text/javascript">
    $('#doForm').on('click',function () {
        $.post("/user/formCustomer.do",{
            "userName":$('#userName').val(),
            "userAge":$('#userAge').val(),
            "gender":$("input[name='radio1']:checked").val()
        },function (data) {
            alert(data);
            console.log(data);
        })
    })
    $('#getCode').on('click',function () {
        $.post("/user/formCustomer.do",{
            "telNumber":$('#tel').val()
        },function (data) {
            alert(data);
            console.log(data);
        })
    })
</script>
</body>
</html>
