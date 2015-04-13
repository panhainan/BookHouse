<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>My JSP 'uploadBookImg.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<form action="/BookHouse/book/upBookImg.htm" enctype="multipart/form-data" method="post"  style="text-align: left;font-size: 14px;font-family: Microsoft Yahei;">
		上传图书展示图片：<input  style="font-size: 14px;height: 22px;width: 200px;" id="f_file" type="text"> 
		<input value="选择"   onclick="fu.click()" type="button">
		<input name="imgFile" id="fu" onchange="f_file.value=this.value" style="display:none" type="file"> 
		<input type="submit" value="确定上传" />
	</form>
	<table class="" cellpadding="0" cellspacing="0"
			style="width: 810px;border: 4px solid #DDD;margin-top: 8px">
			<thead
				style="background-color: #F7F7F7;width: 100%;font-size: 14px;font-family: Microsoft Yahei;font-weight:bold;color: #009379;">
				<tr height="40px">
					<th width="80px">图书名称</th>
					<th width="80px">图书作者</th>
					<th width="80px">ISBN</th>
					<th width="40px">单价</th>
					<th width="40px">数量</th>
					<th width="80px">类别</th>
					<th width="80px">出版社</th>
					<th width="60px">出版时间</th>
					<!-- <th width="80px">作者介绍</th>
					<th width="80px">图书目录</th>
					<th width="80px">内容简介</th> -->
				</tr>
			</thead>
			<tbody style="text-align: center;font-size: 14px;font-family: Microsoft Yahei;">
					<tr height="60px;">
						<td style="border-top: 2px solid #DDD;">${currentBook.book_name}</td>
						<td style="border-top: 2px solid #DDD;">${currentBook.book_author}</td>
						<td style="border-top: 2px solid #DDD;">${currentBook.book_isbn}</td>
						<td style="border-top: 2px solid #DDD;">${currentBook.book_price}</td>
						<td style="border-top: 2px solid #DDD;">${currentBook.book_sum}</td>
						<td style="border-top: 2px solid #DDD;">${currentBook.book_type}</td>
						<td style="border-top: 2px solid #DDD;">${currentBook.book_publish_company}</td>
						<td style="border-top: 2px solid #DDD;">${currentBook.book_publish_datetime}</td>
						<%-- <td>${currentBook.book_author_introduce}</td>
						<td>${currentBook.book_catalogue}</td>
						<td>${currentBook.book_content_introduce}</td> --%>
					</tr>
			</tbody>
		</table>
	
</body>
</html>
