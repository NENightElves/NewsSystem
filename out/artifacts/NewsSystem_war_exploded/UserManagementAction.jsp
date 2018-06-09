<%--
  Created by IntelliJ IDEA.
  User: NENightElves
  Date: 2018/6/9
  Time: 23:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="MyPackage.newsManagement" %>
<%
    String user = request.getParameter("usr");
    String pw = request.getParameter("pw");
    int auth = Integer.parseInt(request.getParameter("auth"));
    boolean f=newsManagement.setUser(user,pw,auth);
    if (f)
        response.getWriter().println("<script>alert('添加成功');window.location.href='usermanagement.jsp'</script>");
    else
        response.getWriter().println("<script>alert('添加失败');window.location.href='usermanagement.jsp'</script>");
%>
