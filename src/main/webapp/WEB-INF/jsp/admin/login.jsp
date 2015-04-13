<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录</title>
<script type="text/javascript">
	// 页面若在框架内，则跳出框架
	if (self != top) {
		top.location = self.location;
	};
</script>
</head>
<body>
<h1>管理员登录</h1>
	<form action="/BookHouse/admin/login.htm" method="post">
		用户名：<input name="admin_login_name" type="text" /> <br /> <br />
		密&nbsp;&nbsp;码：<input name="admin_login_password" type="password" /><br /> <br />
		<input value="登录" type="submit" />
	</form>
</body>
</html>