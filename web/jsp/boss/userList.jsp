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
<div class="page__bd">
    <div class="weui-search-bar" id="searchBar">
        <form class="weui-search-bar__form">
            <div class="weui-search-bar__box">
                <i class="weui-icon-search"></i>
                <input type="search" class="weui-search-bar__input" id="searchInput" placeholder="搜索" required/>
                <a href="javascript:" class="weui-icon-clear" id="searchClear"></a>
            </div>
            <label class="weui-search-bar__label" id="searchText">
                <i class="weui-icon-search"></i>
                <span>搜索</span>
            </label>
        </form>
        <a href="javascript:" class="weui-search-bar__cancel-btn" id="searchCancel">取消</a>
    </div>
    <div class="weui-cells searchbar-result" id="searchResult">
        <div class="weui-cell weui-cell_access">
            <div class="weui-cell__bd weui-cell_primary">
                <p id="forResult"></p>
            </div>
        </div>
    </div>
</div>
<div class="weui-cells" id="myList"></div>
<div class="js_dialog" id="androidDialog2" style="display: none;">
    <div class="weui-mask"></div>
    <div class="weui-dialog weui-skin_android">
        <div class="weui-dialog__bd" id="msgcontent">
        </div>
        <div class="weui-dialog__ft">
            <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_default"  id="cancel">返回</a>
            <a href="./addJob.jsp" class="weui-dialog__btn weui-dialog__btn_primary" >确定</a>
        </div>
    </div>
</div>
<script type="text/html" id="list">
    <div class="weui-cells">
        <a class="weui-cell weui-cell_access" href="javascript:;">
            <div class="weui-cell__bd">
                <p onclick="setUserName('[userName]','[openId]')">[userName]</p>
            </div>
            <div class="weui-cell__ft">
            </div>
        </a>
    </div>
</script>
<div id="loadingToast" style="display:none;">
    <div class="weui-mask_transparent"></div>
    <div class="weui-toast">
        <i class="weui-loading weui-icon_toast"></i>
        <p class="weui-toast__content">数据加载中</p>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        var userList= new Array();
        var openList= new Array();
        var storage=window.sessionStorage;
        var $loadingToast  = $('#loadingToast');
        var timeout= setTimeout(function () {
            $loadingToast.fadeOut(100);
        },5000);
        $loadingToast.fadeIn(100);
        $("#cancel").on('click',function () {
            $('#androidDialog2').fadeOut(100);
        });
        var url;
        if (storage['sRole']=='customer') {
            url="/user/getCustomerList.do";
        }else {
            url="/user/getEmpList.do"
        }
        $.post(url,{
            "role":"boss",
            "openid":storage["openid"]
        },function (data) {
            if (timeout) {
                clearTimeout(timeout);
                timeout=null;
            }
            $.each(data,function(idx,obj)
            {
                userList.push(obj.name);
                openList.push(obj.openid);
                var reg = new RegExp("\\[([^\\[\\]]*?)\\]", 'igm'); //i g m是指分别用于指定区分大小写的匹配、全局匹配和多行匹配。
                var myHtml = document.getElementById("list").innerHTML;
                console.log(myHtml);
                var source = myHtml.replace(reg,function (node,key) {
                    return {
                        'userName':obj.name,
                        'openId':obj.openid
                    }[key];
                });
                $loadingToast.fadeOut(100);
                $('#myList').append(source);
            });
        });
        var $searchBar = $('#searchBar'),
            $searchResult = $('#searchResult'),
            $searchText = $('#searchText'),
            $searchInput = $('#searchInput'),
            $searchClear = $('#searchClear'),
            $searchCancel = $('#searchCancel');

        hideSearchResult();

        function hideSearchResult(){
            $searchResult.hide();
            $searchInput.val('');
        }
        function cancelSearch(){
            hideSearchResult();
            $searchBar.removeClass('weui-search-bar_focusing');
            $searchText.show();
        }
        $searchText.on('click', function(){
            $searchBar.addClass('weui-search-bar_focusing');
            $searchInput.focus();
        });
        $searchResult.on('click', function(){
            if ( $('#forResult').val()!="未找到用户"){
                if (storage['sRole']=='customer'){
                    storage['custName']= $('#forResult').val();
                    myConfirm('customer');
                }else {
                    storage['serverName']=$('#forResult').val();
                    myConfirm('server');
                }
            }
        });
        $searchInput
            .on('blur', function () {
                if(!this.value.length) cancelSearch();
            })
            .on('input', function(){
                if(this.value.length) {
                    $('#forResult').html("未找到用户");
                    for (var i=0;i<=userList.length;i++){
                        if (userList[i]==this.value){
                            $('#forResult').html(this.value);
                            $('#forResult').val(this.value);
                            break;
                        }
                    }
                    $searchResult.show();
                } else {
                    $searchResult.hide();
                }
            })
        ;
        $searchClear.on('click', function(){
            hideSearchResult();
            $searchInput.focus();
        });
        $searchCancel.on('click', function(){
            cancelSearch();
            $searchInput.blur();
        });
    });
    setUserName =function (name,openid) {
        var storage=window.sessionStorage;
        if (storage['sRole']=='customer'){
            storage['custName']= name;
            storage['custOpen']= openid;
        }else {
            storage['serverName']=name;
            storage['serverOpen']= openid;

        }
        myConfirm(storage['sRole'])
    }

    myConfirm = function (role) {
        var storage=window.sessionStorage,
            $androidDialog2 = $('#androidDialog2');
        if (role=='customer') {
            $("#msgcontent").html("您确定添加"+storage.custName+"为服务客户吗？");

        }else {
            $("#msgcontent").html("您确定添加"+storage.serverName+"为工作人员吗？");
        }
        $androidDialog2.fadeIn(200);
    }
</script>
</body>
</html>
