<%@page pageEncoding="utf-8" %>
<li class="dropdown">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
        新闻管理
        <b class="caret"></b>
    </a>
    <ul class="dropdown-menu">
        <li>
            <a href="newspublish.jsp">新闻发布</a>
        </li>
        <li>
            <a href="newsupdate.jsp">新闻修改</a>
        </li>
        <%if (Integer.parseInt(session.getAttribute("auth").toString())>90) {%>
        <li>
            <a href="newspublishmanagement.jsp">新闻发布管理</a>
        </li>
        <li>
            <a href="commentmanagement.jsp">评论管理</a>
        </li>
        <li>
            <a href="usermanagement.jsp">用户管理</a>
        </li>
        <%}%>
    </ul>
</li>