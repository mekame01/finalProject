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
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
</head>
<body>
<div class="content">
<form action="/avatar/modify" method="post" id="frm_save" style="border: solid; float: left;" enctype="multipart/form-data">
	<input type="hidden" id="modelFidx" name="modelFidx">
	<input type="hidden" id="top" name="top">
	<input type="hidden" id="topX" name="topX">
	<input type="hidden" id="topY" name="topY">
	<input type="hidden" id="bottom" name="bottom">
	<input type="hidden" id="bottomX" name="bottomX">
	<input type="hidden" id="bottomY" name="bottomY">
	<input type="hidden" id="shoes" name="shoes">
	<input type="hidden" id="shoesX" name="shoesX">
	<input type="hidden" id="shoesY" name="shoesY">
	<input type="hidden" id="files" name="files">
	<button type="button" onclick="save()">저장</button>
	<button type="button" id="delete" onclick="deleteImage()">지우기</button>
	<div id="capture">
		<img id="avatar" alt="image" src="/upload/2021/5/1/model.png">
	</div>
</form>
<c:forEach var="top" items="${requestScope.tops}" varStatus="imageStatus">
	<img class="clothes top draggable" style="width: 200px;" data-idx="${requestScope.topIdxList[imageStatus.index]}"
	src="/upload/${top.savePath}${top.renameFileName}" alt="Image">
</c:forEach>
<br>
<c:forEach var="bottom" items="${requestScope.bottoms}" varStatus="imageStatus">
	<img class="clothes bottom draggable" style="width: 200px;" data-idx="${requestScope.bottomIdxList[imageStatus.index]}"
	src="/upload/${bottom.savePath}${bottom.renameFileName}" alt="Image">
</c:forEach>
<br>
<c:forEach var="shoe" items="${requestScope.shoes}" varStatus="imageStatus">
	<img class="clothes shoes draggable" style="width: 120px;" data-idx="${requestScope.shoesIdxList[imageStatus.index]}"
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

let save = () => {
	
	let clothesList = ['top','bottom','shoes'];
	let clothesName = ['상의','하의','신발'];
	let cnt = [0,0,0];
	
	let avatarRect = document.querySelector('#avatar').getBoundingClientRect();
	
	document.querySelectorAll('.draggable').forEach((e)=>{
		for(let i = 0; i < clothesList.length; i++){
			/*
			console.dir(e);
			console.dir(clothesList[i]);
			console.dir(e.classList.contains(clothesList[i]));
			*/
			if(e.classList.contains(clothesList[i])){
				
				//console.dir(e);
				
				let temp = e.getBoundingClientRect();
				
				if(temp.left >= avatarRect.left && temp.right <= avatarRect.right &&
						temp.top >= avatarRect.top && temp.bottom <= avatarRect.bottom) {
					cnt[i]++;
					//console.dir(e);
					document.querySelector('#capture').appendChild(e);
					document.querySelector('#'+clothesList[i]).value = e.dataset.idx;
					document.querySelector('#'+clothesList[i]+'X').value = parseInt(temp.left);
					document.querySelector('#'+clothesList[i]+'Y').value = parseInt(temp.top);
				}
			}
		}
	});
	
	for(let i = 0; i < clothesList.length; i++){
		if(cnt[i] > 1){
			alert(clothesName[i]+'가 2개 이상 있습니다.');
			//console.dir(clothesName[i]+'가 2개 이상 있습니다.');
			return false;
		}
	}
	
	if(cnt[0] == 0 && cnt[1] == 0 && cnt[2] == 0){
		alert('착용한 의상이 없습니다.');
		return false;
	}
	/*
	console.dir(cnt[0]);
	console.dir(cnt[1]);
	console.dir(cnt[2]);
	*/
	//console.dir(document.querySelector('#capture'));
	
	
	//사진 캡쳐
	html2canvas(document.querySelector('#capture'))
	//document에서 body 부분을 스크린샷을 함.
	.then(
	function (canvas) {
		//canvas 결과값을 drawImg 함수를 통해서
		//결과를 canvas 넘어줌.
		//png의 결과 값
		//drawImg(canvas.toDataURL('image/png'));
	
		//appendchild 부분을 주석을 풀게 되면 body
		//document.body.appendChild(canvas);
	
		//특별부록 파일 저장하기 위한 부분.
		//saveAs(canvas.toDataURL(), 'avatar-fitting.png');
		
		let imgDataUrl = canvas.toDataURL('image/png');
		let blobBin = atob(imgDataUrl.split(',')[1]);
		let array = [];
		for (let i = 0; i < blobBin.length; i++) {
			array.push(blobBin.charCodeAt(i));
		}
		let file = new Blob([new Uint8Array(array)], {type: 'image/png'});	// Blob 생성
		let formdata = new FormData();	// formData 생성
		formdata.append("file", file);	// file data 추가
		
		$.ajax({
			type : 'post',
			url : '/avatar/saveImage',
			data : formdata,
			processData : false,	// data 파라미터 강제 string 변환 방지!!
			contentType : false,	// application/x-www-form-urlencoded; 방지!!
			success : (data) => {
				console.dir(data);
				document.querySelector('#frm_save').submit();
			}
		});
		//document.querySelector('#frm_save').submit();

	}).catch(function (err) {
		console.log(err);
	});
}
/*
function drawImg(imgData) {
	console.dir(imgData);
	//imgData의 결과값을 console 로그롤 보실 수 있습니다.
	return new Promise(function reslove() {
		//내가 결과 값을 그릴 canvas 부분 설정
		var canvas = document.getElementById('canvas');
		var ctx = canvas.getContext('2d');
		//canvas의 뿌려진 부분 초기화
		ctx.clearRect(0, 0, canvas.width, canvas.height);

		var imageObj = new Image();
		imageObj.onload = function () {
			ctx.drawImage(imageObj, 10, 10);
			//canvas img를 그리겠다.
		};
		imageObj.src = imgData;
		//그릴 image데이터를 넣어준다.

	}, function reject() { });

}
*/
function saveAs(uri, filename) {
	console.dir(uri);
	console.dir(filename);
	
	var link = document.createElement('a');
	if (typeof link.download === 'string') {
		link.href = uri;
		link.download = filename;
		document.body.appendChild(link);
		link.click();
		document.body.removeChild(link);
	} else {
		window.open(uri);
	}
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
