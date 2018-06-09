<%@page pageEncoding="utf-8" %>
<%
    if (!(session.getAttribute("usr")!=null && Integer.parseInt(session.getAttribute("auth").toString())>90)) response.sendRedirect("index.jsp");
%>