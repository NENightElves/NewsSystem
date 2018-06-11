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
<%@include file="checkauth90.jsp"%>
<%@include file="nav.jsp"%>
<%
    if (request.getParameter("name")!=null)
    {
        newsManagement.setNewsStatus(request.getParameter("name"));
    }
    if (request.getParameter("del")!=null)
    {
        newsManagement.delNews(request.getParameter("del"));
    }
%>

<div class="container">
    <div class="jumbotron">
        <table class="table table-striped table-bordered">
            <caption>新闻发布管理</caption>
            <thead>
            <tr>
                <th width="50%">新闻名称</th>
                <th width="20%">发布时间</th>
                <th width="10%">状态</th>
                <th width="15%">操作</th>
            </tr>
            </thead>
            <tbody>

            <%
                String[][] str;
                str=newsManagement.getNewsStatus();
                String[] btnname=new String[str.length];
                String[] btnstyle=new String[str.length];
                for(int i=0;i<str.length;i++)
                {
                    if (str[i][2].equals("0"))
                    {
                        btnname[i]="撤回";
                        str[i][2]="已发布";
                        btnstyle[i]="btn-default";
                    }
                    else
                    {
                        btnname[i]="发布";
                        str[i][2]="未发布";
                        btnstyle[i]="btn-primary";
                    }
            %>
            <tr>
                <td><%=str[i][0]%></td>
                <td><%=str[i][1]%></td>
                <td><%=str[i][2]%></td>
                <td>
                    <button class="btn <%=btnstyle[i]%>" onclick="window.location.href='newspublishmanagement.jsp?name=<%=str[i][1]%>'"><%=btnname[i]%></button>
                    &nbsp;&nbsp;
                    <button class="btn btn-danger" onclick="window.location.href='newspublishmanagement.jsp?del=<%=str[i][1]%>'">删除</button>
                </td>
            </tr>
            <%}%>
            </tbody>
        </table>


    </div>
</div>
</body>
</html>
