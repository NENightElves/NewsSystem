<%--
  Created by IntelliJ IDEA.
  User: NENightElves
  Date: 2018/6/9
  Time: 23:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="MyPackage.newsManagement" %>
<html>
<head>
    <%@include file="head.html"%>
    <title>用户管理</title>
</head>

<body>
    <%@include file="checkauth90.jsp"%>
    <%@include file="nav.jsp"%>
    <%
        if (request.getParameter("del")!=null) newsManagement.delUser(request.getParameter("del"));
    %>
    <div class="container">
    <table class="table table-striped table-bordered">
        <caption>新闻发布管理</caption>
        <thead>
        <tr>
            <th width="30%">用户名</th>
            <th width="30%">密码</th>
            <th width="20%">权限</th>
            <th width="20%">操作</th>
        </tr>
        </thead>
        <tbody>

        <%
            String[][] str;
            str=newsManagement.getUser();
            for(int i=0;i<str.length;i++)
            {
        %>
        <tr>
            <td><%=str[i][0]%></td>
            <td><%=str[i][1]%></td>
            <td><%=str[i][2]%></td>
            <td>
                <button class="btn btn-danger" onclick="window.location.href='usermanagement.jsp?del=<%=str[i][0]%>'">删除</button>
            </td>
        </tr>
        <%}%>
        </tbody>
    </table>
    <form role="form" action="UserManagementAction.jsp" method="post">
        <div class="form-group" style="float: right">
        <input type="text" class="form-control" name="usr" placeholder="用户名">
        <input type="text" class="form-control" name="pw" placeholder="密码">
        <input type="text" class="form-control" name="auth" placeholder="权限">
        <br>
        <input type="submit" class="btn btn-primary" value="添加用户" style="float: right">
        </div>
    </form>
    </div>
</body>
</html>
