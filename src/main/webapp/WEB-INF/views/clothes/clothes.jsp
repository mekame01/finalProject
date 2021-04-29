<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.images{
		display: flex;
	}
	img{
		width: 20vw;
	}
</style>
</head>
<body>
<div class="clothes">
	<c:forEach var="category" items="${requestScope.categories}" varStatus="status">
		<div class="images">
			<form action="/clothes/clothes" method="post" enctype="multipart/form-data">
				<h2>${category}</h2>
				<c:forEach var="clothes" items="${requestScope.clothes}" varStatus="imageStatus">
					<c:if test="${status.count eq clothes.clothesCode}">
						<img src="/upload/${requestScope.files[imageStatus.index].savePath}${requestScope.files[imageStatus.index].renameFileName}" alt="Image">
					</c:if>
				</c:forEach>
				<br>
				<input type="file" name="files" multiple/>
				<input type="hidden" name="division" value="${status.count}">
				<button type="submit">전송</button>
			</form>
		</div>
	</c:forEach>
</div>
</body>
</html>