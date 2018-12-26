<%--
  Created by IntelliJ IDEA.
  User: YYY
  Date: 2018/12/20
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cmn-Hans">
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
    <title>注册</title>
    <link rel="stylesheet" href="../style/weui.css"/>
    <link rel="stylesheet" href="../example/example.css"/>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/myjs.js"></script>
    <script src="../lib/jquery.js"></script>
    <script src="../dist/jquery.validate.js"></script>
</head>
<body>
<div class="weui-cells__title">注册</div>
<div class="weui-cells weui-cells_form" >
    <form  id="getUserBase" action="/user/regist.do">
        <div class="weui-cell" >
            <div class="weui-cell__hd"><label class="weui-label">用户名</label></div>
        <div class="weui-cell__bd">
            <input class="weui-input" name="userName" id="userName" type="text"  placeholder="请输入用户名"/>
        </div>
    </div>
    <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">密码</label></div>
        <div class="weui-cell__bd">
            <input class="weui-input" name="password" id="password1" type="password" placeholder="请设置8位数及以上密码"/>
            <span id="tibs2"></span>
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__hd">
            <label class="weui-label">确认密码</label>
        </div>
        <div class="weui-cell__bd">
            <input class="weui-input" name="password1" id="password2"type="password" placeholder="请确认密码"/>
            <span id="tibs"></span>
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__hd">
            <label class="weui-label">验证码</label></div>
        <div class="weui-cell__bd">
            <input class="weui-input" name = "code" id="code" type="text"/>
        </div>
        <div class="weui-cell__ft">
            <%--<img class="weui-vcode-img" src="../example/images/vcode.jpg" />--%>
            <img class="weui-vcode-img" id="imgObj" alt="验证码" src="${pageContext.request.contextPath}/web/getImgCode.do">
        </div>
    </div>
    <div class="weui-btn-area">
        <input class="weui-btn weui-btn_primary" type="submit" value="确定" id="doLogin"/>
    </div>
    </form>
</div>
    <script type="text/javascript">
        $.validator.setDefaults({
            submitHandler: function(form) {
                form.submit();
            }
        });
        $().ready(function() {
            $(function () {
                $('#getUserBase').validate({
                        rules: {
                            userName: {
                                required: true,
                                minlength: 2
                            },
                            password: {
                                required: true,
                                minlength: 8
                            },
                            password1: {
                                required: true,
                                minlength: 5,
                                equalTo: "#password1"
                            },
                            code: {
                                required: true,
                                minlength: 4,
                                maxlength: 4
                            }
                        },
                        messages: {
                            userName: {
                                required: "请输入用户名",
                                minlength: "长度必须在4个字符",
                            },
                            password: {
                                required: "请输入密码",
                                minlength: "长度必须8以上",
                            },
                            password1: {
                                required: "请输入密码",
                                minlength: "长度必须8以上",
                                equalTo: "前后不一致"
                            },
                            code: {
                                required: "请输入4位验证码",
                                minlength: "请输入4位验证码",
                                maxlength: "请输入4位验证码"
                            }
                        }
                    }
                )

            })
        }),

        $(function () {
                var fromName='${userName}';
                var code='${status}';
                if (fromName!=''){
                    $('#userName').html(fromName);
                    alert(code);
                }

            }

        );
        $('#imgObj').on('click', function(){
            var imgSrc = $("#imgObj");
            var src = imgSrc.attr("src");
            imgSrc.attr("src", chgUrl(src));
        });
        // $('#doLogin').on('click', function(){
        //     $('#getUserBase').submit(function () {
        //
        //     })
        //     validate({
        //         submitHandler:function(form){
        //             alert("submit!");
        //             form.submit();
        //         }
        //     });
            // var userName =$("#userName").val();
            // var password =$("#password1").val();
            // var code     =$("#code").val();
            // var url="/web/regist.do?userName="+userName+"&password="+password+"&code="+code;
            // window.location.href=url;
        // });
        function chgUrl(url) {
            var timestamp = (new Date()).valueOf();
            url = url.substring(0, 20);
            if ((url.indexOf("&") >= 0)) {
                url = url + "×tamp=" + timestamp;
            } else {
                url = url + "?timestamp=" + timestamp;
            }
            return url;
        }

        function myValidate1() {

            var pwd = $("#password1").val();
            var pwd1 = $("#password2").val();
            <!-- 对比两次输入的密码 -->
            if(pwd == pwd1)
            {
                $("#tibs").html("");
                $("#tibs").css("color","green");}
            else {
                $("#tibs").html("两次密码不相同");
                $("#tibs").css("color","red")
                $("#doLogin").attr("disabled","disabled");
            }
        }
        function myValidate2() {
            var pwd = $("#password1").val();
            var num = 0;
            var rule1 = /\d+/;
            var rule2 = /[a-z]+/;
            var rule3 = /[A-Z]+/;
            var rule4 = /[~!@#\$%^&*\{\};,.\?\/'"]/;
            var rule5 = /^.{8,16}$/;
            var flag1 = rule1.test(pwd);
            var flag2 = rule2.test(pwd);
            var flag3 = rule3.test(pwd);
            var flag4 = rule4.test(pwd);
            var flag5 = rule5.test(pwd);
            if (flag1){
                num = num + 1;
            }
            if (flag2){
                num = num + 1;
            }
            if (flag3){
                num = num + 1;
            }
            if (flag4){
                num = num + 1;
            }

            if(!(num >=2&&flag5))
            {
                $("#tibs2").html("密码必须是8-16位数字、大、小写字母、特殊符号中的2种及2种以上的组合！");
                $("#doLogin").attr("disabled","disabled");
            }
            else {
                $("#tibs2").html("");
            }
        }
    </script>
</body>
</html>
