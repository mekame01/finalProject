<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="file" items="${requestScope.files}" varStatus="status">
	<img src="/upload/${file.savePath}${file.renameFileName}" alt="Image">
</c:forEach>
</body>
</html>