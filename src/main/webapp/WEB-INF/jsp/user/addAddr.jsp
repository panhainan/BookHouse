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

<title>My JSP 'addAddr.jsp' starting page</title>

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
	<p style="font-size: 14px;font-family: Microsoft Yahei;font-weight:bold;">添加收货地址</p>
	<hr>
	<form method="post" action="/BookHouse/address/addAddr.htm" style="text-align: center;font-size: 14px;font-family: Microsoft Yahei;">
		<br /> 收货人：<input type="text" name="addr_user_name" /> 联系电话：<input
			type="text" name="addr_phone" /><br /> <br />
		地&nbsp;&nbsp;&nbsp;&nbsp;址：
		<textarea rows="2" name="addr_name" cols="43"
			style="resize:none;vertical-align: top;"></textarea> <br /> <br />
		<input type="submit" value="确认添加" />
	</form>

</body>
</html>
