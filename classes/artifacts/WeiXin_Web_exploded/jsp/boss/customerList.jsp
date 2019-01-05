<%--
  Created by IntelliJ IDEA.
  User: YYY
  Date: 2018/12/25
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cmn-Hans">
<head>
    <title>客户列表</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
    <link rel="stylesheet" href="../../style/weui.css"/>
    <link rel="stylesheet" href="../../example/example.css"/>
    <script type="text/javascript" src="../../js/jquery.min.js"></script>
    <script type="text/javascript" src="../../js/myjs.js"></script>
    <script src="../../lib/jquery.js"></script>
    <script src="../../dist/jquery.validate.js"></script>
</head>
<body>
<div class="weui-cells__title">客户列表</div>
<div class="weui-cells" id="myList">
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
        var $loadingToast  = $('#loadingToast');
        var timeout= setTimeout(function () {
            $loadingToast.fadeOut(100);
        },5000);
        $loadingToast.fadeIn(100);
        $.post("/user/getCustomerList.do",{
            "role":"boss",
            "openid":storage["openid"]
        },function (data) {
            if (timeout) {
                clearTimeout(timeout);
                timeout=null;
            }
            $.each(data,function(idx,obj)
            {
                var openid1=obj.openid;
                var content="<a class=\"weui-cell weui-cell_access\" onclick=\"detailPage('"+openid1+"')\" href=\"javascript:;\">\n" +
                    "        <div class=\"weui-cell__bd\">\n" +
                    "            <p id=\"\">"+obj.name+"</p>\n" +
                    "        </div>\n" +
                    "        <div class=\"weui-cell__ft\">\n" +
                    "        </div>\n" +
                    "    </a>";
                $("#myList").append(content);
                $loadingToast.fadeOut(100);
            });
        })
    });

    detailPage =function (openid) {
        var storage=window.sessionStorage;
        storage["c_openid"]=openid;
        location.href="/jsp/detailInfo.jsp";
    }

</script>
</body>
</html>
