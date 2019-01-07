<%--
  Created by IntelliJ IDEA.
  User: YYY
  Date: 2018/12/25
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
    <link rel="stylesheet" href="../../style/weui.css"/>
    <link rel="stylesheet" href="../../example/example.css"/>
    <script type="text/javascript" src="../../js/jquery.min.js"></script>
    <script type="text/javascript" src="../../js/myjs.js"></script>
    <script src="../../lib/jquery.js"></script>
    <script src="../../dist/jquery.validate.js"></script>
</head>
<body>
<div class="page__hd">
    <h1 class="page__title" id="tittleName"></h1>
    <p class="page__desc">基本信息</p>
</div>
<div class="page__bd">
    <div class="weui-form-preview">
        <div class="weui-form-preview__hd">
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">姓名</label>
                <em class="weui-form-preview__value" id="userName"></em>
            </div>
        </div>
        <div class="weui-form-preview__bd">
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">性别</label>
                <span class="weui-form-preview__value" id="gender"></span>
            </div>
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">生日</label>
                <span class="weui-form-preview__value" id="birth"></span>
            </div>
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">职位</label>
                <span class="weui-form-preview__value" id="possion"></span>
            </div>
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">微信号</label>
                <span class="weui-form-preview__value" id="nickname"></span>
            </div>
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">所属公司</label>
                <span class="weui-form-preview__value" id="branch"></span>
            </div>
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">联系地址</label>
                <span class="weui-form-preview__value" id="adress"></span>
            </div>
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">联系方式</label>
                <span class="weui-form-preview__value" id="userTel"></span>
            </div>
        </div>
    </div>
    <div class="weui-form-preview__ft">
        <a class="weui-form-preview__btn weui-form-preview__btn_default" href="javascript:" id="edit">修改</a>
        <button class="weui-form-preview__btn weui-form-preview__btn_primary" onClick="javascript:history.back(-1);" id="goBack">返回</button>
    </div>
</div>
</div>
<div id="loadingToast" style="display:none;">
    <div class="weui-mask_transparent"></div>
    <div class="weui-toast">
        <i class="weui-loading weui-icon_toast"></i>
        <p class="weui-toast__content">数据加载中</p>
    </div>
</div>
<div id="toast" style="display: none;">
    <div class="weui-mask_transparent"></div>
    <div class="weui-toast">
        <i class="weui-icon-success-no-circle weui-icon_toast"></i>
        <p class="weui-toast__content">加载完成</p>
    </div>
</div>
<div class="js_dialog" id="androidDialog2" style="display: none;">
    <div class="weui-mask"></div>
    <div class="weui-dialog weui-skin_android">
        <div class="weui-dialog__bd">
            信息拉取失败，请重试！
        </div>
        <div class="weui-dialog__ft">
            <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_default">返回</a>
            <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary">重新加载</a>
        </div>
    </div>
</div>
<script type="text/javascript">
    $('#edit').on('click',function () {
        window.location.href="../sale/sale_info.jsp"
    }),
        $(function () {
            var storage=window.sessionStorage;
            var $loadingToast  = $('#loadingToast'),
                $androidDialog2 = $('#androidDialog2');
            $loadingToast.fadeIn(100);
            var openid=storage["openid"];
            console.log("openid:"+openid);
            var url="/user/firstLogin.do?role=sale"
            $.post(url,function (data) {
                if (data=="true"){
                    window.location.href="../sale/sale_info.jsp"
                }
                else {
                    $.post("/user/getEmpInfo.do",{
                            "openid":openid
                        },function (data) {
                            $('#tittleName').html(data.name);
                            $('#userName').html(data.name);
                            $('#birth').html(data.birthday);
                            $('#gender').html(data.gender);
                            $('#nickname').html(data.wechat);
                            $('#branch').html(data.branch);
                            $('#adress').html(data.address);
                            $('#userTel').html(data.tel);
                            $loadingToast.fadeOut(100);
                        }
                        ,"json"
                    );
                }
            })
        });
    function getCookie (name)//取cookies函数
    {
        console.log("getCookie");
        var Str = document.cookie;
        var arr=Str.split(";");
        for (var i=0;i<arr.length;i++) {
            console.log(arr);
        }
        console.log("null") ;
        return null;
    };
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
