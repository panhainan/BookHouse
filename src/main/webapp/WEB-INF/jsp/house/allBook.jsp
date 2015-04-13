<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>
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
						<th width="100px">图书</th>
						<th width="160px" style="text-align:left">名称</th>
						<th width="200px">类别</th>
						<th width="60px">数量</th>
						<th width="80px">价格</th>
						<th width="90px">状态</th>
						<th width="100px">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${page.list}" var="book">
						<tr
							style="height: 80px;text-align:center;font-family: verdana, arial, sans-serif;font-size:14px; ">
							<td width="100px" style="border-top: 1px solid #DDD;"><img
								alt="" width="60px" height="65px"
								src=" <%= this.getServletContext().getContextPath() %>${book.book_picture}"></td>
							<td width="160px"
								style="border-top: 1px solid #DDD;text-align:left;">${book.book_name}</td>
							<td width="200px" style="border-top: 1px solid #DDD;">${book.book_type}</td>
							<td width="60px" style="border-top: 1px solid #DDD;">${book.book_sum}</td>
							<td width="80px" style="border-top: 1px solid #DDD;">${book.book_price}</td>
							<td width="90px" style="border-top: 1px solid #DDD;"><c:choose>
									<c:when test="${book.book_status==true}">已上架</c:when>
									<c:otherwise>待上架</c:otherwise>
								</c:choose></td>
							<td width="100px" style="border-top: 1px solid #DDD;"><c:choose>
									<c:when test="${book.book_status==true}">
										<a href="./downBook.htm?bookid=${book.book_id}"
											style="color: red;">下架</a>
									</c:when>
									<c:otherwise>
										<a href="./upBook.htm?bookid=${book.book_id}"
											style="color: red;">上架</a>
									</c:otherwise>
								</c:choose></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<table class="gridtable" style="text-align: center;">
				<tr>
					<c:if test="${page.hasPreviousPage}">
						<td><a
							href="./goAllBookByHouse.htm?updown=${updown}&pageNum=${page.prePage}">上一页</a></td>
					</c:if>
					<c:forEach items="${page.navigatepageNums}" var="nav">
						<c:if test="${nav == page.pageNum}">
							<td style="font-weight: bold;color: #009379;">${nav}</td>
						</c:if>
						<c:if test="${nav != page.pageNum}">
							<td><a
								href="./goAllBookByHouse.htm?updown=${updown}&pageNum=${nav}">${nav}</a></td>
						</c:if>
					</c:forEach>
					<c:if test="${page.hasNextPage}">
						<td><a
							href="./goAllBookByHouse.htm?updown=${updown}&pageNum=${page.nextPage}">下一页</a></td>
					</c:if>
				</tr>
			</table>
		</c:when>
		<c:otherwise>
			<div align="center">
				<table class="" cellpadding="0" cellspacing="0"
					style="width: 810px;border: 4px solid #DDD;margin-top: 8px">
					<tr height="100px" style="text-align: center;">
						<td>此处没有图书前往<a style="color: red" href="/BookHouse/book/goAddBook.htm"
								target="houseright">添加图书</a></td>
					</tr>
				</table>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>