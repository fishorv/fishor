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
    <h1 class="page__title" id="userNameForTittle"></h1>
    <p class="page__desc">您好！</p>
    <br><br><br><br><br><br>
</div>
<div class="weui-grids">
    <a href="/jsp/sale/customers.jsp" class="weui-grid">
        <div class="weui-grid__icon">
            <img src="../example/images/icons/customer.png" alt="">
        </div>
        <p class="weui-grid__label">我的客户</p>
    </a>
    <a href="/jsp/sale/processing.jsp" class="weui-grid">
        <div class="weui-grid__icon">
            <img src="../example/images/icons/prosses.png" alt="">
        </div>
        <p class="weui-grid__label">正在进行</p>
    </a>
    <a href="/jsp/sale/aboutMe.jsp" class="weui-grid">
        <div class="weui-grid__icon">
            <img src="../example/images/icons/aboutMe.png" alt="">
        </div>
        <p class="weui-grid__label">个人中心</p>
    </a>
</div>
<script type="text/javascript">
    $(function () {
        console.log("openid:"+'${openid}');
        if(!window.localStorage){
            alert("浏览器支持localstorage");
            return false;
        }else{
            var storage=window.localStorage;
            //写入a字段
            storage["openid"]='${openid}';
        }
        var nameForTittle='${userInfo.userName}';
        if (nameForTittle==''){
            nameForTittle='${userName}'
        }
        $('#userNameForTittle').html(nameForTittle);
    });
</script>
</body>
</html>
