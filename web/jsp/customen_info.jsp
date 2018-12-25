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
<div class="weui-cells__title">姓名</div>
<div class="weui-cells weui-cells_form" id="getUserBase">
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
                <input type="radio" class="weui-check" name="radio1" id="x11">
                <span class="weui-icon-checked"></span>
            </div>
        </label>
        <label class="weui-cell weui-check__label" for="x12">
            <div class="weui-cell__bd">
                <p>女</p>
            </div>
            <div class="weui-cell__ft">
                <input type="radio" name="radio1" class="weui-check" id="x12" checked="checked">
                <span class="weui-icon-checked"></span>
            </div>
        </label>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">密码</label></div>
        <div class="weui-cell__bd">
            <input class="weui-input" id="password" type="password" placeholder="请输入密码"/>
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__hd">
            <label class="weui-label">确认密码</label>
        </div>
        <div class="weui-cell__bd">
            <input class="weui-input" id="checkPass"type="password" placeholder="请再次输入密码">
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__hd">
            <label class="weui-label">验证码</label></div>
        <div class="weui-cell__bd">
            <input class="weui-input"  id="code" type="text"/>
        </div>
        <div class="weui-cell__ft">
            <%--<img class="weui-vcode-img" src="../example/images/vcode.jpg" />--%>
            <img class="weui-vcode-img" id="imgObj" alt="验证码" src="${pageContext.request.contextPath}/web/getImgCode.do">
        </div>
    </div>
    <div class="weui-btn-area">
        <a class="weui-btn weui-btn_primary" href="javascript:" id="doLogin">确定</a>
    </div>
</div>
</body>
</html>
