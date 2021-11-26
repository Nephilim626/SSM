<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
    <title>商城后台管理</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/login.css">
</head>
<body>
<div id="wrapper" class="login-page">
    <div id="login_form" class="form">
        <!-- <form class="login-form" method="post" id="loginForm"> -->
        <form action="${pageContext.request.contextPath}/rest/user/login.do" method="post">
            <h2>登录</h2>
            <input type="text" placeholder="用户名" name="username" id="user_name" />
            <input type="password" placeholder="密码" name="password" id="password" />
            <!-- <button id="login" onclick="login();">登 录</button> -->
            <button type="submit">登 录</button>
        </form>
    </div>
</div>

</body>

<script src="${APP_PATH}/static/js/jquery.min.js"></script>
<%--<script type="text/javascript">
    function dl() {
        var userName = document.getElementById("userName").value;
        var password = document.getElementById("password").value;
        $.ajax({
            url:"/Maven_project/user/logins",
            type:"GET",
            data:{
                userName:userName,
                password:password
            },
            success:function (result) {
                console.info(result);
                if(result == "fail"){
                    window.location.href="<%=basePath%>WebRoot/WEB-INF/jsp/show.jsp";
                }else if(result == "success"){
                    window.location.href="/Maven_project/jsp/head";
                }
            }

        });
    }--%>
</script>

</html>
