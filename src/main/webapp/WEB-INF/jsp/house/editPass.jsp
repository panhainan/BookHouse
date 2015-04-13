<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改密码</title>
    
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
  	修改密码
  	<hr>
  	<div align="center" style="vertical-align: middle;height:300px">
	  	<form action="./house/editPass.htm" method="post">
		旧&nbsp;密&nbsp;码:<input  name="old_password" type="password" /><br/>
		<br/>新&nbsp;密&nbsp;码:<input  name="new_password" type="password" /><br/>
		<br/>确认密码:<input  name="assert_new_password" type="password"  /><br/>
		<br/><input type="submit" value="修改密码"/>
		</form>
	</div>
  </body>
</html>
