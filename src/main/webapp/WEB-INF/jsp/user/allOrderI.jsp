<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/BookHouse/js/jquery-1.11.0.js"></script>
<title>购物车</title>
<style type="text/css">
body,html {
	width: 100%;
	padding: 0px;
	margin: auto;
	text-align: center;
}

table.gridtable {
	font-family: verdana, arial, sans-serif;
	font-size: 11px;
	color: #333333;
	border-width: 1px;
	border-collapse: collapse;
	margin: 20px auto;
}

table.gridtable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
}

table.gridtable td {
	min-width: 30px;
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #DDDDDD;
	background-color: #F7F7F7;
}

a:VISITED,a:LINK {
	color: black;
	text-decoration: none;
}
</style>
</head>
<body>
	<div id="topDIV"><jsp:include page="../top.jsp"></jsp:include></div>
	<div align="center" style="text-align: center;min-height: 500px;">
		<div>
			<!-- <a target="_blank"
				href="http://a.dangdang.com/tjump.php?q=asnW8VJmbaYBw4SL9HN%2Flx8DtUrZjsDm3pDNIuEmzYFoa%2Ba2%2BnYSGhbP0WYciTgpd4opTBInhLhizMbz6824mm38Q%3D%3D">
				<img alt="" style="width:809px;height:44px;" src="../images/ad.jpg">
			</a> -->
		</div>
		<c:choose>
			<c:when test="${listOrder!=null}">
				<div align="center">
					<table class="" cellpadding="0" cellspacing="0"
						style="width: 1004px;border: 4px solid #DDD;min-height:300px;margin-top: 8px">
						<thead
							style="background-color: #F7F7F7;width: 100%;height: 30px;font-size: 14px;font-family: Microsoft Yahei;font-weight:bold;color: #009379;">
							<tr>
								<th width="80px"></th>
								<th width="80px" style="text-align: left;">图书名称</th>
								<th width="80px">购买数量</th>
								<th width="80px">单价</th>
								<th width="80px">小计</th>
								<th width="80px">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listOrder}" var="orde">
								<tr
									style="height: 100px;text-align:center;font-family: verdana, arial, sans-serif;font-size:14px; ">
									<td width="80px" style="border-top: 4px solid #DDD;"><img
										alt="" width="60px" height="80px"
										src=" <%= this.getServletContext().getContextPath() %>${orde.orde_book.book_picture}"></td>
									<td width="160px"
										style="text-align: left;border-top: 4px solid #DDD;">${orde.orde_book.book_name}</td>
									<td width="80px" style="border-top: 4px solid #DDD;">${orde.orde_book_amount}</td>
									<td width="80px" style="border-top: 4px solid #DDD;">${orde.orde_book.book_price}</td>
									<td width="80px" style="border-top: 4px solid #DDD;">${orde.orde_price}</td>
									<td width="80px"
										style="border-top: 4px solid #DDD;font-size: 12px;"><c:choose>
											<c:when test="${orde.orde_status==0}">
												<a style="color:red"
													href="./goAssertOrder.htm?orderid=${orde.orde_id}">去下单</a>
											</c:when>
											<c:otherwise></c:otherwise>
										</c:choose></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:when>
			<c:otherwise>
				<div align="center">
					<table class="" cellpadding="0" cellspacing="0"
						style="width: 1004px;border: 4px solid #DDD;margin-top: 8px">
						<tr height="200px" style="text-align: center;">
							<td>您的购物车中暂时没有商品，您可以：<a style="color: red"
								href="/BookHouse/">去购物</a>或者回到<a style="color: red"
								href="/BookHouse/user/main.htm">个人中心</a></td>
						</tr>
					</table>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="mainbottom"
		style="float: left;color: black;font-size: 13px;font-family: Microsoft Yahei;">Copyright@梦之站
		| 湖南省长沙市(雨花区)万家丽南路2段960号 电话：0731-2309047 邮箱：dreamstationx.@sina.com</div>
</body>
</html>