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
    <title>客户详细信息</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
    <link rel="stylesheet" href="../style/weui.css"/>
    <link rel="stylesheet" href="../example/example.css"/>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/myjs.js"></script>
    <script src="../lib/jquery.js"></script>
    <script src="../dist/jquery.validate.js"></script>
</head>
<body>
<div class="page__hd">
    <h1 class="page__title" id="tittleName"></h1>
    <p class="page__desc">详细信息</p>
</div>
<div class="page__bd">
    <div class="weui-form-preview">
        <div class="weui-form-preview__hd">
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">姓名</label>
                <em class="weui-form-preview__value" id="c_userName"></em>
            </div>
        </div>
        <div class="weui-form-preview__bd">
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">性别</label>
                <span class="weui-form-preview__value" id="c_gender"></span>
            </div>
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">录入日期</label>
                <span class="weui-form-preview__value" id="c_date"></span>
            </div>
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">年龄</label>
                <span class="weui-form-preview__value" id="c_birth"></span>
            </div>
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">客户分类</label>
                <span class="weui-form-preview__value" id="c_class"></span>
            </div>
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">微信号</label>
                <span class="weui-form-preview__value" id="c_nickname"></span>
            </div>
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">所属公司</label>
                <span class="weui-form-preview__value" id="c_branch"></span>
            </div>
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">联系地址</label>
                <span class="weui-form-preview__value" id="c_adress"></span>
            </div>
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">联系方式</label>
                <span class="weui-form-preview__value" id="c_userTel"></span>
            </div>
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">介绍人</label>
                <span class="weui-form-preview__value" id="c_saleid"></span>
            </div>
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">家属姓名</label>
                <span class="weui-form-preview__value" id="c_relation"></span>
            </div>
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">月经周期</label>
                <span class="weui-form-preview__value" id="c_mesdate"></span>
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
        window.location.href="/customer/customer_info.jsp"
    }),
        $(function () {
            var storage=window.sessionStorage;
            var $loadingToast  = $('#loadingToast'),
                $androidDialog2 = $('#androidDialog2');
            var timeout= setTimeout(function () {
                $loadingToast.fadeOut(100);
            },5000);
            $loadingToast.fadeIn(100);
            var openid=storage["openid"];
            console.log("openid:"+openid);
            var url="/user/firstLogin.do?role=customer"
            $.post(url,function (data) {
                if (data=="true"){
                    window.location.href="/customer/customer_info.jsp"
                }
                else {
                    $.post("/user/getCustomerInfo.do",{
                            "openid":openid
                        },function (data) {
                            if (timeout) {
                                clearTimeout(timeout);
                                timeout=null;
                            }
                            $('#tittleName').html(data.userName);
                            $('#c_userName').html(data.userName);
                            $('#c_date').html(data.createDate);
                            $('#c_gender').html(data.gender);
                            $('#c_nickname').html(data.wechat);
                            $('#c_branch').html(data.branch);
                            $('#c_adress').html(data.address);
                            $('#c_userTel').html(data.userTel);
                            $('#c_mesdate').html(data.mensesDate);
                            $('#c_saleid').html(data.salesId);
                            $('#c_relation').html(data.relationId);
                            $loadingToast.fadeOut(100);
                        }
                        ,"json"
                    );
                }
            })
        });
</script>
</body>
</html>
