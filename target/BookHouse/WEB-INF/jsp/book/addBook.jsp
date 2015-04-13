<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>
<script language="javascript" type="text/javascript"
	src="../My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
input[type="text"] {
	width: 300px;
}
</style>
</head>
<body>
	添加图书商品
	<hr>
	<form action="./addBook.do" method="post">
		<table>
			<tr>
				<td>图书名称:</td>
				<td><input name="book_name" type="text" /></td>
			</tr>
			<tr>
				<td>I S B N&nbsp;:</td>
				<td><input name="book_isbn" type="text" /></td>
			</tr>
			<tr>
				<td>图书数量:</td>
				<td><input name="book_num" type="text" /></td>
			</tr>
			<tr>
				<td>图书价格:</td>
				<td><input name="book_price" type="text" /></td>
			</tr>
			<tr>
				<td>图书类别:</td>
				<td><input name="book_type_id" type="text" /></td>
			</tr>
			<tr>
				<td>图书作者:</td>
				<td><input name="book_author" type="text" /></td>
			</tr>
			<tr>
				<td>出&nbsp;版&nbsp;社:</td>
				<td><input name="book_publish_company" type="text" /></td>
			</tr>
			<tr>
				<td>出版日期:</td>
				<td><input id="d11" class="Wdate" type="text"
					name="book_publish_datetime" style=""
					onClick="WdatePicker({readOnly:true})" /></td>
			</tr>
			<tr>
				<td valign="top">作者简介:</td>
				<td><textarea name="book_author_introduce" rows="3" cols="50"
						style="resize:none;"></textarea></td>
			</tr>
			<tr>
				<td valign="top">图书目录:</td>
				<td><textarea name="book_catalogue" rows="3" cols="50"
						style="resize:none;"></textarea></td>
			</tr>
			<tr>
				<td valign="top">内容简介:</td>
				<td><textarea name="book_content_introduce" rows="3" cols="50"
						style="resize:none;"></textarea></td>
			</tr>
		</table>
		<!-- 图书名称:<input name="book_name" type="text" /><br/>
	<br/>I S B N&nbsp;:<input  name="book_isbn" type="text" /><br/>
	<br/>图书类别:<input  name="book_type_id" type="text"  /><br/>
	<br/>图书作者:<input name="book_author" type="text"  /><br/>
	<br/>出&nbsp;版&nbsp;社:<input  name="book_publish_company" type="text"  /><br/>
	<input  name="book_publish_datetime" type="text"  />
	<br/>出版日期:<input id="d11" class="Wdate" type="text" name="book_publish_datetime" 
			style="" onClick="WdatePicker({readOnly:true})" /><br/>
		<br />作者简介:<input name="book_author_introduce" type="text" /><br />
		<br />图书目录:<input name="book_catalogue" type="text" /><br /> <br />内容简介:<input
			name="book_content_introduce" type="text" /><br /> <br />图书价格:<input
			name="book_price" type="text" /><br /> <br /> -->
		<input type="submit" value="添加图书" />
	</form>
</body>
</html>