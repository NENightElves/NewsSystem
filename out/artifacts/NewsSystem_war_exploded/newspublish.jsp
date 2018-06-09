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
    <title>新闻发布</title>
</head>
<body>
    <%@include file="checkauth20.jsp"%>
    <%@include file="nav.jsp"%>
    <%
        String name="";
        String[] str;
        if (request.getParameter("name")!=null)
        {
            name = request.getParameter("name");
            str = newsManagement.getNewsPath(name);
        }
        else
        {
            str=new String[5];
            str[0]="";
            str[1]="";
            str[2]="";
            str[3]="";
            str[4]="";
        }
    %>
    <div class="container">
        <div class="jumbotron">

            <form role="form" action="NewsPublishAction.jsp" method="post">
                <input type="text" class="form-control" placeholder="标题" name="title" value="<%=str[1]%>">
                <br><br>
                <textarea class="form-control" style="resize: none;height: 100%;white-space: nowrap" name="news"><%=str[0].replace("<br>","\r\n")%></textarea>
                <br>
                <select class="form-control" style="width: 20%;float: right" name="category">
                    <%
                        String[][] optionstr=newsManagement.getCategorys();
                        for(int i=0;i<optionstr.length;i++)
                        {%>
                    <option value="<%=optionstr[i][1]%>" <% if (optionstr[i][0].equals(str[3])) {%> selected="selected" <%}%>><%=optionstr[i][0]%></option>
                    <%}%>
                </select>
                <br>
                <br>
                <input type="submit" class="btn btn-default" value="提交" style="float: right">
            </form>

        </div>
    </div>

</body>
</html>
