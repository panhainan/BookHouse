<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>
</head>
<body>
	<a target="_blank"
		href="http://a.dangdang.com/tjump.php?q=asnW8VJmbaYBw4SL9HN%2Flx8DtUrZjsDm3pDNIuEmzYFoa%2Ba2%2BnYSGhbP0WYciTgpd4opTBInhLhizMbz6824mm38Q%3D%3D">
		<img alt="" style="width:792px;height:40px;" src="../images/ad.jpg">
	</a>
	<table cellpadding="0" cellspacing="0"
		style="border: 1px solid #DDD;margin-top: 8px">
		<thead
			style="text-align:left;background-color: #F7F7F7;width: 100%;height: 30px;font-size: 14px;font-family: Microsoft Yahei;font-weight:bold;color: #009379;">
			<tr>
				<th width="100px">&nbsp;&nbsp;&nbsp;&nbsp;图书</th>
				<th width="200px">名称</th>
				<th width="160px">类别</th>
				<th width="60px">数量</th>
				<th width="80px">价格</th>
				<th width="90px">状态</th>
				<th width="100px">状态</th>
			</tr>
		</thead>
		<tbody style="font-family:宋体;font-size: 14px;color: #404040;">
			<%-- <c:forEach items="${listBook}" var="book">
				<tr style="height: 80px;">
					<td style="border-top: 1px solid #DDD;"><img alt="" style="width: 70px;height: 70px;" src="${book.book_picture}"></td>
					<td style="border-top: 1px solid #DDD;">${book.book_name}</td>
					<td style="border-top: 1px solid #DDD;">${book.book_type_id}</td>
					<td style="border-top: 1px solid #DDD;">${book.book_sum}</td>
					<td style="border-top: 1px solid #DDD;">${book.book_price}</td>
					<td style="border-top: 1px solid #DDD;">${book.book_status}</td>
					<td style="border-top: 1px solid #DDD;">下架/上架</td>
				</tr>
			</c:forEach> --%>
		</tbody>
	</table>
	<c:if test="${page!=null}">
            <table class="gridtable" style="width:100%;">
                <tr>
                    <th colspan="2">分页信息</th>
                </tr>
                <tr>
                    <th style="width: 300px;">当前页号</th>
                    <td>${page.pageNum}</td>
                </tr>
                <tr>
                    <th>页面大小</th>
                    <td>${page.pageSize}</td>
                </tr>
                <tr>
                    <th>起始行号(>)</th>
                    <td>${page.startRow}</td>
                </tr>
                <tr>
                    <th>终止行号(<=)</th>
                    <td>${page.endRow}</td>
                </tr>
                <tr>
                    <th>总结果数</th>
                    <td>${page.total}</td>
                </tr>
                <tr>
                    <th>总页数</th>
                    <td>${page.pages}</td>
                </tr>
            </table>
            <table class="gridtable" style="width:100%;">
                <thead>
                <tr>
                    <th colspan="3">查询结果</th>
                </tr>
                <tr>
                    <th>ID</th>
                    <th>国家名</th>
                    <th>国家代码</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${page.list}" var="book">
                    <tr>
                        <td>${book.book_id}</td>
                        <td>${book.book_name}</td>
                        <td>${book.book_price}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <table class="gridtable" style="width:100%;text-align: center;">
                <tr>
                    <c:if test="${page.hasPreviousPage}">
                        <td><a href="${pageContext.request.contextPath}/country?pageNum=${page.prePage}&pageSize=${page.pageSize}">前一页</a></td>
                    </c:if>
                    <c:forEach items="${page.navigatepageNums}" var="nav">
                        <c:if test="${nav == page.pageNum}">
                            <td style="font-weight: bold;">${nav}</td>
                        </c:if>
                        <c:if test="${nav != page.pageNum}">
                            <td><a href="${pageContext.request.contextPath}/country?pageNum=${nav}&pageSize=${page.pageSize}">${nav}</a></td></c:if>
                    </c:forEach>
                    <c:if test="${page.hasNextPage}">
                        <td><a href="${pageContext.request.contextPath}/country?pageNum=${page.nextPage}&pageSize=${page.pageSize}">下一页</a></td>
                    </c:if>
                </tr>
            </table>
        </c:if>

</body>
</html>