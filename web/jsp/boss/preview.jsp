<%--
  Created by IntelliJ IDEA.
  User: YYY
  Date: 2019/1/5
  Time: 13:33
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>任务预览</title>
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
    <p class="page__desc">任务预览</p>
</div>
<div id="taskList"></div>
<div class="weui-form-preview">
    <div class="weui-form-preview__hd">
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">客户姓名</label>
            <em class="weui-form-preview__value">[name]</em>
        </div>
    </div>
    <div class="weui-form-preview__bd">
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">工作人员</label>
            <span class="weui-form-preview__value">[server]</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">客户房号</label>
            <span class="weui-form-preview__value">[room]</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">业务员</label>
            <span class="weui-form-preview__value">[sale]</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">预计开始时间</label>
            <span class="weui-form-preview__value">[time]</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">任务创建时间</label>
            <span class="weui-form-preview__value">[createDate]</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">任务内容</label>
            <span class="weui-form-preview__value">[content]</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">任务地址</label>
            <span class="weui-form-preview__value">[address]</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">备注</label>
            <span class="weui-form-preview__value">[remark]</span>
        </div>
        <div class="weui-form-preview__item">
            <label class="weui-form-preview__label">任务状态</label>
            <span class="weui-form-preview__value">[status]</span>
        </div>
    </div>
    <div class="weui-form-preview__ft">
        <a class="weui-form-preview__btn weui-form-preview__btn_default" href="javascript:" id="edit">修改</a>
        <button class="weui-form-preview__btn weui-form-preview__btn_primary"  id="confirm">确定</button>
    </div>
</div>
<script type="text/javascript">
    $().ready(function () {
        var storage=window.sessionStorage;
        var reg = new RegExp("\\[([^\\[\\]]*?)\\]", 'igm'); //i g m是指分别用于指定区分大小写的匹配、全局匹配和多行匹配。
        var myHtml = document.getElementById("taskTemp").innerHTML;
        console.log(myHtml);
        var source = myHtml.replace(reg,function (node,key) {
            return {
                'name'       :  storage['custName'],
                'server'     :  storage['servName'],
                'room'       : '',
                'sale'       : '',
                'time'       :storage['servTime'],
                'createDate' :'',
                'content'    : storage['servContent'],
                'address'    : storage['servAddress'],
                'remark'     : storage['servRemark'],
                'status'     :''
            }[key];
        });
        console.log(source);
        $('#taskList').append(source);
        $('#taskList').append(source);
    })
</script>
</body>
</html>
