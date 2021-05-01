<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<style type="text/css">
html,
body {
	margin: 0;
	padding: 0;
}

#model {
	background: 
	float: left;
	background-repeat: none;
	background-position: center;
}

#top{
	position: absolute;
	top: 75px;
	left: 61px;
}

#bottom{
	position: absolute;
	top: 160px;
	left: 60px;
}

#shoes{

}

#clothes{
	float: left;
}

.draggable {
	cursor: pointer;
}
</style>
</head>
<body>
<div class="content">
<form action="/avatar/modify" method="post" style="border: dotted; float: left;">
	<div>
		<img alt="image" src="/upload/2021/5/1/model.png">
	</div>
</form>
<c:forEach var="top" items="${requestScope.tops}" varStatus="imageStatus">
	<img class="clothes draggable" src="/upload/${top.savePath}${top.renameFileName}" alt="Image">
</c:forEach>
<br>
<c:forEach var="bottom" items="${requestScope.bottoms}" varStatus="imageStatus">
	<img class="clothes draggable" src="/upload/${bottom.savePath}${bottom.renameFileName}" alt="Image">
</c:forEach>
<br>
<c:forEach var="shoe" items="${requestScope.shoes}" varStatus="imageStatus">
	<img class="clothes draggable" src="/upload/${shoe.savePath}${shoe.renameFileName}" alt="Image">
</c:forEach>

</div>
<script type="text/javascript">
document.onmousedown = function(e) {

	var dragElement = e.target;

	if (!dragElement.classList.contains('draggable')) return;

	var coords, shiftX, shiftY;

	startDrag(e.clientX, e.clientY);

	document.onmousemove = function(e) {
		moveAt(e.clientX, e.clientY);
	};

	dragElement.onmouseup = function() {
		finishDrag();
	};

	function startDrag(clientX, clientY) {

		shiftX = clientX - dragElement.getBoundingClientRect().left;
		shiftY = clientY - dragElement.getBoundingClientRect().top;

		dragElement.style.position = 'fixed';

		document.body.appendChild(dragElement);

		moveAt(clientX, clientY);
	};

	function finishDrag() {

		dragElement.style.top = parseInt(dragElement.style.top) + pageYOffset + 'px';
		dragElement.style.position = 'absolute';

		document.onmousemove = null;
		dragElement.onmouseup = null;
	}

	function moveAt(clientX, clientY) {

		var newX = clientX - shiftX;
		var newY = clientY - shiftY;

		var newBottom = newY + dragElement.offsetHeight;

		if (newBottom > document.documentElement.clientHeight) {
	
			var docBottom = document.documentElement.getBoundingClientRect().bottom;
	
			var scrollY = Math.min(docBottom - newBottom, 10);
	
			if (scrollY < 0) scrollY = 0;
	
			window.scrollBy(0, scrollY);
	
			newY = Math.min(newY, document.documentElement.clientHeight - dragElement.offsetHeight);
		}

		if (newY < 0) {

			var scrollY = Math.min(-newY, 10);
			
			if (scrollY < 0) scrollY = 0;
			
			window.scrollBy(0, -scrollY);
			newY = Math.max(newY, 0);
		
		}

		if (newX < 0) newX = 0;
		if (newX > document.documentElement.clientWidth - dragElement.offsetWidth) {
			newX = document.documentElement.clientWidth - dragElement.offsetWidth;
		}

		dragElement.style.left = newX + 'px';
		dragElement.style.top = newY + 'px';
	}

	return false;
}
</script>
</body>
</html>
