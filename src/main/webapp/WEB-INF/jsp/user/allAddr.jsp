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
	<p
		style="font-size: 14px;font-family: Microsoft Yahei;font-weight:bold;">
		我的收货地址(<a href="/BookHouse/address/goAddAddr.htm" style="color:red">添加新地址</a>)
	</p>

	<c:choose>
		<c:when test="${listAddr!=null}">
			<table class="" cellpadding="0" cellspacing="0"
				style="width:810px;border: 1px solid #DDD;min-height:300px;margin-top: 8px">
				<thead
					style="background-color: #F7F7F7;width: 100%;height: 30px;font-size: 14px;font-family: Microsoft Yahei;font-weight:bold;color: #009379;">
					<tr>
						<th width="80px">收货人</th>
						<th width="80px">联系电话</th>
						<th width="80px">收货地址</th>
						<th width="80px">操作</th>
					</tr>
				</thead>
				<tbody
					style="text-align: center;font-size: 14px;font-family: Microsoft Yahei;">
					<c:forEach items="${listAddr}" var="address">
						<tr height="40px;">
							<td style="border-top: 1px solid #DDD;"
								class="addrusername${address.addr_id}">${address.addr_user_name}</td>
							<td style="border-top: 1px solid #DDD;"
								class="addrphone${address.addr_id}">${address.addr_phone}</td>
							<td style="border-top: 1px solid #DDD;"
								class="addrname${address.addr_id}">${address.addr_name}</td>
							<td style="border-top: 1px solid #DDD;"><a
								href="/BookHouse/address/goEditAddr.htm?addrid=${address.addr_id}">修改</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:when>
		<c:otherwise>
			<div align="center">
				<table class="" cellpadding="0" cellspacing="0"
					style="width: 810px;border: 4px solid #DDD;margin-top: 8px">
					<tr height="100px" style="text-align: center;">
						<td>没有收货地址，去<a href="/BookHouse/address/goAddAddr.htm" style="color:red">添加</a></td>
					</tr>
				</table>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>
