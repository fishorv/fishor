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
<script type="text/javascript">
    $(function () {
        var storage=window.localStorage;
        $.post("/user/getCustomerList.do",{
            "role":"boss",
            "openid":storage["openid"]
        },function (data) {
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
                console.log(content);
                $("#myList").append(content);
            });
        })
    });

    detailPage =function (openid) {
        var storage=window.localStorage;
        storage["c_openid"]=openid;
        location.href="/jsp/detailInfo.jsp";
    }

</script>
</body>
</html>
