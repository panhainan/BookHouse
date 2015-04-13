<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>修改基本资料</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	修改基本资料
	<hr>
	<div align="center">
		<form action="./user/editInfo.htm" method="post">
		用&nbsp;户&nbsp;名:<input value="${loginUser.user_login_name}" name="user_login_name" type="text" /><br/>
		<br/>登录邮箱:<input value="${loginUser.user_login_email}" name="user_login_email" type="text" /><br/>
		<br/>性&nbsp;&nbsp;&nbsp;&nbsp;别:<input value="${loginUser.user_sex}" name="user_sex" type="text" /><br/>
		<br/>昵&nbsp;&nbsp;&nbsp;&nbsp;称:<input value="${loginUser.user_nick_name}" name="user_nick_name" type="text"  /><br/>
		<br/><input type="submit" value="保存资料"/>
		</form>
	</div>
</body>
</html>
