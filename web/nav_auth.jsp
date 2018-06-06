<%@page pageEncoding="utf-8" %>
<li class="dropdown">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
        新闻管理
        <b class="caret"></b>
    </a>
    <ul class="dropdown-menu">
        <li>
            <a href="#">新闻发布</a>
        </li>
        <%if (Integer.parseInt(session.getAttribute("auth").toString())>90) {%>
        <li>
            <a href="#">新闻发布管理</a>
        </li>
        <li>
            <a href="#">评论管理</a>
        </li>
        <li>
            <a href="#">用户管理</a>
        </li>
        <%}%>
    </ul>
</li>