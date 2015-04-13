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
		<div class="maintop">
			<div class="toptool"></div>
			<div class="toplogo"></div>
			<div class="topbar">欢迎来到网上书城</div>
		</div>
		<div class="mainbody">
			<div class="bodyleft">
				<div class="leftofmybusiness">
					<div class="leftdivtopname">
						<font style="margin-left: 20px;">店铺交易</font>
					</div>
					<div class="leftdivcontent">
						<ul>
							<li><a href="./goWaitOrder.do" target="houseright">待结算订单</a></li>
							<li><a href="./goEndOrder.do" target="houseright">已完成订单</a></li>
						</ul>
					</div>
				</div>
				<div class="leftofmystock">
					<div class="leftdivtopname">
						<font style="margin-left: 20px;">店铺存货</font>
					</div>
					<div class="leftdivcontent">
						<ul>
							<li><a href="/BookHouse/book/goAllBook.do" target="houseright">图书存货</a></li>
							<li><a href="/BookHouse/book/goAddBook.do" target="houseright">添加图书</a></li>
						</ul>
					</div>
				</div>
				<div class="leftofmyinformation">
					<div class="leftdivtopname">
						<font style="margin-left: 20px;">店铺资料</font>
					</div>
					<div class="leftdivcontent">
						<ul>
							<li><a href="./goEditInfo.do" target="houseright">修改基本资料</a></li>
							<li><a href="./goEditLogo.do" target="houseright">上传店铺头像</a></li>
							<li><a href="./goEditPass.do" target="houseright">修改登录密码</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="bodycenter">
				<iframe src="/BookHouse/house/goHome.do" name="houseright" marginheight="0" marginwidth="0"
					width="810px" height="540px" scrolling="No" frameborder="0"
					noresize="noresize" id="houseright" title="houseright"></iframe>
			</div>
		</div>
		<div class="mainbottom"></div>
	</div>
</body>
</html>