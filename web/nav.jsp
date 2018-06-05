<%@page pageEncoding="UTF-8"%>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">新闻</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li class="active">
                    <a href="#">首页</a>
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
                    <label>欢迎<%=session.getAttribute("usr")%></label>
                    <input type="button" class="btn btn-default" value="退出" onclick="document.getElementById('flag').value=3;this.form.submit()">
                <%}%>
            </form>
        </div>
    </div>
</nav>
