<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/BookHouse/css/user/main.css" rel="stylesheet"
	type="text/css">
<style type="text/css">
.maintop {
	width: 100%;
	min-width: 1004px;
	height: 200px;
	text-align: center;
	height: 200px;
}

.mainbody {
	margin-top: 10px;
	width: 1004px;
	min-height: 660px;
	width: 1004px;
}

.toptool {
	width: 100%;
	height: 39px;
	border-bottom: 1px solid #D0D0D0;
	background-color: #F9F9F9;
	float: left;
	line-height: 39px;
	font-family: 微软雅黑;
}

.toplogo {
	width: 100%;
	height: 120px;
	background-color: #FFFFFF;
	float: left;
}

.topbar {
	width: 100%;
	height: 40px;
	float: left;
	background-color: #FF2832;
	font: bold 20px/40px "Microsoft Yahei";
	color: white;
	line-height: 40px;
}
</style>
<div class="maintop" align="center">
	<div class="toptool">
		<div style="width: 50%;height: 100%;float: left;">
			欢迎来到<a href="/BookHouse/" style="color: #009379;" target="_top">网上书城</a>
		</div>
		<div style="width: 50%;min-width:500px;height: 100%;float: left;">
			<div style="width: 300px;height: 100%;float: left;">
				<c:choose>
					<c:when test="${loginHouse!=null}">
						Hi,<a style="color: #009379;font-weight: bolder;"
							href="/BookHouse/house/main.htm">${loginHouse.hous_name}</a> [ <a
							href="/BookHouse/house/logout.htm" style="color: red;"
							target="_top">安全退出</a> ]
					</c:when>
					<c:when test="${loginUser!=null}">
						Hi,<a style="color: #009379;font-weight: bolder;"
							href="/BookHouse/user/main.htm">${loginUser.user_nick_name}</a> [ <a
							href="/BookHouse/user/logout.htm" style="color: red;"
							target="_top">安全退出</a> ]
					</c:when>
					<c:otherwise>
						<a href="/BookHouse/goLogin.htm" style="color: #009379;"
							target="_top">登录</a> | <a href="/BookHouse/goRegist.htm"
							style="color: #009379;" target="_top">注册</a>
					</c:otherwise>
				</c:choose>
			</div>
			<div style="width: 100px;height: 100%;float: left;">
				<c:if test="${loginUser!=null}">
					<a href="/BookHouse/order/goAllOrderByIndex.htm?assertStatus=0"
						target="_top">我的购物车</a>
				</c:if>
			</div>
		</div>
	</div>
	<div class="toplogo">
		<div style="float: left;width: 170px;height: 100%"></div>
		<div style="float: left;width:180px;">
			<img src="/BookHouse/images/book.jpg"
				style="width:180px;;height: 120px;" />
		</div>
		<div
			style="width: 800px;float: left;height: 40px;line-height: 40px;margin-top: 30px;"
			align="center">
			<form action="/BookHouse/book/findBookByName.htm" method="post">
				<input type="text" name="book_name" id="book_name" 
					style="width: 300px;height: 30px;line-height: 30px;font-size: 14px;" />
				<input type="submit" name="search" id="search" onchange="check()"
					style="width: 80px;height: 36px;font-size: 14px;" value="搜索" />
			</form>
		</div>
	</div>
	<div class="topbar">欢迎来到网上书城</div>
</div>
