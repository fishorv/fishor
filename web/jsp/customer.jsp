<%--
  Created by IntelliJ IDEA.
  User: YYY
  Date: 2018/12/22
  Time: 11:34
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cmn-Hans">
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
    <title>个人中心</title>
    <link rel="stylesheet" href="../style/weui.css"/>
    <link rel="stylesheet" href="../example/example.css"/>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/myjs.js"></script>
    <script src="../lib/jquery.js"></script>
    <script src="../dist/jquery.validate.js"></script>
</head>
<body>
    <div class="page__hd">
        <h1 class="page__title">个人中心</h1>
        <p class="page__desc">您好！${userName}</p>
        <br><br><br><br><br><br>
    </div>
    <div class="weui-grids">
        <a href="customer/upcoming.jsp" class="weui-grid">
            <div class="weui-grid__icon">
                <img src="../example/images/icons/upcoming.png" alt="">
            </div>
            <p class="weui-grid__label">代办事项</p>
        </a>
        <a href="customer/myServer.jsp" class="weui-grid">
            <div class="weui-grid__icon">
                <img src="../example/images/icons/server.png" alt="">
            </div>
            <p class="weui-grid__label">我的客服</p>
        </a>
        <a href="customer/report.jsp" class="weui-grid">
            <div class="weui-grid__icon">
                <img src="../example/images/icons/report.png" alt="">
            </div>
            <p class="weui-grid__label">查报告</p>
        </a>
        <a href="customer/journeyMSG.jsp" class="weui-grid">
            <div class="weui-grid__icon">
                <img src="../example/images/icons/journey.png" alt="">
            </div>
            <p class="weui-grid__label">旅程信息</p>
        </a>
        <a href="customer/tibs.jsp" class="weui-grid">
            <div class="weui-grid__icon">
                <img src="../example/images/icons/tibs.png" alt="">
            </div>
            <p class="weui-grid__label">曼谷攻略</p>
        </a>
        <a href="customer/aboutMe.jsp" class="weui-grid">
            <div class="weui-grid__icon">
                <img src="../example/images/icons/aboutMe.png" alt="">
            </div>
            <p class="weui-grid__label">个人中心</p>
        </a>
    </div>
</body>
</html>
