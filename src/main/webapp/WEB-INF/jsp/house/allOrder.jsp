<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
<style type="text/css">
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
	<!-- <a target="_blank"
		href="http://a.dangdang.com/tjump.php?q=asnW8VJmbaYBw4SL9HN%2Flx8DtUrZjsDm3pDNIuEmzYFoa%2Ba2%2BnYSGhbP0WYciTgpd4opTBInhLhizMbz6824mm38Q%3D%3D">
		<img alt="" style="width:809px;height:44px;" src="../images/ad.jpg">
	</a> -->
	<c:choose>
	<c:when test="${page.size!=0}">
		<table class="" cellpadding="0" cellspacing="0"
			style="width:100%;border: 1px solid #DDD;margin-top: 8px">
			<thead
				style="background-color: #F7F7F7;width: 100%;font-size: 14px;font-family: Microsoft Yahei;font-weight:bold;color: #009379;">
				<tr height="30px">
					<th width="80px"></th>
					<th width="120px" style="text-align: left;">图书名称</th>
					<th width="100px">订单号</th>
					<th width="80px">买家</th>
					<th width="40px">数量</th>
					<th width="60px">单价</th>
					<th width="60px">小计</th>
					<th width="80px">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${page.list}" var="order">
					<tr
						style="height: 100px;text-align:center;font-family: verdana, arial, sans-serif;font-size:14px; ">
						<td width="80px" style="border-top: 1px solid #DDD;"><img
							alt="" width="60px" height="80px"
							src=" <%= this.getServletContext().getContextPath() %>${order.orde_book.book_picture}"></td>
						<td width="160px"
							style="text-align: left;border-top: 1px solid #DDD;">${order.orde_book.book_name}</td>
						<td width="160px"
							style="border-top: 1px solid #DDD;text-align:left;">${order.orde_number}</td>
						<td width="80px" style="border-top: 1px solid #DDD;">${order.orde_user.user_nick_name}</td>
						<td width="40px" style="border-top: 1px solid #DDD;">${order.orde_book_amount}</td>
						<td width="60px" style="border-top: 1px solid #DDD;">${order.orde_book.book_price}</td>
						<td width="60px" style="border-top: 1px solid #DDD;">${order.orde_price}</td>
						<td width="80px"
							style="border-top: 1px solid #DDD;font-size: 12px;"><c:choose>
								<c:when test="${order.orde_status==1}">
									<a style="color:red"
										href="./sendOrder.htm?orde_id=${order.orde_id}">确认订单并发货</a>
								</c:when>
								<c:when test="${order.orde_status==2}">等待收货确认</c:when>
								<c:when test="${order.orde_status==3}">交易已完成，等待评价</c:when>
								<c:when test="${order.orde_status==4}">交易已完成</c:when>
								<c:otherwise></c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<table class="gridtable" style="text-align: center;">
			<tr>
				<c:if test="${page.hasPreviousPage}">
					<td><a
						href="./goAllOrderByHouse.htm?assertStatus=${assertStatus}&pageNum=${page.prePage}">上一页</a></td>
				</c:if>
				<c:forEach items="${page.navigatepageNums}" var="nav">
					<c:if test="${nav == page.pageNum}">
						<td style="font-weight: bold;color: #009379;">${nav}</td>
					</c:if>
					<c:if test="${nav != page.pageNum}">
						<td><a
							href="./goAllOrderByHouse.htm?assertStatus=${assertStatus}&pageNum=${nav}">${nav}</a></td>
					</c:if>
				</c:forEach>
				<c:if test="${page.hasNextPage}">
					<td><a
						href="./goAllOrderByHouse.htm?assertStatus=${assertStatus}&pageNum=${page.nextPage}">下一页</a></td>
				</c:if>
			</tr>
		</table>
	</c:when>
	<c:otherwise>
		<div align="center">
			<table class="" cellpadding="0" cellspacing="0"
						style="width: 810px;border: 4px solid #DDD;margin-top: 8px">
				<tr height="100px" style="text-align: center;">
					<td>此处没有交易</td>
				</tr>
			</table>
		</div>
	</c:otherwise>
</c:choose>
</body>
</html>