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
	function whenFatherTypeChange() {
		$("#selectType").empty();//清空列表
		$("#selectType").css("display", "none");
		var selectFatherType = $("#selectFatherType").find("option:selected")
		.attr("class");
		//console.log("selectFatherType:"+selectFatherType);
		if(null==selectFatherType||""==selectFatherType||0==selectFatherType){}
		else{
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
					$("#selectType").append("<option style='height: 22px;line-height: 22px;'></option>");
					for (var i = 0; i < data.listType.length; i++) {
						typeStr = data.listType[i];
						$("#selectType").append(
								"<option style='height: 22px;line-height: 22px;' value='"+ typeStr.type_id + "' >"
										+ typeStr.type_name + "</option>");//向清空的列表中增加新值
					}
				}
			});
		}
	};
	function typeValue(){
		var type1 =  $("#selectFatherType").find("option:selected").val();
		var type2 =  $("#selectType").find("option:selected").val();
		var typeFatherId;
		if(0==type1||null==type1||""==type1){
			typeFatherId = -1;
			console.log("error,empty!");
		}else if(0==type2||null==type2||""==type2){
			typeFatherId = type1;
		}else{
			typeFatherId = type2;
		}
		//console.log("typeFatherId:"+typeFatherId);
		$("#typeFatherId").val(typeFatherId);
		console.log("$('#typeFatherId').val():"+$("#typeFatherId").val());
		return true;
		
	}
</script>
</head>
<body>
	添加图书类别
	<hr>
	<form action="./addBookType.htm" method="post" onsubmit="return typeValue();"  style="color: #009379;font-size: 14px;font-family: Microsoft Yahei;">
		类别名称&nbsp;:&nbsp;<input name="type_name" type="text" /><br /> <br />
	<div>
		<div style="float: left;">父&nbsp;&nbsp;类&nbsp;&nbsp;别&nbsp;:&nbsp;</div>
		<div style="float: left;">
			<select name="type1" id="selectFatherType" style="width: 100px;height: 22px;line-height: 22px;float: left;"
			onchange="whenFatherTypeChange();">
				<option style='height: 22px;line-height: 22px;'></option>
				<c:forEach items="${listftype}" var="ftype">
					<option style="height: 22px;line-height: 22px;"
						value="${ftype.type_id}"
						class="${ftype.type_id}">${ftype.type_name}</option>
				</c:forEach>
			</select>
			<select style="display: none;width: 100px;height: 22px;line-height: 22px;" id="selectType"
				name="type2">
			</select>
		</div>
	</div>
	<input type="hidden" name="type_father_id" id="typeFatherId" />
	<br /> <br />
		<input type="submit" value="添加图书类别" />
	</form>
	
</body>
</html>