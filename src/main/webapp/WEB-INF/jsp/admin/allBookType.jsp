<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>
<script type="text/javascript" src="../js/jquery-1.11.0.js"></script>
<script type="text/javascript">
		function whenFatherTypeClick(typefatherid) {
			$("#sonType").empty();//清空列表
			$("#sonType").css("display", "none");
			$("#sonSonType").empty();//清空列表
			$("#sonSonType").css("display", "none");
			//console.log(typefatherid);
			$.ajax({
				type : "post",
				url : "/BookHouse/booktype/findType.htm?typefatherid="
						+ typefatherid,
				dataType : "json",
				success : function(data) {
					var typeStr = "";
					$("#sonType").css("display", "block"), 
					$("#sonType").css("float", "left"),
					$("#sonType").append("<tr style='background-color: #F7F7F7;color: #009379;font-weight:bold;' height='30px;'><td style='width:140px;'>图书子类别</td><td  style='width:60px;'></td></tr>");
					if(data.listType.length==0){
						$("#sonType").append("<tr height='40px;'><td style='width:140px;border-top: 1px solid #DDD;'>无</td><td  style='width:60px;border-top: 1px solid #DDD;'></td></tr>");
					}else{
						for (var i = 0; i < data.listType.length; i++) {
							typeStr = data.listType[i];
							$("#sonType").append(
									"<tr style='height: 40px;'><td style='border-top: 1px solid #DDD;' >"
									+"<font style='cursor: pointer;' onclick='whenSonTypeClick("+typeStr.type_id+")'>"
									+ typeStr.type_name + "</font></td>"
									+"<td  style='border-top: 1px solid #DDD;'><a style=\"color:red;cursor: pointer;\" onclick=\"editType("+typeStr.type_id+")\">修改</a></td></tr>");//向清空的列表中增加新值
						}
					}
				}
			});
		}
		function whenSonTypeClick(typefatherid) {
			//console.log("it was clicked");
			$("#sonSonType").empty();//清空列表
			$("#sonSonType").css("display", "none");
			//console.log(typefatherid);
			$.ajax({
				type : "post",
				url : "/BookHouse/booktype/findType.htm?typefatherid="
						+ typefatherid,
				dataType : "json",
				success : function(data) {
					var typeStr = "";
					$("#sonSonType").css("display", "block"), 
					$("#sonSonType").css("float", "left"),
					$("#sonSonType").append("<tr style='background-color: #F7F7F7;color: #009379;font-weight:bold;' height='30px;'><td style='width:140px;'>图书孙子类别</td><td  style='width:60px;'></td></tr>");
					if(data.listType.length==0){
						$("#sonSonType").append("<tr height='40px;'><td style='width:140px;border-top: 1px solid #DDD;'>无</td><td  style='width:60px;border-top: 1px solid #DDD;'></td></tr>");
					}else{
						for (var i = 0; i < data.listType.length; i++) {
							typeStr = data.listType[i];
							$("#sonSonType").append(
									"<tr style='height: 40px;'><td style='border-top: 1px solid #DDD;' >"
									+ typeStr.type_name + "</td>"
									+"<td  style='border-top: 1px solid #DDD;'><a style=\"color:red;cursor: pointer;\" onclick=\"editType("+typeStr.type_id+")\">修改</a></td></tr>");//向清空的列表中增加新值
						}
					}
				}
			});
		}
		function editType(typeid){
			$.ajax({
				type : "post",
				url : "/BookHouse/booktype/goEditType.htm?typeid="
						+ typeid,
				dataType : "json",
				success : function(data) {
					//console.log(data.type);
					$("#editDiv").css("display", "block"), 
					$("#editDiv").css("float", "left");
					$(".edittypeid").val(data.type.type_id);
					$(".edittypename").val(data.type.type_name);
				}
			});
		}
</script>
</head>
<body>
<div style="min-height: 200px;">
	<table  cellpadding="0" cellspacing="0" style="text-align:center;border: 1px solid #DDD;width: 200px;height: 30px;font-size: 14px;font-family: Microsoft Yahei;float: left;">
		<tr style="background-color: #F7F7F7;color: #009379;font-weight:bold;" height="30px;">
				<td>图书父类别</td>
				<td></td>
			</tr>
		<c:forEach items="${listftype}" var="ftype">
			<tr  height="40px;">
				<td  style="border-top: 1px solid #DDD;"><font style="cursor: pointer;" onclick="whenFatherTypeClick(${ftype.type_id})">${ftype.type_name}</font></td>
				<td  style="border-top: 1px solid #DDD;"><a style="color:red;cursor: pointer;" onclick="editType(${ftype.type_id})">修改</a></td>
			</tr>
		</c:forEach>
	</table>
	<table  cellpadding="0" cellspacing="0" id="sonType" style="display:none;text-align:center;border: 1px solid #DDD;width: 200px;font-size: 14px;font-family: Microsoft Yahei;float: left;">
	</table>
	<table  cellpadding="0" cellspacing="0" id="sonSonType" style="display:none;text-align:center;border: 1px solid #DDD;width: 200px;font-size: 14px;font-family: Microsoft Yahei;float: left;">
	</table>
</div>
<div id="editDiv" style="display:none;text-align:center;border: 1px solid #DDD;width: 400px;font-size: 14px;font-family: Microsoft Yahei;float: left;">
<form id='editForm' enctype='multipart/form-data' action='/BookHouse/booktype/editType.htm' method='post'>
	<br/><font style='color: #009379;font-weight:bold;'>修改图书类别</font>
			<input type='hidden' class="edittypeid" value='' name='type_id'>
			<br/><br/>类别名：<input  class="edittypename" type='text' value='' name='type_name'><br/><br/>
			<input type='submit'  value='确认修改'><br/><br/>
</form>
</div>
</body>
</html>