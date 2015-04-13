<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
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

<title>修改收货地址</title>

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
	修改收货地址
	<hr>
	<form action="/BookHouse/address/editAddr.htm" method="post">
	<input value="${address.addr_id}" name="addr_id" type="hidden" />
	收件地址:<input value="${address.addr_name}" name="addr_name" type="text" /><br/>
	<br/>收&nbsp;件&nbsp;人:<input value="${address.addr_user_name}" name="addr_user_name" type="text" /><br/>
	<br/>联系电话:<input value="${address.addr_phone}" name="addr_phone" type="text" /><br/>
	<br/><input type="submit" value="保存资料"/>
	</form>
</body>
</html>
