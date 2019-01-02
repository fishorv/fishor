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
    <title>管理员</title>
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
    <p class="page__desc">您好！管理员${userName}</p>
    <br><br><br><br><br><br>
</div>
<div class="weui-grids">
    <a href="manager/customers.jsp" class="weui-grid">
        <div class="weui-grid__icon">
            <img src="../example/images/icons/customer.png" alt="">
        </div>
        <p class="weui-grid__label">客户列表</p>
    </a>
    <a href="manager/processing.jsp" class="weui-grid">
        <div class="weui-grid__icon">
            <img src="../example/images/icons/msg.png" alt="">
        </div>
        <p class="weui-grid__label">进行中</p>
    </a>
    <a href="manager/aboutMe.jsp" class="weui-grid">
        <div class="weui-grid__icon">
            <img src="../example/images/icons/aboutMe.png" alt="">
        </div>
        <p class="weui-grid__label">个人中心</p>
    </a>
    <a href="manager/counting.jsp" class="weui-grid">
        <div class="weui-grid__icon">
            <img src="../example/images/icons/count.png" alt="">
        </div>
        <p class="weui-grid__label">统计</p>
    </a>
    <a href="manager/empList.jsp" class="weui-grid">
        <div class="weui-grid__icon">
            <img src="../example/images/icons/sale.png" alt="">
        </div>
        <p class="weui-grid__label">职工列表</p>
    </a>
    <a href="#" class="weui-grid">
        <div class="weui-grid__icon">
            <img src="../example/images/icons/loading.png" alt="">
        </div>
        <p class="weui-grid__label">正在开发</p>
    </a>

</div>
</body>
</html>
