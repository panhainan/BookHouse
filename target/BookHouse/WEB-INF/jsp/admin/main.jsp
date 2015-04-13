<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理</title>
<link href="../css/admin/main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="main" align="center">
		<div class="maintop">
			<div class="toptool"></div>
			<div class="toplogo"></div>
			<div class="topbar">欢迎管理员</div>
		</div>
		<div class="mainbody">
			<div class="bodyleft">
				<div class="leftofmybusiness">
					<div class="leftdivtopname">
						<font style="margin-left: 20px;">管理员信息</font>
					</div>
					<div class="leftdivcontent">
						<ul>
							<li><a href="./goEditInfo.do" target="adminright">基本资料</a></li>
							<li><a href="./goEditPass.do" target="adminright">修改密码</a></li>
						</ul>
					</div>
				</div>
				<div class="leftofmystock">
					<div class="leftdivtopname">
						<font style="margin-left: 20px;">用户信息管理</font>
					</div>
					<div class="leftdivcontent">
						<ul>
							<li><a href="./goAlladmin.do" target="adminright">店铺信息管理</a></li>
							<li><a href="./goAllUser.do" target="adminright">个人信息管理</a></li>
						</ul>
					</div>
				</div>
				<div class="leftofmyinformation">
					<div class="leftdivtopname">
						<font style="margin-left: 20px;">图书类型管理</font>
					</div>
					<div class="leftdivcontent">
						<ul>
							<li><a href="/BookHouse/booktype/goAllBookType.do" target="adminright">图书类型信息</a></li>
							<li><a href="/BookHouse/booktype/goAddBookType.do" target="adminright">添加图书类型</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="bodycenter">
				<iframe src="/BookHouse/admin/goHome.do" name="adminright"
					width="810px" height="540px" scrolling="No" frameborder="0"
					noresize="noresize" id="adminright" title="adminright"></iframe>
			</div>
		</div>
		<div class="mainbottom"></div>
	</div>
</body>
</html>