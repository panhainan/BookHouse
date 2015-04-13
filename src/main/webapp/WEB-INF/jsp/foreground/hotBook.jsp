<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索结果</title>
<script language="javascript" type="text/javascript"
	src="../My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
body,html {
	width: 100%;
	min-height:400px;
	padding: 0px;
	margin: auto;
	text-align: center;
	font-family: Microsoft Yahei;
}

</style>
<script type="text/javascript" src="/BookHouse/js/jquery-1.11.0.js"></script>

</head>
<body>
	<div align="center">
		<div style="float: left;margin-left: 20px;">
			<div style="float: left;">
				<c:forEach items="${listBook}" var="book">
					<div class="bookInfo">
						<a href="./goTheBook.htm?bookid=${book.book_id}" target="_top">
							<div>
								<img alt="" width="100px" height="130px" style="margin-top:6px;"
									src="<%= this.getServletContext().getContextPath() %>${book.book_picture}">
							</div>
							<div style="margin-top: 10px;">${book.book_name}</div>
						</a>
						<div
							style="margin-top: 2px;text-align: left;width: 120px;margin-left: 20px;color:#AAAAAA">${book.book_author}</div>
						<div>
							<div
								style="margin-top: 2px;text-align: left;width: 60px;margin-left: 10px;color:red;float:left;">￥${book.book_price}</div>
							<div
								style="margin-top: 2px;text-align: left;width: 80px;color:#AAAAAA;float:left;">
								月售<font color="#009379">${book.book_sale_sum}</font>件
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>