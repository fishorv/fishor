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
<a href="javascript:;" class="weui-btn weui-btn_primary">选择客户</a><br>
<a href="javascript:;" class="weui-btn weui-btn_primary">添加工作人员</a><br>
<br><br><br>
<a href="javascript:;" class="weui-btn weui-btn_default" id="typePicker">选择服务类型</a>
<br><br><br>
<a href="javascript:;" class="weui-btn weui-btn_default" id="timePicker">选择服务时间</a>
<br><br><br>
<a href="javascript:;" class="weui-btn weui-btn_default" id="datePicker">选择服务日期</a>
<script type="text/javascript">
    $('#typePicker').on('click', function () {
        weui.picker([{
            label: '接送机',
            value: 0
        }, {
            label: '',
            value: 1
        }, {
            label: '入周',
            value: 2
        },{
            label: '促排',
            value: 3
        }, {
            label: '取卵',
            value: 4
        },{
            label: '移植',
            value: 5
        },{
            label: '验孕',
            value: 6
        },{
            label: '复查',
            value: 7
        },{
            label: '其他',
            value: 8
        }], {
            onChange: function (result) {
                console.log(result);
            },
            onConfirm: function (result) {
                console.log(result);
            }
        });
    });
    $('#timePicker').on('click', function () {
        weui.picker([{
            label: '上午',
            value: 'am'
            },
            {
                label: '下午',
                value: 'pm'
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
            defaultValue: ['am', '0','00'],
            onChange: function (result) {
                console.log(result);
            },
            onConfirm: function (result) {
                console.log(result);
            },
            id: 'multiPickerBtn'
        });
    });
    $('#datePicker').on('click', function () {
        weui.datePicker({
            start: 1990,
            end: new Date().getFullYear(),
            onChange: function (result) {
                console.log(result);
            },
            onConfirm: function  (result) {
                console.log(result);
            }
        });
    });


</script>
<script src="https://res.wx.qq.com/open/libs/weuijs/1.0.0/weui.min.js"></script>
</body>
</html>
