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

<title>下单成功</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="/BookHouse/js/jquery-1.11.0.js"></script>
<style type="text/css">
body,html {
	width: 100%;
	padding: 0px;
	margin: auto;
	text-align: center;
}
</style>
</head>

<body>
	<div id="topDIV"><jsp:include page="../top.jsp"></jsp:include></div>
	<div align="center">
		<table class="" cellpadding="0" cellspacing="0"
			style="width: 1004px;border: 4px solid #DDD;margin-top: 8px">
			<tr height="200px" style="text-align: center;">
				<td>下单成功，您可以：<a style="color: red" href="/BookHouse/">回到首页</a>或者<a
					style="color: red" href="/BookHouse/user/main.htm">个人中心</a></td>
			</tr>
		</table>
	</div>
	<div class="mainbottom"
		style="float: left;color: black;font-size: 13px;font-family: Microsoft Yahei;">Copyright@梦之站
		| 湖南省长沙市(雨花区)万家丽南路2段960号 电话：0731-2309047 邮箱：dreamstationx.@sina.com</div>
</body>

</html>
