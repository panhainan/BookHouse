<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${book.book_name}</title>
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
<script type="text/javascript">
	$(function() {
		$("#bookComentClick").click(function() {
			$("#bookInfoClick").css("background-color", "white");
			$("#bookInfoClick").css("border-color", "#DDD");
			$("#bookInfoClick").css("color", "#6D6E75");
			$("#bookInfoClick").css("cursor", "pointer");
			$(this).css("background-color", "#F44700");
			$(this).css("border-color", "#F44700");
			$(this).css("color", "white");
			$(this).css("cursor", "default");
			$("#bookIntr").css("display", "none");
			$("#bookComment").css("display", "block");
		});
		$("#bookInfoClick").click(function() {
			$("#bookComentClick").css("background-color", "white");
			$("#bookComentClick").css("border-color", "#DDD");
			$("#bookComentClick").css("color", "#6D6E75");
			$("#bookComentClick").css("cursor", "pointer");
			$(this).css("background-color", "#F44700");
			$(this).css("border-color", "#F44700");
			$(this).css("color", "white");
			$(this).css("cursor", "default");
			$("#bookComment").css("display", "none");
			$("#bookIntr").css("display", "block");
		});
	});
</script>
<script>
	$(function() {
		var t = $("#text_box");
		$("#add").click(function() {
			if (t.val() == 100) {
				alert("抱歉，订单一次最多只能100！");
			} else {
				t.val(parseInt(t.val()) + 1);
			}
		});
		$("#min").click(function() {
			if (t.val() == 1) {
				alert("抱歉，不能再少啦！");
			} else {
				t.val(parseInt(t.val()) - 1);
			}
		});
		if (t.val() > 100 || t.val() < 0) {
			alert("抱歉，数值范围是1-100！");
			t.val(1);
		}
	});
	function addToBlank(book_id, book_price) {
		var t = $("#text_box");
		var ordebookamount = t.val();
		//console.log(ordebookamount);
		$.ajax({
			type : "post",
			url : "/BookHouse/order/addBookToOrderBag.htm?bookid=" + book_id
					+ "&bookprice=" + book_price + "&ordebookamount="
					+ ordebookamount,
			dataType : "json",
			success : function(data) {
				alert(data.message);
			},
			error : function() {
				alert("请先登录！");
			}
		});
	}
</script>
</head>
<body>
	<div align="center">
		<jsp:include page="../top.jsp"></jsp:include>
		<div class="bookBody">
			<div class="leftIframe" style="float: left;border: 1px solid #DDD;">
				<iframe src="/BookHouse/book/goHotBook.htm" name="bookLeftIframe"
					marginheight="0" marginwidth="0" width="180px" height="660px"
					scrolling="No" frameborder="0" noresize="noresize"
					id="bookLeftIframe" title="bookLeftIframe"></iframe>
			</div>
			<div style="float: left;width: 780px;margin-left: 20px;">
				<div
					style="float: left;width: 780px;height: 280px;margin-top: 20px;">
					<table width="100%" border="0" align="center">
						<tr>
							<td rowspan="10" align="center" valign="middle"><img
								width="160px" height="200px"
								onerror="this.src='../images/book.jpg'"
								src="<%= this.getServletContext().getContextPath() %>${book.book_picture}" /></td>
							<td>图书名称</td>
							<td>${book.book_name}</td>
						</tr>
						<tr>
							<td>在库数量:</td>
							<td>${book.book_sum}</td>
						</tr>
						<tr>
							<td>定&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价</td>
							<td>${book.book_price}</td>
						</tr>
						<tr>
							<td>所属分类</td>
							<td>${book.book_type}</td>
						</tr>
						<tr>
							<td>我&nbsp;要&nbsp;买</td>
							<td>
								<form action="/BookHouse/order/addBookOrder.htm" method="post">
									<input type="hidden" value="${book.book_id}" name="book_id" />
									<input id="min" name="" type="button" value="-"
										style="width: 23px;height: 22px;" /> <input id="text_box"
										name="orde_book_amount" style="width: 30px;height: 20px;"
										type="text" value="1" /> <input id="add" name="" 
										type="button" value="+" style="width: 23px;height: 22px;" />
									<input type="hidden" value="${book.book_price}"
										name="orde_price"> <input value="购买" type="submit"
										style="background-color:  #F44700;border: 0px;width: 60px;height: 30px;color: white;font-size: 16px;font-family: Microsoft Yahei;font-weight: bolder;cursor: pointer;" /><input
										value="放入购物车" type="button"
										onclick="addToBlank(${book.book_id},${book.book_price})"
										style="margin-left:10px;background-color:  #F44700;border: 0px;width: 120px;height: 30px;color: white;font-size: 16px;font-family: Microsoft Yahei;font-weight: bolder;cursor: pointer;" />
								</form>
							</td>
						</tr>
					</table>
				</div>
				<div
					style="width:800px;height:31px;border-bottom: 3px solid #F44700;float: left;">
					<div
						style="cursor:default;width:100px;height:30px;float: left;color:white;font-weight: bolder;line-height: 30px;border: 1px solid #F44700;border-bottom:0px;background-color: #F44700"
						id="bookInfoClick">图书详情</div>
					<div
						style="cursor:pointer;width:100px;height:30px;float: left;color:#6D6E75;font-weight: bolder;line-height: 30px;border: 1px solid #DDD;border-bottom:0px"
						id="bookComentClick">图书评价(${OrderCount})</div>
				</div>
				<div id="bookIntr" style="display: block;float: left;">
					<div>
						<table cellpadding="0" cellspacing="0" class="intrDIV"
							style="border-top: 1px solid #DDD;width:800px;font-family: Microsoft Yahei;font-size: 14px;padding-left: 20px; ">
							<tr height="10px;">
								<td style="border:0"></td>
							</tr>
							<tr height="30px;">
								<td style="border:0;width:60px;">作&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;者：</td>
								<td style="border:0">${book.book_author}</td>

								<td style="border:0;width:60px;">I&nbsp;&nbsp;S&nbsp;&nbsp;B&nbsp;&nbsp;N：</td>
								<td style="border:0">${book.book_isbn}</td>
							</tr>
							<tr height="30px;">
								<td style="border:0">出&nbsp;版&nbsp;社：</td>
								<td style="border:0">${book.book_publish_company}</td>
								<td style="border:0">出版时间：</td>
								<td style="border:0">${book.book_publish_datetime}</td>
							</tr>
							<tr height="10px;">
								<td style="border:0"></td>
							</tr>
						</table>
						<table cellpadding="0" cellspacing="0" class="intrDIV">
							<thead>
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;作者简介:</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><textarea readonly="readonly">${book.book_author_introduce}</textarea></td>
								</tr>
							</tbody>
						</table>
						<table cellpadding="0" cellspacing="0" class="intrDIV"
							style="height: 120px;">
							<thead>
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;图书目录:</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><textarea readonly="readonly">${book.book_catalogue}</textarea></td>
								</tr>
							</tbody>
						</table>
						<table cellpadding="0" cellspacing="0" class="intrDIV">
							<thead>
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;内容简介:</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><textarea readonly="readonly">${book.book_content_introduce}</textarea></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div id="bookComment" style="display: none;float: left;">
					<div
						style="height:50px;width:798px;border: 1px solid #DDD;line-height: 50px;">
						该图书由买家评定最终平均分为：<font color="red">${book.book_score}</font>分(满分为5分)
					</div>
					<c:forEach items="${listOrder}" var="order">
						<div style="height:80px;width:798px;border: 1px solid #DDD;">
							<div style="float: left;margin-left: 20px;width: 80px;">
								<div style="margin: 6px 5px 0px 5px;">
									<img alt="" width="50px" height="50px"
										onerror="this.src='../images/book.jpg'"
										src="<%= this.getServletContext().getContextPath() %>${order.orde_user.user_picture}">
								</div>
								<div
									style="height: 20px;font-family: Microsoft Yahei;font-size: 14px;color: #AAAAAA;">${order.orde_user.user_nick_name}</div>
							</div>
							<div
								style="text-align:left;width:500px;height:80px;line-height:70px;float: left;padding-left: 20px;font-family: Microsoft Yahei;font-size: 14px;">${order.orde_user_comment}</div>
							<div
								style="width:160px;height:80px;line-height:70px;float: left;color: #AAAAAA;font-family: Microsoft Yahei;font-size: 12px;">
								<fmt:formatDate value="${order.orde_datetime}" type="both" />
							</div>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>

	</div>
<div class="mainbottom" style="float: left;color: black;font-size: 13px;font-family: Microsoft Yahei;">Copyright@梦之站 | 湖南省长沙市(雨花区)万家丽南路2段960号 电话：0731-2309047 邮箱：dreamstationx.@sina.com </div>
</body>
</html>