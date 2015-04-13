<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心&lt;卖家版&gt;</title>
<link href="../css/house/main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="main" align="center">
		<jsp:include page="../top.jsp"></jsp:include>
		<div class="mainbody">
			<div class="bodyleft">
				<div class="leftofmybusiness">
					<div class="leftdivtopname">
						<font style="margin-left: 20px;">店铺交易</font>
					</div>
					<div class="leftdivcontent">
						<ul>
							<li><a
								href="/BookHouse/order/goAllOrderByHouse.htm?assertStatus=1"
								target="houseright">待确定订单</a></li>
							<li><a
								href="/BookHouse/order/goAllOrderByHouse.htm?assertStatus=2"
								target="houseright">待确认收货</a></li>
							<li><a
								href="/BookHouse/order/goAllOrderByHouse.htm?assertStatus=3"
								target="houseright">待评价订单</a></li>
							<li><a
								href="/BookHouse/order/goAllOrderByHouse.htm?assertStatus=4"
								target="houseright">已完成交易</a></li>
						</ul>
					</div>
				</div>
				<div class="leftofmystock">
					<div class="leftdivtopname">
						<font style="margin-left: 20px;">店铺存货</font>
					</div>
					<div class="leftdivcontent">
						<ul>
							<li><a href="/BookHouse/book/goAllBookByHouse.htm?updown=up"
								target="houseright">已上架图书</a></li>
							<li><a
								href="/BookHouse/book/goAllBookByHouse.htm?updown=down"
								target="houseright">待上架图书</a></li>
							<li><a href="/BookHouse/book/goAddBook.htm"
								target="houseright">添加图书</a></li>
						</ul>
					</div>
				</div>
				<div class="leftofmyinformation">
					<div class="leftdivtopname">
						<font style="margin-left: 20px;">店铺资料</font>
					</div>
					<div class="leftdivcontent">
						<ul>
							<li><a href="./goEditInfo.htm" target="houseright">修改基本资料</a></li>
							<li><a href="./goEditLogo.htm" target="houseright">上传店铺头像</a></li>
							<li><a href="./goEditPass.htm" target="houseright">修改登录密码</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="bodycenter">
				<iframe src="/BookHouse/house/goHome.htm" name="houseright"
					marginheight="0" marginwidth="0" width="810px" height="540px"
					scrolling="No" frameborder="0" noresize="noresize" id="houseright"
					title="houseright"></iframe>
			</div>
		</div>
		<div class="mainbottom" style="float: left;color: black;font-size: 13px;font-family: Microsoft Yahei;">Copyright@梦之站 | 湖南省长沙市(雨花区)万家丽南路2段960号 电话：0731-2309047 邮箱：dreamstationx.@sina.com </div>
	</div>
</body>
</html>