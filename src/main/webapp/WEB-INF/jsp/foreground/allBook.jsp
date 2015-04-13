<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>所有图书</title>
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
.bookInfo {
	font-size: 13px;
	font-family: Microsoft Yahei;
	width: 150px;
	height: 200px;
	float: left;
	/* background-color: orange; */
	margin: 6px;
	text-align: center
}

.bookInfo a:HOVER {
	color: red;
	text-decoration: uderline;
}
</style>
</head>
<body style="text-align: center;">
	<!-- <a target="_blank"
		href="http://a.dangdang.com/tjump.php?q=asnW8VJmbaYBw4SL9HN%2Flx8DtUrZjsDm3pDNIuEmzYFoa%2Ba2%2BnYSGhbP0WYciTgpd4opTBInhLhizMbz6824mm38Q%3D%3D">
		<img alt="" style="width:780px;height:44px;" src="../images/ad.jpg">
	</a> -->
	<div style="width: 810px;min-height:200px;float: left;">
		<c:if test="${page!=null}">
			<c:forEach items="${page.list}" var="book">
				<div class="bookInfo">
					<a href="./goTheBook.htm?bookid=${book.book_id}" target="_top">
						<div><img alt="" width="100px" height="130px" style="margin-top:6px;"
						src="<%= this.getServletContext().getContextPath() %>${book.book_picture}"></div>
						<div style="margin-top: 10px;">${book.book_name}</div>
					</a>
					<div style="margin-top: 2px;text-align: left;width: 120px;margin-left: 20px;color:#AAAAAA;font-size: 12px;">${book.book_author}</div>
					<div><div style="margin-top: 2px;text-align: left;width: 60px;margin-left: 10px;color:red;float:left;">￥${book.book_price}</div>
					<div style="margin-top: 2px;text-align: left;width: 80px;color:#AAAAAA;float:left;">月售<font color="#009379">${book.book_sale_sum}</font>件</div></div>
				</div>
			</c:forEach>
		</c:if>
	</div>
	<div style="width: 800px;float: left;">
		<table class="gridtable" style="text-align: center;">
			<tr>
				<c:if test="${page.hasPreviousPage}">
					<td><a href="./goAllBook.htm?pageNum=${page.prePage}">上一页</a></td>
				</c:if>
				<c:forEach items="${page.navigatepageNums}" var="nav">
					<c:if test="${nav == page.pageNum}">
						<td style="font-weight: bold;color: #009379;">${nav}</td>
					</c:if>
					<c:if test="${nav != page.pageNum}">
						<td><a href="./goAllBook.htm?pageNum=${nav}">${nav}</a></td>
					</c:if>
				</c:forEach>
				<c:if test="${page.hasNextPage}">
					<td><a href="./goAllBook.htm?pageNum=${page.nextPage}">下一页</a></td>
				</c:if>
			</tr>
		</table>
	</div>
</body>
</html>