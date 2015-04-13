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
	margin: 10px auto;
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
	<div>
		<div>
		<!-- 	<a target="_blank"
				href="http://a.dangdang.com/tjump.php?q=asnW8VJmbaYBw4SL9HN%2Flx8DtUrZjsDm3pDNIuEmzYFoa%2Ba2%2BnYSGhbP0WYciTgpd4opTBInhLhizMbz6824mm38Q%3D%3D">
				<img alt="" style="width:809px;height:44px;" src="../images/ad.jpg">
			</a> -->
		</div>
		<c:choose>
			<c:when test="${page.size!=0}">
				<table class="" cellpadding="0" cellspacing="0"
					style="width:810px;border: 1px solid #DDD;margin-top: 8px">
					<thead
						style="background-color: #F7F7F7;width: 100%;height: 30px;font-size: 14px;font-family: Microsoft Yahei;font-weight:bold;color: #009379;">
						<tr>
							<th width="80px"></th>
							<th width="80px" style="text-align: left;">图书名称</th>
							<th width="100px">订单号</th>
							<th width="80px">购买数量</th>
							<th width="80px">单价</th>
							<th width="80px">小计</th>
							<th width="80px">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.list}" var="orde">
							<tr
								style="height: 100px;text-align:center;font-family: verdana, arial, sans-serif;font-size:14px; ">
								<td width="80px" style="border-top: 1px solid #DDD;"><img
									alt="" width="60px" height="80px"
									src="<%= this.getServletContext().getContextPath() %>${orde.orde_book.book_picture}"></td>
								<td width="160px"
									style="text-align: left;border-top: 1px solid #DDD;">${orde.orde_book.book_name}</td>
								<td width="160px"
									style="border-top: 1px solid #DDD;text-align:left;">${orde.orde_number}</td>
								<td width="80px" style="border-top: 1px solid #DDD;">${orde.orde_book_amount}</td>
								<td width="80px" style="border-top: 1px solid #DDD;">${orde.orde_book.book_price}</td>
								<td width="80px" style="border-top: 1px solid #DDD;">${orde.orde_price}</td>
								<td width="80px"
									style="border-top: 1px solid #DDD;font-size: 12px;"><c:choose>
										<c:when test="${orde.orde_status==0}">
											<a style="color:red"
												href="./goAssertOrder.htm?orderid=${orde.orde_id}">去下单</a>
										</c:when>
										<c:when test="${orde.orde_status==1}">
											<a style="color:red;cursor: pointer;" onclick="(alert('已成功提醒卖家发货！'))">提醒卖家发货</a>
										</c:when>
										<c:when test="${orde.orde_status==2}">
											<a style="color:red"
												href="./goReceiveOrder.htm?orderid=${orde.orde_id}">确认收货</a>
										</c:when>
										<c:when test="${orde.orde_status==3}">已完成，<a
												style="color:red"
												href="./goCommentOrder.htm?orderid=${orde.orde_id}">去评价</a>
										</c:when>
										<c:when test="${orde.orde_status==4}">已完成</c:when>
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
								href="./goAllOrderByUser.htm?assertStatus=${assertStatus}&pageNum=${page.prePage}">上一页</a></td>
						</c:if>
						<c:forEach items="${page.navigatepageNums}" var="nav">
							<c:if test="${nav == page.pageNum}">
								<td style="font-weight: bold;color: #009379;">${nav}</td>
							</c:if>
							<c:if test="${nav != page.pageNum}">
								<td><a
									href="./goAllOrderByUser.htm?assertStatus=${assertStatus}&pageNum=${nav}">${nav}</a></td>
							</c:if>
						</c:forEach>
						<c:if test="${page.hasNextPage}">
							<td><a
								href="./goAllOrderByUser.htm?assertStatus=${assertStatus}&pageNum=${page.nextPage}">下一页</a></td>
						</c:if>
					</tr>
				</table>
			</c:when>
			<c:otherwise>
				<div align="center">
					<table class="" cellpadding="0" cellspacing="0"
						style="width: 810px;border: 4px solid #DDD;margin-top: 8px">
						<tr height="100px" style="text-align: center;">
							<td>此处没有交易,去<a style="color: red" target="_top" href="/BookHouse/">购物</a></td>
						</tr>
					</table>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>