<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
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
<script type="text/javascript" src="../js/jquery-1.11.0.js"></script>
<script type="text/javascript">
	function whenFatherTypeChange() {
		$("#selectType").empty();//清空列表
		$("#selectSonType").empty();//清空列表
		$("#selectType").css("display", "none");
		$("#selectSonType").css("display", "none");
		var selectFatherType = $("#selectFatherType").find("option:selected")
				.attr("class");
		//console.log(selectFatherType);
		$.ajax({
			type : "post",
			url : "/BookHouse/booktype/findType.htm?typefatherid="
					+ selectFatherType,
			dataType : "json",
			success : function(data) {
				//console.log("date:" + data);
				//console.log("listType:" + data.listType);
				var typeStr = "";
				$("#selectType").css("display", "block"),
				$("#selectType").css("float", "left"), 
				$("#selectType").append("<option style='height: 22px;line-height: 22px;' value=' '></option>");
				for (var i = 0; i < data.listType.length; i++) {
					typeStr = data.listType[i];
					$("#selectType").append(
							"<option style='height: 22px;line-height: 22px;' value=' / <a target=\"_top\" href=\"/BookHouse/book/findBookByType.htm?booktype="
									+ typeStr.type_name + "\">"
									+ typeStr.type_name + "</a>'  class='"
									+ typeStr.type_id + "'  >"
									+ typeStr.type_name + "</option>");//向清空的列表中增加新值
				}
			}
		});
	};
	function whenSonFatherTypeChange() {
		$("#selectSonType").empty();//清空列表
		var selectSonFatherType = $("#selectType").find("option:selected")
				.attr("class");
		$.ajax({
			type : "post",
			url : "/BookHouse/booktype/findType.htm?typefatherid="
					+ selectSonFatherType,
			dataType : "json",
			success : function(data) {
				var typeStr = "";
				$("#selectSonType").css("display", "block"),
				$("#selectSonType").css("float", "left"), 
				$("#selectSonType").append("<option style='height: 22px;line-height: 22px;' value=' ' ></option>");
				for (var i = 0; i < data.listType.length; i++) {
					typeStr = data.listType[i];
					$("#selectSonType").append(
							"<option style='height: 22px;line-height: 22px;' value=' / <a  target=\"_top\" href=\"/BookHouse/book/findBookByType.htm?booktype="
									+ typeStr.type_name + "\">"
									+ typeStr.type_name + "</a>'>"
									+ typeStr.type_name + "</option>");//向清空的列表中增加新值
				}
			}
		});
	}
</script>
</head>
<body>
	添加图书商品
	<hr>
	<div align="center">
		<form action="./addBook.htm" method="post">
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
					<td><input name="book_sum" type="text" /></td>
				</tr>
				<tr>
					<td>图书价格:</td>
					<td><input name="book_price" type="text" /></td>
				</tr>
				<tr>
					<td>图书类别:</td>
					<td><select name="book_type1" id="selectFatherType"
						style="width: 100px;height: 22px;line-height: 22px;float: left" onchange="whenFatherTypeChange();">
							<option style="height: 22px;line-height: 22px;"></option>
							<c:forEach items="${listftype}" var="ftype">
								<option style="height: 22px;line-height: 22px;"
									value="<a  target='_top' href='/BookHouse/book/findBookByType.htm?booktype=${ftype.type_name}'>${ftype.type_name}</a>"
									class="${ftype.type_id}">${ftype.type_name}</option>
							</c:forEach>
					</select> <select style="width: 100px;height: 22px;line-height: 22px;display: none;float: left" id="selectType"
						name="book_type2" onchange="whenSonFatherTypeChange();">
					</select><select style="width: 100px;height: 22px;line-height: 22px;display: none;float: left" id="selectSonType"
						name="book_type3">
					</select></td>
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
			<input type="submit" value="添加图书" />
		</form>
	</div>
</body>
</html>