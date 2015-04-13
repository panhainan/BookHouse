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

<title>登录</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
	// 页面若在框架内，则跳出框架
	if (self != top) {
		top.location = self.location;
	};
</script>
<script type="text/javascript" src="/BookHouse/js/jquery-1.11.0.js"></script>
<script type="text/javascript">
	$(function() {
		$("#bookComentClick").click(function() {
			$("#bookInfoClick").css("background-color", "white");
			$("#bookInfoClick").css("border-color", "#DDD");
			$("#bookInfoClick").css("color", "#6D6E75");
			$("#bookInfoClick").css("cursor", "pointer");
			$(this).css("background-color", "#F44700");
			$(this).css("border-color", "#F44700");
			$(this).css("color", "white");
			$(this).css("cursor", "default");
			$("#bookIntr").css("display", "none");
			$("#bookComment").css("display", "block");
		});
		$("#bookInfoClick").click(function() {
			$("#bookComentClick").css("background-color", "white");
			$("#bookComentClick").css("border-color", "#DDD");
			$("#bookComentClick").css("color", "#6D6E75");
			$("#bookComentClick").css("cursor", "pointer");
			$(this).css("background-color", "#F44700");
			$(this).css("border-color", "#F44700");
			$(this).css("color", "white");
			$(this).css("cursor", "default");
			$("#bookComment").css("display", "none");
			$("#bookIntr").css("display", "block");
		});
	});
</script>
</head>

<body>
	<div align="center" style="	font-family: Microsoft Yahei;">
		<div
			style="width:400px;height:31px;border-bottom: 3px solid #F44700;margin-top: 100px;">
			<div
				style="cursor:default;width:100px;height:30px;float: left;color:white;font-weight: bolder;line-height: 30px;border: 1px solid #F44700;border-bottom:0px;background-color: #F44700"
				id="bookInfoClick">个人登录</div>
			<div
				style="cursor:pointer;width:100px;height:30px;float: left;color:#6D6E75;font-weight: bolder;line-height: 30px;border: 1px solid #DDD;border-bottom:0px"
				id="bookComentClick">店铺登录</div>
		</div>
		<div style="width: 400px;">
			<div id="bookIntr" style="display: block;float: left;width: 398px;border: 1px solid #DDD;">
				<form action="/BookHouse/user/login.htm" method="post">
					<br /> <br />用户名：<input name="username" type="text" /> <br /> <br />
					密&nbsp;&nbsp;码：<input name="userpass" type="password" /><br /> <br />
					<input value="登录" type="submit" />&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-size: 12px;">没有账号？去<a href="/BookHouse/goRegist.htm" target="_top" style="color:red">注册</a></font><br /><br />
				</form>
			</div>
			<div id="bookComment" style="display: none;float: left;width: 398px;border: 1px solid #DDD;">
				<form action="/BookHouse/house/login.htm" method="post">
					<br /> <br />用户名：<input name="housename" type="text" /> <br /> <br />
					密&nbsp;&nbsp;码：<input name="housepass" type="password" /><br /> <br />
					<input value="登录" type="submit" />&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-size: 12px;">没有账号？去<a href="/BookHouse/goRegist.htm" target="_top" style="color:red">注册</a></font><br /><br />
				</form>
			</div>
		</div>
	</div>
</body>
</html>
