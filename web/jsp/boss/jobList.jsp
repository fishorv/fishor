<%--
  Created by IntelliJ IDEA.
  User: YYY
  Date: 2018/12/25
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>任务列表</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
    <link rel="stylesheet" href="../../style/weui.css"/>
    <link rel="stylesheet" href="../../example/example.css"/>
    <script type="text/javascript" src="../../js/jquery.min.js"></script>
    <script type="text/javascript" src="../../js/myjs.js"></script>
    <script type="text/javascript" src="../../js/jquery-dateformat.min.js"></script>
    <script src="../../lib/jquery.js"></script>
    <script src="../../dist/jquery.validate.js"></script>
</head>
<body>
<div class="page__hd">
    <h1 class="page__title" id="tittleName"></h1>
    <p class="page__desc">任务列表</p>
</div>
<div id="taskList"></div>
<script type="text/html" id="taskTemp">
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
            <a class="weui-form-preview__btn weui-form-preview__btn_primary" href="javascript:">操作</a>
        </div>
        <br>
    </div>
</script>
<br><br>
<a href="/jsp/boss/addJob.jsp" class="weui-btn weui-btn_primary">新建任务</a>
<div class="page__ft">
    <a href="javascript:home()"><img src="../../example/images/icon_footer_link.png" /></a>
</div>
<div id="loadingToast" style="display:none;">
    <div class="weui-mask_transparent"></div>
    <div class="weui-toast">
        <i class="weui-loading weui-icon_toast"></i>
        <p class="weui-toast__content">数据加载中</p>
    </div>
</div>
<script type="text/javascript">
    $().ready(function () {
        // var reg = new RegExp("([\[]*?)\]", 'igm');
        var reg = new RegExp("\\[([^\\[\\]]*?)\\]", 'igm'); //i g m是指分别用于指定区分大小写的匹配、全局匹配和多行匹配。
        var myHtml = document.getElementById("taskTemp").innerHTML;
        $.get("/job/getJobList.do",function (data) {
            $.each(data,function(idx,obj){
                var source = myHtml.replace(reg,function (node,key) {
                    return {
                        'name': obj.name,
                        'server': obj.servername,
                        'room': obj.room,
                        'sale': obj.sale,
                        'time': getLocalTime(obj.time.time),
                        'createDate':getLocalTime(obj.createdate.time),
                        'content': obj.content,
                        'address': obj.address,
                        'remark' : obj.remark,
                        'status' :obj.status
                    }[key];
                });
                $('#taskList').append(source);
            });

        });
    })
    function getLocalTime(nS) {
        return new Date(parseInt(nS) * 1000).toLocaleString().replace(/:\d{1,2}$/,' ');
    }
</script>
</body>
</html>
