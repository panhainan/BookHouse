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

<title>确认下单</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="/BookHouse/js/jquery-1.11.0.js"></script>
<script type="text/javascript">
	function useThisAddress(id) {
		$(".ordername").val($(".addrname" + id).text());
		$(".orderusername").val($(".addrusername" + id).text());
		$(".orderphone").val($(".addrphone" + id).text());
	}
</script>
<style type="text/css">
body,html {
	width: 100%;
	padding: 0px;
	margin: auto;
	text-align: center;
}
</style>
</head>

<body>
	<div id="topDIV"><jsp:include page="../top.jsp"></jsp:include></div>
	<div align="center">
		<p style="font-size: 14px;font-family: Microsoft Yahei;font-weight:bold;">确认订单</p>
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
				<tr
					style="height: 100px;text-align:center;font-family: verdana, arial, sans-serif;font-size:14px; ">
					<td width="80px" style="border-top: 4px solid #DDD;"><img
						alt="" width="60px" height="80px"
						src=" <%= this.getServletContext().getContextPath() %>${order.orde_book.book_picture}"></td>
					<td width="160px"
						style="text-align: left;border-top: 4px solid #DDD;">${order.orde_book.book_name}</td>
					<td width="80px" style="border-top: 4px solid #DDD;">${order.orde_book_amount}</td>
					<td width="80px" style="border-top: 4px solid #DDD;">${order.orde_book.book_price}</td>
					<td width="80px" style="border-top: 4px solid #DDD;">${order.orde_price}</td>
					<td width="80px"
						style="border-top: 4px solid #DDD;font-size: 12px;"><a
						style="color:red" href="javascript:history.go(-1);">放回购物车</a></td>
				</tr>

			</tbody>
		</table>
		<p style="font-size: 14px;font-family: Microsoft Yahei;font-weight:bold;">选择收货地址(前往<a href="/BookHouse/user/main.htm" style="color:red" >个人中心</a>添加新地址)</p>
		<table class="" cellpadding="0" cellspacing="0"
			style="width: 1004px;border: 4px solid #DDD;min-height:300px;margin-top: 8px">
			<thead
				style="background-color: #F7F7F7;width: 100%;height: 30px;font-size: 14px;font-family: Microsoft Yahei;font-weight:bold;color: #009379;">
				<tr>
					<th width="80px">收货人</th>
					<th width="80px">联系电话</th>
					<th width="80px">收货地址</th>
					<th width="80px">操作</th>
				</tr>
			</thead>
			<tbody style="text-align: center;font-size: 14px;font-family: Microsoft Yahei;">
				<c:forEach items="${userListAddress}" var="address">
					<tr height="40px;">
						<td class="addrusername${address.addr_id}">${address.addr_user_name}</td>
						<td class="addrphone${address.addr_id}">${address.addr_phone}</td>
						<td class="addrname${address.addr_id}">${address.addr_name}</td>
						<td><a style="text-decoration: underline;cursor:pointer"
							onclick="useThisAddress('${address.addr_id}')">使用该地址</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<p style="font-size: 14px;font-family: Microsoft Yahei;font-weight:bold;">确认收货地址</p>
		<form method="post" action="/BookHouse/order/assertOrder.htm" style="width:1004px;border: 4px solid #DDD;font-size: 14px;font-family: Microsoft Yahei;font-weight:bold;">
			<input type="hidden" value="${order.orde_id}" name="orde_id" /> 
			<br/> 收货人：<input type="text" class="orderusername" name="orde_addr_user_name" readonly="readonly" />
			联系电话：<input type="text" class="orderphone" name="orde_addr_phone" readonly="readonly" /><br/> <br/> 
			地&nbsp;&nbsp;&nbsp;&nbsp;址：<textarea rows="2" class="ordername" name="orde_addr_name" readonly="readonly" cols="43" style="resize:none;vertical-align: top;"></textarea>
			<br/> <br/> <input type="submit" value="确认下单" /><br/> <br/> 
		</form>
	</div><div class="mainbottom" style="float: left;color: black;font-size: 13px;font-family: Microsoft Yahei;">Copyright@梦之站 | 湖南省长沙市(雨花区)万家丽南路2段960号 电话：0731-2309047 邮箱：dreamstationx.@sina.com </div>
</body>

</html>
