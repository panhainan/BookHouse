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
	<form action="./house/editInfo.do" method="post">
	用&nbsp;户&nbsp;名:<input value="${loginHouse.hous_login_name}" name="hous_login_name" type="text" /><br/>
	<br/>登录邮箱:<input value="${loginHouse.hous_login_email}" name="hous_login_email" type="text" /><br/>
	<br/>店&nbsp;铺&nbsp;名:<input value="${loginHouse.hous_name}" name="hous_name" type="text"  /><br/>
	<br/>联系电话:<input value="${loginHouse.hous_phone}" name="hous_phone" type="text"  /><br/>
	<br/>公司名称:<input value="${loginHouse.hous_company_name}" name="hous_company_name" type="text"  /><br/>
	<br/>公司地址:<input value="${loginHouse.hous_company_addr}" name="hous_company_addr" type="text"  /><br/>
	<br/>描述符合:<input value="${loginHouse.hous_score_description}" name="hous_score_description" type="text"  /><br/>
	<br/>服务质量:<input value="${loginHouse.hous_score_service}" name="hous_score_service" type="text"  /><br/>
	<br/>物流速度:<input value="${loginHouse.hous_score_speed}" name="hous_score_speed" type="text"  /><br/>
	<br/><input type="submit" value="保存资料"/>
	</form>
</body>
</html>
