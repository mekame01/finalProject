<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.category{
		border: none;
		margin: 0;
		border-width: 5px;
	}
	
	.oneImage{
		display: inline-block;
		vertical-align: middle;
		text-align: center;
		width: 20vw;
	}
	
	.image{
		width: 20vw;
	}
	
	.del{
		width: 30%;
	}
</style>
</head>
<body>
<div class="clothes">
	<c:forEach var="category" items="${requestScope.categories}" varStatus="status">
		<form action="/clothes/clothes" method="post" enctype="multipart/form-data">
			<h2>${category}</h2>
			<div class="category">
				<c:forEach var="clothes" items="${requestScope.clothes}" varStatus="imageStatus">
					<c:if test="${status.count eq clothes.clothesCode}">
						<div class="oneImage">
							<img class="image" src="/upload/${requestScope.files[imageStatus.index].savePath}${requestScope.files[imageStatus.index].renameFileName}" alt="Image">
							<button class="del" type="button" onclick="addFileParameter(${clothes.clothesIdx}, this)">삭제</button>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<br>
			<input type="file" name="files" multiple/>
			<input type="hidden" name="division" value="${status.count}">
			<button type="submit">전송</button>
		</form>
	</c:forEach>
</div>
<script type="text/javascript">
let addFileParameter = (flIdx,e) =>{
	console.dir(flIdx);
	document.querySelectorAll('form').forEach((aform)=>{
		
		let hiddenTag = document.createElement('input');	
		hiddenTag.type='hidden';
		hiddenTag.name = 'delFiles';
		hiddenTag.value= flIdx;
		
		aform.append(hiddenTag);
	});
	e.parentNode.style.display = 'none';
}
</script>
</body>
</html>