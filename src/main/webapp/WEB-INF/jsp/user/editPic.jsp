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

<title>上传个人头像</title>

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
	上传个人头像
	<hr>
	<div align="center"><br/>
		<img alt="" style="width: 160px;height:160px;"
			src="<%= this.getServletContext().getContextPath() %>${loginUser.user_picture}">
		<form action="/BookHouse/user/editPic.htm"
			enctype="multipart/form-data" method="post">
			<br/><br/>
			<input style="font-size: 14px;height: 20px;width: 200px;" id="f_file"
				type="text"> <input value="选择" onclick="fu.click()"
				type="button"> <input name="imgFile" id="fu"
				onchange="f_file.value=this.value" style="display:none" type="file">
			<input type="submit" value="确定上传" />
		</form>
	</div>
</body>
</html>
