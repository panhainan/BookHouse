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

<title>注册</title>

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
<script type="text/javascript">
	function houseRegist(){
		var house_login_name = $("#house_login_name").val();
		var house_login_password = $("#house_login_password").val();
		var houseRpassword = $("#houseRpassword").val();
		var house_login_email = $("#house_login_email").val();
		$.ajax({
			type : "post",
			url : "/BookHouse/house/regist.htm?house_login_name=" + house_login_name
					+ "&house_login_password=" + house_login_password + "&houseRpassword="
					+ houseRpassword+"&house_login_email="+house_login_email,
			dataType : "json",
			success : function(data) {
				alert(data.message);
				if(data.ok==true){
					  window.location.href="/BookHouse/goLogin.htm"; 
				}
			},
			error : function() {
				alert("错误！");
			}
		});
	}
	function userRegist(){
		var user_login_name = $("#user_login_name").val();
		var user_login_password = $("#user_login_password").val();
		var userRpassword = $("#userRpassword").val();
		var user_login_email = $("#user_login_email").val();
		$.ajax({
			type : "post",
			url : "/BookHouse/user/regist.htm?user_login_name=" + user_login_name
					+ "&user_login_password=" + user_login_password + "&userRpassword="
					+ userRpassword+"&user_login_email="+user_login_email,
			dataType : "json",
			success : function(data) {
				alert(data.message);
				if(data.ok==true){
					  window.location.href="/BookHouse/goLogin.htm"; 
				}
			},
			error : function() {
				alert("错误！");
			}
		});
	}
</script>
</head>

<body>
	<div align="center" style="	font-family: Microsoft Yahei;">
		<div
			style="width:400px;height:31px;border-bottom: 3px solid #F44700;margin-top: 100px;">
			<div
				style="cursor:default;width:100px;height:30px;float: left;color:white;font-weight: bolder;line-height: 30px;border: 1px solid #F44700;border-bottom:0px;background-color: #F44700"
				id="bookInfoClick">个人注册</div>
			<div
				style="cursor:pointer;width:100px;height:30px;float: left;color:#6D6E75;font-weight: bolder;line-height: 30px;border: 1px solid #DDD;border-bottom:0px"
				id="bookComentClick">店铺注册</div>
		</div>
		<div style="width: 400px;">
			<div id="bookIntr" style="display: block;float: left;width: 398px;border: 1px solid #DDD;">
				<form action="/BookHouse/user/regist.htm" method="post">
					<br /> <br />用&nbsp;户&nbsp;名：<input name="user_login_name" type="text" id="user_login_name" /> <br /> <br />
					密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input name="user_login_password" type="password" id="user_login_password" /><br /> <br />
					确认密码：<input name="userRpassword" type="password"  id="userRpassword"/><br /> <br />
					邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：<input name="user_login_email" type="text"  id="user_login_email"/><br /> <br />
					<input value="注册" type="button"   onclick="userRegist()"/>&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-size: 12px;">已有账号？去<a href="/BookHouse/goLogin.htm" target="_top" style="color:red">登录</a></font><br /><br />
				</form>
			</div>
			<div id="bookComment" style="display: none;float: left;width: 398px;border: 1px solid #DDD;">
				<form action="/BookHouse/house/regist.htm" method="post">
					<br /> <br />用&nbsp;户&nbsp;名：<input name="house_login_name" type="text" id="house_login_name" /> <br /> <br />
					密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input name="house_login_password" type="password" id="house_login_password" /><br /> <br />
					确认密码：<input name="houseRpassword" type="password" id="houseRpassword" /><br /> <br />
					邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：<input name="house_login_email" type="text" id="house_login_email" /><br /> <br />
					<input value="注册" type="button"  onclick="houseRegist()" />&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-size: 12px;">已有账号？去<a href="/BookHouse/goLogin.htm" target="_top" style="color:red">登录</a></font><br /><br />
				</form>
			</div>
		</div>
	</div>
</body>
</html>
