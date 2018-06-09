<%--
  Created by IntelliJ IDEA.
  User: NENightElves
  Date: 2018/6/9
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="head.html"%>
    <title>评论管理</title>
</head>
<body>
<%@include file="nav.jsp"%>
<%
    if (request.getParameter("del")!=null) newsManagement.delComments(request.getParameter("del"));
%>
<div class="container">
    <div class="btn-group">
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
            默认<span class="caret"></span>
        </button>
        <ul class="dropdown-menu" role="menu">
                <%
                String[][] str;
                if (request.getParameter("category")!=null) str=newsManagement.getNews(Integer.parseInt(request.getParameter("category")));
                else if (request.getParameter("title")!=null) str=newsManagement.getNews(request.getParameter("title"));
                else str=newsManagement.getNewsAll();
                for(int i=0;i<str.length;i++)
                {%>
                    <li><a href="commentmanagement.jsp?name=<%=str[i][2]%>"><%=str[i][1]%></a></li>
                <%}%>
        </ul>
    </div>

    <div class="jumbotron">
        <table class="table table-striped table-bordered">
            <caption>评论管理</caption>
            <thead>
            <tr>
                <th width="50%">评论名称</th>
                <th width="20%">发布时间</th>
                <th width="10%">评论者</th>
                <th width="15%">操作</th>
            </tr>
            </thead>
            <tbody>

            <%
                String[][] strr;
                if (request.getParameter("name")!=null) strr=newsManagement.getComments(request.getParameter("name")); else strr=newsManagement.getComments();
                for(int i=0;i<strr.length;i++)
                {
            %>
            <tr>
                <td><%=strr[i][0]%></td>
                <td><%=strr[i][3]%></td>
                <td><%=strr[i][1]%></td>
                <td>
                    <button class="btn btn-danger" onclick="window.location.href='commentmanagement.jsp?del=<%=strr[i][3]%>'">删除</button>
                </td>
            </tr>
            <%}%>
            </tbody>
        </table>

</div>
</body>
</html>
