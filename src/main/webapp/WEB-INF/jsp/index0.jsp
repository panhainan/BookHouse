<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网上书城</title>
<link href="./css/foreground/index.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/BookHouse/js/jquery-1.11.0.js"></script>
<style type="text/css">
#sidebar-menu {
	/*目前要求宽度是238px,高度是332px，左边框+width正好238，以后需要可以修改*/
	border-left: 1px solid #D0D0D0;
	width: 100%;
	/* height : 332px; */
	margin: 0;
	padding: 0;
}

#sidebar-menu>ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

#sidebar-menu>ul>li {
	list-style: none;
	padding: 0;
	margin: 0;
	border-bottom: 1px solid #FDEADB;
	position: relative;
}

#sidebar-menu>ul>li.selected {
	/* background: #FFF; */
	border-top: 1px solid #D0D0D0;
	border-bottom: 1px solid #D0D0D0;
}

#sidebar-menu>ul>li.first {
	border-top: 1px solid #D0D0D0;
}

#sidebar-menu>ul>li.last {
	border-bottom: 1px solid #D0D0D0;
}

#sidebar-menu .menu-item {
	/* background: #FFF7F0 no-repeat left center; */
	height: 32px; /**控制菜单中每行的宽度，下面还有两处需要修改**/
	border-right: 1px solid #D0D0D0;
	z-index: 10000;
	position: relative;
}

#sidebar-menu>ul>li.selected .menu-item {
	border-right: 1px solid #FFF;
	/* background: #FFF no-repeat left center; */
}

#sidebar-menu .menu-item span {
	font-size: 13px;
	font-weight: bold;
	height: 32px;
	line-height: 32px;
	padding-left: 35px;
	padding-top: 2px;
	display: inline-block;
}

#sidebar-menu .menu-panel {
	/* padding: 10px 20px; */
	display: none;
	border: 1px solid #D0D0D0;
	width: 560px;
	float:left;
	position: absolute;
	left: 170px;
	top: -1px;
	z-index: 5000;
	min-height: 50px;
	box-shadow: 1px 1px 4px #D0D0D0;
}

#sidebar-menu div.menu-panel.selected {
	display: block;
}

/*Panel 里面的链接列表*/
#sidebar-menu div.menu-panel ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

#sidebar-menu div.menu-panel ul li {
	list-style: none;
	padding: 5px 0px;
	margin: 0;
}

#sidebar-menu div.menu-panel>ul>li>h2 {
	margin: 0;
	padding: 0;
	padding-top: 2px;
	font-size: 13px;
	color: red;
	float: left;
	width: 100px;
}

#sidebar-menu div.menu-panel>ul>li>div.link-list {
	float: left;
	padding-left: 10px;
	width: 450px;
}

#sidebar-menu div.menu-panel div.link-wrapper {
	display: inline-block;
	padding: 3px 0px;
}

#sidebar-menu div.menu-panel div.link-wrapper span {
	font-size: 13px;
	color: #888;
	padding-right: 4px;
}

#sidebar-menu div.menu-panel div.link-list a {
	font-size: 13px;
	color: #888;
	text-decoration: none;
}

#sidebar-menu div.menu-panel div.link-list a:hover {
	text-decoration: underline;
}

#sidebar-menu div.clear {
	clear: both;
	height: 0;
	line-height: 0;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#sidebar-menu > ul > li").hover(function() {
			var typeid = $(this).attr('class');
			$(this).addClass("selected");
			$(".menu-panel", this).addClass("selected");
			//console.log(typeid);
			whenTypeClick(typeid);
		}, function() {
			$(this).removeClass("selected");
			$(".menu-panel", this).removeClass("selected");
		});
	});
	function whenTypeClick(typeid) {
		//console.log(typefatherid);
		$(".menu-panel").empty();
		$
				.ajax({
					type : "post",
					url : "/BookHouse/booktype/findType.htm?typefatherid="
							+ typeid,
					dataType : "json",
					success : function(data) {
						var typeStr = "";
						$(".menu-panel").empty();
						$(".menu-panel")
								.append(
										"<ul style='list-style: none;padding: 0;margin: 0;'>");
						for (var i = 0; i < data.listType.length; i++) {
							typeStr = data.listType[i];
							$(".menu-panel")
									.append(
											"<li><h2 style='margin: 0;padding: 0;padding-top: 2px;font-size: 13px;color: red;float: left;width: 100px;'><a href='/BookHouse/book/findBookByType.htm?booktype="+typeStr.type_name+"'>"
													+ typeStr.type_name
													+ "</a></h2><div class='link-list"+typeStr.type_id+"' style='float: left;padding-left: 10px;width: 400px;'>");//向清空的列表中增加新值
							whenTypeLoad(typeStr.type_id);

							$(".menu-panel").append(
									"</div><div class='clear'></div></li>");
						}
						$(".menu-panel").append("</ul>");
					}
				});

	}
	function whenTypeLoad(typeloadid) {
		$
				.ajax({
					type : "post",
					url : "/BookHouse/booktype/findType.htm?typefatherid="
							+ typeloadid,
					dataType : "json",
					success : function(sondata) {
						var sontypeStr = "";
						for (var i = 0; i < sondata.listType.length; i++) {
							//console.log(sondata.listType + "---"+ sondata.listType.length)
							sontypeStr = sondata.listType[i];
							$(".link-list" + typeloadid).append(
									"<div class='link-wrapper'><span >|</span><a href='/BookHouse/book/findBookByType.htm?booktype="+ sontypeStr.type_name+"'>"
											+ sontypeStr.type_name
											+ "</a></div>");//向清空的列表中增加新值
						}
					}
				});
	}
</script>
<!--[if IE 7]-->
<style type="text/css">
#sidebar-menu div.menu-panel div.link-wrapper {
	display: inline;
	zoom: 1;
}
</style>
<!--  [endif]-->
</head>
<body>
	<div class="main" align="center">
		<jsp:include page="top.jsp"></jsp:include>
		<div class="mainbody">
			<div class="bodyleft">
				<div class="leftofmybusiness">
					<div class="leftdivtopname">
						<font style="margin-left: 20px;">图书类别</font>
					</div>
					<div id="sidebar-menu" class="leftdivcontent"
						style="z-index:100;float:left;">
						<ul>
							<c:forEach items="${listftype}" var="type">
								<li class="${type.type_id}">
									<div class="menu-item">
										<span style="cursor: pointer;"><a href='/BookHouse/book/findBookByType.htm?booktype=${type.type_name}'>${type.type_name}</a></span>
									</div>
									<div class="menu-panel" style="background-color: white">
									</div>
								</li>
							</c:forEach>
						</ul>

					</div>
				</div>
			</div>
			<div class="bodycenter">
				<iframe src="/BookHouse/book/goAllBook.htm?updown=up"
					name="indexright" marginheight="0" marginwidth="0" width="810px"
					height="700px" scrolling="No" frameborder="0" noresize="noresize"
					id="indexright" title="indexright"></iframe>
			</div>
		</div>
<div class="mainbottom" style="float: left;color: black;font-size: 13px;font-family: Microsoft Yahei;">Copyright@梦之站 | 湖南省长沙市(雨花区)万家丽南路2段960号 电话：0731-2309047 邮箱：dreamstationx.@sina.com </div>
	</div>
</body>
</html>