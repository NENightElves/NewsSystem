<%--
  Created by IntelliJ IDEA.
  User: NENightElves
  Date: 2018/6/6
  Time: 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@page pageEncoding="UTF-8" %>
<%@page import="MyPackage.newsManagement" %>
<div class="container">
    <div class="jumbotron">
        <%
            String[][] str;
            if (request.getParameter("category")!=null) str=newsManagement.getNews(Integer.parseInt(request.getParameter("category"))); else str=newsManagement.getNews();
            for(int i=0;i<str.length;i++)
            {%>
                <a class="btn btn-default btn-block" style="text-align: left" href="<%=str[i][0]%>"><%=str[i][1]%><label style="float: right"><small><%=str[i][2]%></small></label></a>
            <%}
        %>
    </div>
</div>