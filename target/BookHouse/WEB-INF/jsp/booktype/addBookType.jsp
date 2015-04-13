<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>
</head>
<body>
	添加图书类别
	<hr>
	<form action="./addBookType.do" method="post">
	类别名称:<input name="type_name" type="text" /><br/>
	<br/>父类别:<input  name="type_father_id" type="text"  /><br/>
	<br/><input type="submit" value="添加图书类别"/>
	</form>
</body>
</html>