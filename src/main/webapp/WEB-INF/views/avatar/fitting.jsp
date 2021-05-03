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

.draggable {
	cursor: pointer;
}
</style>
</head>
<body>
<div class="content">
<form action="/avatar/modify" method="post" style="border: solid; float: left;">
	<input type="hidden" id="avatarIdx" name="avatarIdx" value="${requestScope.avatarIdx}">
	<input type="hidden" id="userId" name="userId" value="${sessionScope.userInfo.userId}">
	<input type="hidden" id="avatar" name="avatar">
	<input type="hidden" id="top" name="top">
	<input type="hidden" id="topX" name="topX">
	<input type="hidden" id="topY" name="topY">
	<input type="hidden" id="bottom" name="bottom">
	<input type="hidden" id="bottomX" name="bottomX">
	<input type="hidden" id="bottomY" name="bottomY">
	<input type="hidden" id="shoes" name="shoes">
	<input type="hidden" id="shoesX" name="shoesX">
	<input type="hidden" id="shoesY" name="shoesY">
	<button type="submit">저장</button>
	<button type="button" id="delete" onclick="deleteImage()">지우기</button>
	<div>
		<img id="avatar" alt="image" src="/upload/2021/5/1/model.png">
	</div>
</form>
<c:forEach var="top" items="${requestScope.tops}" varStatus="imageStatus">
	<img class="top draggable" style="width: 200px;" data-idx="${requestScope.topIdxList[imageStatus.index]}"
	src="/upload/${top.savePath}${top.renameFileName}" alt="Image">
</c:forEach>
<br>
<c:forEach var="bottom" items="${requestScope.bottoms}" varStatus="imageStatus">
	<img class="bottom draggable" style="width: 200px;" data-idx="${requestScope.bottomIdxList[imageStatus.index]}"
	src="/upload/${bottom.savePath}${bottom.renameFileName}" alt="Image">
</c:forEach>
<br>
<c:forEach var="shoe" items="${requestScope.shoes}" varStatus="imageStatus">
	<img class="shoes draggable" style="width: 120px;" data-idx="${requestScope.shoesIdxList[imageStatus.index]}"
	src="/upload/${shoe.savePath}${shoe.renameFileName}" alt="Image">
</c:forEach>

</div>
<script type="text/javascript">
let lastClick;
let deleteImage = () => {
	//console.dir(lastClick);
	if(confirm('이 옷을 삭제하시겠습니까?')) {
		lastClick.remove();
	}
}

document.onkeydown = (e) => {
	if(e.keyCode == '46'){
		deleteImage();
	}
}

document.onsubmit = (e) => {
	let clothesList = ['top','bottom','shoes'];
	let clothesName = ['상의','하의','신발'];
	let cnt = [0,0,0];
	
	let avatarRect = document.querySelector('#avatar').getBoundingClientRect();
	document.querySelectorAll('.draggable').forEach((e)=>{
		for(let i = 0; i < clothesList.length; i++){
			if(e.classList.contains(clothesList[i])){
				let temp = e.getBoundingClientRect();
				if(temp.left >= avatarRect.left && temp.right <= avatarRect.right &&
						temp.top >= avatarRect.top && temp.bottom <= avatarRect.bottom) {
					cnt[i]++;
					console.dir(e);
					document.querySelector('#'+clothesList[i]).value = e.dataset.idx;
					document.querySelector('#'+clothesList[i]+'X').value = temp.left;
					document.querySelector('#'+clothesList[i]+'Y').value = temp.top;
				}
			}
		}
	});
	for(let i = 0; i < clothesList.length; i++){
		if(cnt[i] > 1){
			alert(clothesName[i]+'가 2개 이상 있습니다.');
			console.dir(clothesName[i]+'가 2개 이상 있습니다.');
			e.preventDefault();
		}
	}
	
	console.dir(cnt[0]);
	console.dir(cnt[1]);
	console.dir(cnt[2]);
	e.preventDefault();
}


document.onmousedown = function(e) {

	var dragElement = e.target;

	if (dragElement.classList.contains('draggable')){
		lastClick = e.target;
	} else {
		return;
	}

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
