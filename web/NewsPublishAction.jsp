<%--
  Created by IntelliJ IDEA.
  User: NENightElves
  Date: 2018/6/9
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="MyPackage.newsManagement" %>
<%
    String title = request.getParameter("title");
    String news = request.getParameter("news");
    int category = Integer.parseInt(request.getParameter("category"));
    String user=session.getAttribute("usr").toString();
    boolean f=newsManagement.setNews(title,news,category,user);
    if (f)
        response.getWriter().println("<script>alert('提交成功');window.location.href='index.jsp'</script>");
    else
        response.getWriter().println("<script>alert('提交失败');window.location.href='index.jsp'</script>");
%>
