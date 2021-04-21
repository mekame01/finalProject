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

#field {
	background: url(https://raw.githubusercontent.com/sannyaliev9/dressupgames/master/field.png);
	width: 400px;
	height: 400px;
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

.hero {
	background: url(https://raw.githubusercontent.com/sannyaliev9/dressupgames/master/heroes.png);
	width: 250px;
	height: 305px;
	float: left;
}


#hero1 {
	background-position: 0 0;
}


#hero2 {
	background-position: -250px 0;
}


#hero3 {
	background-position: -500px 0;
}


#hero4 {
	background-position: -750px 0px;
}


#hero5 {
	background-position: -1000px 0px;
}


#hero6 {
	background-position: -1250px 0px;
}


#hero7 {
	background-position: -1500px 0px;
}


#hero8 {
	background-position: -1750px 0px;
}


#hero9 {
	background-position: 0px -305px;
}


#hero10 {
	background-position: -250px -305px;
}
#hero11 {
	background-position: -500px -305px;
}
#hero12 {
	background-position: -750px -305px;
}
#hero13 {
	background-position: -1000px -305px;
}
#hero14 {
	background-position: -1250px -305px;
}
#hero15 {
	background-position: -1500px -305px;
}
#hero16 {
	background-position: -1750px -305px;
}
#hero17 {
	background-position: 0px -610px;
}
#hero18 {
	background-position: -250px -610px;
}
#hero19 {
	background-position: -500px -610px;
}
#hero20 {
	background-position: -750px -610px;
}
#hero21 {
	background-position: -1000px -610px;
}
#hero22 {
	background-position: -1250px -610px;
}
#hero23 {
	background-position: -1500px -610px;
}
#hero24 {
	background-position: -1750px -610px;
}
#hero25 {
	background-position: 0px -915px;
}
#hero26 {
	background-position: -250px -915px;
}
#hero27 {
	background-position: -500px -915px;
}
#hero28 {
	background-position: -750px -915px;
}
#hero29 {
	background-position: -1000px -915px;
}
#hero30 {
	background-position: -1250px -915px;
}
#hero31 {
	background-position: -1500px -915px;
}
#hero32 {
	background-position: -1750px -915px;
}

.wearable {
	cursor: pointer;
}
</style>
</head>
<body>
<div id="field">
	<div id="top"></div>
	<div id="bottom"></div>
	<div id="shoes"></div>
</div>
<div class="hero wearable bottom" id="hero1"></div>
<div class="hero wearable bottom" id="hero2"></div>
<div class="hero wearable" id="hero3"></div>
<div class="hero wearable bottom" id="hero4"></div>
<div class="hero wearable bottom" id="hero5"></div>
<div class="hero wearable" id="hero6"></div>
<div class="hero wearable bottom" id="hero7"></div>

<div class="hero wearable bottom" id="hero8"></div>
<div class="hero wearable bottom" id="hero9"></div>
<div class="hero wearable" id="hero10"></div>
<div class="hero wearable bottom" id="hero11"></div>
<div class="hero wearable bottom" id="hero12"></div>
<div class="hero wearable bottom" id="hero13"></div>
<div class="hero wearable" id="hero14"></div>
<div class="hero wearable bottom" id="hero15"></div>
<div class="hero wearable bottom" id="hero16"></div>
<div class="hero wearable bottom" id="hero17"></div>
<div class="hero wearable" id="hero18"></div>
<div class="hero wearable bottom" id="hero19"></div>
<div class="hero wearable" id="hero20"></div>
<div class="hero wearable bottom" id="hero21"></div>
<div class="hero wearable bottom" id="hero22"></div>
<div class="hero wearable bottom" id="hero23"></div>
<div class="hero wearable bottom" id="hero24"></div>
<div class="hero wearable bottom" id="hero25"></div>
<div class="hero wearable bottom" id="hero26"></div>
<div class="hero wearable bottom" id="hero27"></div>
<div class="hero wearable bottom" id="hero28"></div>
<div class="hero wearable bottom" id="hero29"></div>
<div class="hero wearable top" id="hero30"></div>
<div class="hero wearable top" id="hero31"></div>
<div class="hero wearable" id="hero32"></div>
<img src="https://raw.githubusercontent.com/sannyaliev9/dressupgames/master/ball.png" class="wearable">
<div style="clear:both"></div>
<script type="text/javascript">
document.onmousedown = function(e) {

	var clickElement = e.target;
	var wears = ['top', 'bottom', 'shoes'];
	let top = document.querySelector('#top');
	let bottom = document.querySelector('#bottom');
	let shoes = document.querySelector('#shoes');

	if (!clickElement.classList.contains('wearable')) return;

	clickElement.onmouseup = function() {
		finishClick();
	}

	function finishClick() {
		
		console.dir(wears.indexOf(clickElement.classList.value.split(' ')[2]));
		let index = wears.indexOf(clickElement.classList.value.split(' ')[2]);
		
		let something = document.querySelector('#'+wears[index]);
		
		if(clickElement.classList.contains(wears[index])){
			
			console.dir("=========================있나 없나 확인=========================");
			console.dir(something.firstChild);
			
			if(something.firstChild){
				something.removeChild(something.firstChild);
			}
			
			let cloneNode = clickElement.cloneNode();
			
			console.dir("=========================복사 요소 확인=========================");
			console.dir(cloneNode);
			
			something.appendChild(cloneNode); 
		}

		
		//초기화?
		document.onmousemove = null;
		clickElement.onmouseup = null;
	}

	return false;
}
</script>
</body>
</html>
