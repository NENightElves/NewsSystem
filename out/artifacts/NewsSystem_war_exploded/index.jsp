<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <title>新闻系统</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
    <%
        if (session.getAttribute("msg")!=null)
        {
            int x=Integer.parseInt(session.getAttribute("msg").toString());
            if (x==11) %><script>alert("用户名不存在")</script><%
            if (x==12) %><script>alert("密码错误")</script><%
            if (x==21) %><script>alert("用户名已存在")</script><%
            if (x==20) %><script>alert("注册成功")</script><%
        }
    %>
    <%@include file="nav.jsp" %>

</body>

</html>