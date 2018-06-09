<%--
  Created by IntelliJ IDEA.
  User: NENightElves
  Date: 2018/6/9
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="MyPackage.newsManagement" %>
<%
    String comment = request.getParameter("comment");
    String user;
    if (session.getAttribute("usr")!=null) user = session.getAttribute("usr").toString(); else user="游客";
    String name=request.getParameter("flag");
    boolean f=newsManagement.setComments(comment,user,name);
    if (f)
        response.getWriter().println("<script>alert('提交成功');window.location.href='shownews.jsp?name="+name+"'</script>");
    else
        response.getWriter().println("<script>alert('提交失败');window.location.href='shownews.jsp?name="+name+"'</script>");
%>
