<%--
  Created by IntelliJ IDEA.
  User: NENightElves
  Date: 2018/6/6
  Time: 0:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="MyPackage.userModule" %>
<%
    if (request.getParameter("flag").equals("3"))
    {
        session.invalidate();
    }
    else
    {
        if (request.getParameter("flag").equals("1"))
        {
            String usr = request.getParameter("usr");
            String pw = request.getParameter("pw");
            if (userModule.isLoginSuc(usr, pw))
            {
                session.setAttribute("usr", usr);
                session.setAttribute("auth", userModule.getUsrAuth(usr));
                session.setAttribute("msg", 10);
            } else
            {
                if (!userModule.isUserExist(usr))
                {
                    session.setAttribute("msg", 11);
                }
                else
                {
                    session.setAttribute("msg", 12);
                }
            }
        }
        if (request.getParameter("flag").equals("2"))
        {
            String usr = request.getParameter("usr");
            String pw = request.getParameter("pw");
            if (userModule.isUserExist(usr))
            {
                session.setAttribute("msg", 21);
            }
            else
            {
                userModule.setUsr(usr,pw);
                session.setAttribute("msg", 20);
            }
        }
    }
    response.sendRedirect("index.jsp");

%>