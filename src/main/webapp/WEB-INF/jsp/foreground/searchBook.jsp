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
	padding: 0px;
	margin: auto;
	text-align: center;
	font-family: Microsoft Yahei;
}

.bookBody {
	margin-top: 10px;
	width: 1004px;
	min-height: 660px;
}

input[type="text"] {
	width: 300px;
}

.intrDIV {
	width: 780px;
	border-left: 1px solid #DDD;
	border-right: 1px solid #DDD;
	border-bottom: 1px solid #DDD;
	float: left;
}

.intrDIV  thead {
	background-color: #F7F7F7;
	width: 100%;
	height: 30px;
	font-size: 14px;
	font-family: Microsoft Yahei;
	font-weight: bold;
	color: #009379;
	font-size: 14px;
}

.intrDIV  tbody tr td {
	border-top: 1px solid #DDD;
}

.intrDIV  tbody tr td textarea {
	margin-left: 20px;
	width: 94%;
	min-width: 776px;
	min-height: 120px;
	resize: none;
	border: 0px;
	font-size: 15px;
	line-height: 24px;
	font-family: Microsoft Yahei;
}
</style>
<script type="text/javascript" src="/BookHouse/js/jquery-1.11.0.js"></script>

</head>
<body>
	<div align="center">
		<jsp:include page="../top.jsp"></jsp:include>
		<div class="bookBody">
			<div class="leftIframe" style="float: left;border: 1px solid #DDD;">
				<iframe src="/BookHouse/book/goHotBook.htm" name="bookLeftIframe"
					marginheight="0" marginwidth="0" width="180px" height="600px"
					scrolling="No" frameborder="0" noresize="noresize"
					id="bookLeftIframe" title="bookLeftIframe"></iframe>
			</div>
			<div style="float: left;width: 780px;margin-left: 20px;">
				<div style="float: left;">
					<c:forEach items="${listBook}" var="book">
						<div style="height:80px;width:798px;float: left;border: 1px solid #DDD;">
							<div style="height:80px;float: left;margin-top: 10px;margin-left: 20px;">
								<img alt="" width="50px" height="60px"
									onerror="this.src='../images/book.jpg'"
									src="<%= this.getServletContext().getContextPath() %>${book.book_picture}">
							</div>
							<div
								style="width:300px;;height: 50px;margin-left: 20px;line-height:50px;margin-top: 10px;float: left;font-family: Microsoft Yahei;font-size: 14px;">${book.book_name}</div>
								<div
								style="height: 50px;margin-left: 20px;line-height:50px;margin-top: 10px;float: left;font-family: Microsoft Yahei;font-size: 14px;">单价￥${book.book_price}</div>
								<div
								style="height: 50px;margin-left: 20px;line-height:50px;margin-top: 10px;float: left;font-family: Microsoft Yahei;font-size: 14px;">已售${book.book_sale_sum}件</div>
								<div
								style="height: 50px;margin-left: 20px;line-height:50px;margin-top: 10px;float: left;font-family: Microsoft Yahei;font-size: 14px;">用户评分（${book.book_score}）</div>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>
	</div>
	<div class="mainbottom" style="float: left;color: black;font-size: 13px;font-family: Microsoft Yahei;">Copyright@梦之站 | 湖南省长沙市(雨花区)万家丽南路2段960号 电话：0731-2309047 邮箱：dreamstationx.@sina.com </div>
</body>
</html>