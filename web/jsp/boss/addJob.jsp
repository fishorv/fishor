<%--
  Created by IntelliJ IDEA.
  User: YYY
  Date: 2019/1/4
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加任务</title>
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
    <p class="page__desc">添加任务</p>
</div>
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <p id="userName"></p>
        </div>
        <a href="javascript:;" class="weui-btn weui-btn_mini weui-btn_default" id="choseCust">选择客户</a>
    </div>
<br>
<div class="weui-cell">
    <div class="weui-cell__bd">
        <p id="serverName"></p>
    </div>
    <a href="javascript:;" class="weui-btn weui-btn_mini weui-btn_default" id="choseSer">工作人员</a>
</div>
<br>
<a href="javascript:;" class="weui-btn weui-btn_default" id="typePicker">选择服务类型</a>
<br>
<a href="javascript:;" class="weui-btn weui-btn_default" id="datePicker">选择服务日期</a>
<br>
<a href="javascript:;" class="weui-btn weui-btn_default" id="timePicker">选择服务时间</a>
<div class="weui-cells__title">服务地址</div>
<div class="weui-cells">
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <input class="weui-input" id="address" type="text" placeholder="请输入地址"/>
        </div>
    </div>
</div>
<div class="weui-cells__title">详细服务内容</div>
<div class="weui-cells">
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <input class="weui-input" id="content" type="text" placeholder="请输入服务内容"/>
        </div>
    </div>
</div>
<div class="weui-cells__title">备注信息</div>
<div class="weui-cells">
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <input class="weui-input" id="remark" type="text" placeholder="请输入备注信息"/>
        </div>
    </div>
</div>
<br>
<a href="javascript:;" class="weui-btn weui-btn_primary" id="preview">确定</a><br><br><br>
<div class="page__ft">
    <a href="javascript:home()"><img src="../../example/images/icon_footer_link.png" /></a>
</div>
<script type="text/javascript">
    $(function () {
        var storage=window.sessionStorage;
        var custId=storage['custOpen'],
            servId=storage['serverOpen'],
            custName=$("#userName").val(),
            servName=$("#serverName").val(),
            servDate=new Array(),
            servTime=new Array(),
            servType,
            servContent,
            servAddress,
            servRemark;
        $('#userName').html(storage['custName']);
        $('#serverName').html(storage['serverName']);
        $("#choseCust").on('click',function () {
            storage['sRole']='customer';
            location.href='./userList.jsp';
        });
        $("#choseSer").on('click',function () {
            storage['sRole']='sale';
            location.href='./userList.jsp';
        });
        $('#typePicker').on('click', function () {
            weui.picker([{
                label: '接送机',
                value: '接送机'
            }, {
                label: '入周',
                value: '入周'
            },{
                label: '促排',
                value: '促排'
            }, {
                label: '取卵',
                value: '取卵'
            },{
                label: '移植',
                value: '移植'
            },{
                label: '验孕',
                value: '验孕'
            },{
                label: '复查',
                value: '复查'
            },{
                label: '其他',
                value: '其他'
            }], {
                onChange: function (result) {
                    console.log(result);
                },
                onConfirm: function (result) {
                    $('#typePicker').html(result)
                    servType=result;
                }
            });
        });
        $('#timePicker').on('click', function () {
            weui.picker([{
                    label: '上午',
                    value: '0'
                },
                    {
                        label: '下午',
                        value: '1'
                    }
                ],
                [
                {
                    label: '1',
                    value: '1'
                }, {
                    label: '2',
                    value: '2'
                }, {
                    label: '3',
                    value: '3'
                }, {
                    label: '4',
                    value: '4'
                }, {
                    label: '5',
                    value: '5'
                }, {
                    label: '6',
                    value: '6'
                }, {
                    label: '7',
                    value: '7'
                }, {
                    label: '8',
                    value: '8'
                }, {
                    label: '9',
                    value: '9'
                }, {
                    label: '10',
                    value: '10'
                }, {
                    label: '11',
                    value: '11'
                }, {
                    label: '12',
                    value: '12'
                }
                ], [
                    {
                        label: '05',
                        value: '05'
                    }, {
                        label: '10',
                        value: '10'
                    }, {
                        label: '15',
                        value: '15'
                    }, {
                        label: '20',
                        value: '20'
                    }, {
                        label: '25',
                        value: '25'
                    }, {
                        label: '30',
                        value: '30'
                    }, {
                        label: '35',
                        value: '35'
                    }, {
                        label: '40',
                        value: '40'
                    }, {
                        label: '45',
                        value: '45'
                    }, {
                        label: '50',
                        value: '50'
                    }, {
                        label: '55',
                        value: '55'
                    }
                ], {
                    defaultValue: ['am:', '0:','00'],
                    onChange: function (result) {
                        console.log(result);
                    },
                    onConfirm: function (result) {
                        $('#timePicker').html(result);
                        servTime=result;
                    },
                    id: 'multiPickerBtn'
                });
        });
        $('#datePicker').on('click', function () {
            weui.datePicker({
                start: 2010,
                end: new Date().getFullYear(),
                defaultValue:[2019,1,1],
                onChange: function (result) {
                    console.log(result);
                },
                onConfirm: function  (result) {
                    $('#datePicker').html(result);
                    servDate=result;
                }
            });
        });
        $("#preview").on('click',function () {
            servContent=$("#content").val();
            servRemark =$("#remark").val();
            servAddress=$("#address").val();
            var storage=window.sessionStorage;
            var hh=parseInt(servTime[1]);
            var mm=parseInt(servTime[2]);
            if (servTime[0]=='1'&&servTime[1]!='12'){
                hh+=12;
            }
            console.log(servDate[0]+'/'+servDate[1]+'/'+servDate[2]+' '+hh+':'+mm+':00');
            var date= new Date(servDate[0]+'/'+servDate[1]+'/'+servDate[2]+' '+hh+':'+mm+':00');
            console.log(formatDate(date));
            date.getHours();
            storage['servType']=servType;
            storage['servDate']=formatDate(date);
            // storage['servTime']=servTime;
            storage['servAddress']=servAddress;
            storage['servContent']=servContent;
            storage['servRemark']=servRemark;
            $.post("/user/createJob.do",{
                'openid'     :custId,
                'name'       :storage['custName'],
                'time'       :storage['servDate'],
                'serverid'   :storage['serverOpen'],
                'servername' :  storage['serverName'],
                'room'       : '',
                'sale'       : '',
                // 'time'       :storage['servTime'],
                'createDate' :'',
                'content'    : storage['servContent'],
                'address'    : storage['servAddress'],
                'remark'     : storage['servRemark'],
                'status'     :''
            },function (data) {
                if (data=="ture"){
                    location.href='./preview.jsp'
                }
            })
        });
        function formatDate(date) {
            return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate() + ' ' + date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds();
        }
    })


</script>
<script src="https://res.wx.qq.com/open/libs/weuijs/1.0.0/weui.min.js"></script>
</body>
</html>
