<%--
  Created by IntelliJ IDEA.
  User: NENightElves
  Date: 2018/6/9
  Time: 17:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="MyPackage.newsManagement" %>
<html>
<head>
    <%@include file="head.html"%>
    <title>新闻</title>
</head>
<body>
<%@include file="nav.jsp"%>
<%
    String name=request.getParameter("name");
    String[] newsstr=newsManagement.getNewsPath(name);
%>
<div class="container">
    <h1 style="text-align: center"><%=newsstr[1]%></h1>
    <small style="float: right">作者：<%=newsstr[4]%>&nbsp;&nbsp;&nbsp;创建时间：<%=newsstr[2]%>&nbsp;&nbsp;&nbsp;分类：<%=newsstr[3]%></small>
    <br>
    <div class="jumbotron">
        <%=newsstr[0]%>
    </div>

    <h2>评论</h2>
    <%
        String[][] strr;
        strr=newsManagement.getComments(name);
        for(int i=0;i<strr.length;i++)
        {%>
        <div class="jumbotron">
            <label><%=strr[i][0]%></label><small style="float: right">评论者：<%=strr[i][2]%>&nbsp;评论时间：<%=strr[i][3]%></small>
        </div>
    <%}%>
    <br><br>
    <form role="form" action="CommentPublishAction.jsp" method="post">
        <input type="hidden" name="flag" value="<%=request.getParameter("name")%>">
        <textarea class="form-control" style="resize: none;white-space: nowrap" name="comment" placeholder="评论" rows="5"></textarea>
        <br>
        <input type="submit" class="btn btn-default" value="提交" style="float: right">
    </form>

</div>


</body>
</html>
