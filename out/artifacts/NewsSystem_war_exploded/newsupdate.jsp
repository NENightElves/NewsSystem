<%--
  Created by IntelliJ IDEA.
  User: NENightElves
  Date: 2018/6/9
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="MyPackage.newsManagement" %>
<html>
<head>
    <%@include file="head.html"%>
    <title>新闻修改</title>
</head>
<body>
<%@include file="checkauth20.jsp"%>
<%@include file="nav.jsp"%>
<div class="container">
    <div class="jumbotron">
        <%
            String[][] str;
            if (request.getParameter("category")!=null) str=newsManagement.getNews(Integer.parseInt(request.getParameter("category"))); else str=newsManagement.getNews();
            for(int i=0;i<str.length;i++)
            {%>
        <a class="btn btn-default btn-block" style="text-align: left" href="newspublish.jsp?name=<%=str[i][2]%>"><%=str[i][1]%><label style="float: right"><small><%=str[i][2]%></small></label></a>
        <%}
        %>
    </div>
</div>
</body>
</html>
