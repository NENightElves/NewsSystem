<%@page pageEncoding="UTF-8"%>
<%@page import="MyPackage.newsManagement" %>
<%
    if (session.getAttribute("msg")!=null)
    {
        int x=Integer.parseInt(session.getAttribute("msg").toString());
        if (x==11) %><script>alert("用户名不存在")</script><%
        if (x==12) %><script>alert("密码错误")</script><%
        if (x==21) %><script>alert("用户名已存在")</script><%
        if (x==20) %><script>alert("注册成功")</script><%
        session.setAttribute("msg", 0);
    }
%>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">新闻</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li>
                    <a href="index.jsp" class="active">首页</a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">分类<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                    <%
                        String[][] str1=newsManagement.getCategorys();
                        for(int i=0;i<str1.length;i++)
                        {%>
                            <li><a href="index.jsp?category=<%=str1[i][1]%>"><%=str1[i][0]%></a></li>
                        <%}
                    %>
                    </ul>
                </li>
                <% if (session.getAttribute("usr")!=null && Integer.parseInt(session.getAttribute("auth").toString())>20) {%>
                    <jsp:include page="nav_auth.jsp"/>
                <%}%>
            </ul>
            <form class="navbar-form navbar-right" action="LoginAction.jsp" method="post">
                <input id="flag" name="flag" type="hidden">
                <% if (session.getAttribute("usr")==null) {%>
                    <jsp:include page="login.jsp"/>
                <%}else{%>
                    <label>欢迎&nbsp;<%=session.getAttribute("usr")%></label>
                    <input type="button" class="btn btn-default" value="退出" onclick="document.getElementById('flag').value=3;this.form.submit()">
                <%}%>
            </form>
        </div>
    </div>
</nav>
