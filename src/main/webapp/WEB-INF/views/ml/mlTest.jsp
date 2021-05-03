<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<script>
	document.title = "당신이 원하는 !t Tem";
</script>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="/resources/js/tab.js"></script>
<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="/resources/vendor/simple-line-icons/css/simple-line-icons.css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Muli"
	rel="stylesheet">
<!-- Plugin CSS -->
<link rel="stylesheet"
	href="/resources/device-mockups/device-mockups.min.css">

<!-- Custom styles for this template -->
<link href="/resources/css/new-age.min.css" rel="stylesheet">




<style type="text/css">
.mb-20 {
	font-size: 1em;
}

.section-heading button {
	margin-bottom: 2vw;
}

#result-wrap {
	display: flex;
	justify-content: space-around;
}

#webcam-wrap {
	display: flex;
	justify-content: center;
}

#webcam-container {
	width: 400px;
	height: 400px;
	border: solid gray;
	background-color: gray;
	opacity: 80%;
	transform: translateX(4.49vw);
}

#label-container {
color: black;
    display: flex;
    text-align: left;
    flex-direction: column;
    justify-content: space-evenly;
    transform: translateX(16px);
}

#download {
	position: relative;
	min-height: 80vh;
	padding: 33px 0 160px 0;
}

.tab {
	list-style: none;
	padding: 0;
	overflow: hidden;
}

.tab li { /* 탭 왼쪽 정렬 */
	float: left;
}

.tab li a {
	display: inline-block;
	color: black;
	text-algin: center;
	text-decoratoin: none;
	padding: 14px 16px;
	font-size: 17px;
	trainsition: 0.3s;
}

.modelTest {
	display: none;
	background-color: white;
	opacity: 90%;
	padding: 6px 12px;
	color: #0000;
}

ul.tab li.current {
	opacity: 90%;
	background-color: white;
}

.modelTest.current {
	display: block;
}

#tab_wrap {
	display: flex;
	flex-direction: column;
}
</style>
<!-- model불러오기 -->
<script
	src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>

</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="/index"><img
				src="/resources/img/logo.png" style="width: 55%;"></a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#download">체험하기</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#features">이용안내</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#contact">고객센터</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="/member/login">로그인</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="/member/join">회원가입</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<header class="masthead" style="min-height: 30vh; height: 30vh;">
	</header>

	<section class="download bg-primary text-center" id="download">
		<div class="container" style="height: 400px;">
			<div class="row">
				<div class="col-md-8 mx-auto">
					<h2 class="section-heading">
						<h2 style="font-size: 50px; font-style: 600;">체험하기</h2>
						<div id='tab_wrap'>
							<ul class='tab' style="margin: 0">
								<li class="current" data-tab="tab1"><a href="#">웹캠으로 검색</a></li>
								<li data-tab="tab2"><a href="#">사진으로 검색</a></li>
							</ul>
							<div id="tab1" class="modelTest current">
								<h4>웹캠으로 검색</h4>
								<button type="button" onclick="init()" id='btn_name' value='on'>Start</button>
								<div id="result-wrap">
									<div id="webcam-wrap">
										<div id="webcam-container"></div>
									</div>
									<div id="label-container"></div>
								</div>
							</div>
							<script src="/resources/js/videoTest.js"></script>
							<script src="/resources/js/imageTest.js"></script>
							<div id="tab2" class="modelTest">
								<h4>이미지로 검색</h4>
								<label><input type="file" id="testImg" name="img"
									onchange="setThumbnail(event);"> </label>

								<div id="result-wrap2">
									<div id="image-wrap">
										<div id="image-container"></div>
									</div>
									<div id="label-container2"></div>
								</div>
							</div>
						</div>
						<!-- <div id="console"></div>
						<div class="badges"></div>
 -->
				</div>
			</div>
		</div>
	</section>
	<footer>
		<div class="container">
			<p>&copy; Your Website 2021. All Rights Reserved.</p>
			<ul class="list-inline">
				<li class="list-inline-item"><a href="#">Privacy</a></li>
				<li class="list-inline-item"><a href="#">Terms</a></li>
				<li class="list-inline-item"><a href="#">FAQ</a></li>
			</ul>
		</div>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="js/new-age.min.js"></script>
</html>