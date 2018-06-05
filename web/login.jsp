<%@page pageEncoding="UTF-8" %>
<div class="form-group">
    <input type="text" class="form-control" name="usr" placeholder="用户名">
    <input type="text" class="form-control" name="pw" placeholder="密码">
    <input type="button" class="btn btn-default" value="登录" onclick="document.getElementById('flag').value='1';this.form.submit()">
    <input type="button" class="btn btn-default" value="注册" onclick="document.getElementById('flag').value=2;this.form.submit()">
</div>