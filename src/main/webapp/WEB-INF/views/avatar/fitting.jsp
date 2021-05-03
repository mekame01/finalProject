<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  
  <!-- Bootstrap core CSS -->
  <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link rel="stylesheet" href="/resources/vendor/simple-line-icons/css/simple-line-icons.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet">

  <!-- Plugin CSS -->
  <link rel="stylesheet" href="/resources/device-mockups/device-mockups.min.css">

  <!-- Custom styles for this template -->
  <link href="/resources/css/new-age.min.css" rel="stylesheet">

<style type="text/css">

.masthead {
	padding-left: 300px;
	padding-right: 50px;

}
.model {
	float: left;
	background-position: center;
}

.top{
	max-width: 200px;
	max-height: 250px;
}

.bottom{
	max-width: 300px;
	max-height: 330px;
}

.draggable {
	cursor: pointer;
}
</style>
</head>

<body>
 <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="/index"><img src="/resources/img/logo.png" style="width:55%;"></a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#download">체험하기</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#features">이용안내</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#contact">고객센터</a>
          </li>
           <c:choose>
          	<c:when test="${empty sessionScope.userInfo}">
          		 <li class="nav-item">
		            <a class="nav-link js-scroll-trigger" href="/member/login">로그인</a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link js-scroll-trigger" href="/member/join">회원가입</a>
		          </li>
          	</c:when>
          	<c:otherwise>  	
          	</c:otherwise>
          </c:choose>
        </ul>
      </div>
    </div>
  </nav>
  
<header class="masthead" style="height:auto;">
    <div class="container h-100">
      <div class="row h-100">
        <div class="col-lg-7 my-auto">
          <div class="header-content mx-auto" style="height:150px;">
        </div>
        </div>
      </div>
    </div>
    
    
<div class="fitting-content">
<form action="/avatar/modify" method="post" style="border: dotted; float: left;">
	<div>
		<img alt="image" src="/upload/2021/5/1/model.png">
	</div>
</form>
	<div class="fittings" style="padding-left: 300px;">
		<div class="fitting-top">
		<c:forEach var="top" items="${requestScope.tops}" varStatus="imageStatus">
			
			<img class="clothes draggable top" src="/upload/${top.savePath}${top.renameFileName}" alt="Image">
			
		</c:forEach>
		<br>
		</div>
		<div class="fitting-bottom">
		<c:forEach var="bottom" items="${requestScope.bottoms}" varStatus="imageStatus">
			
			<img class="clothes draggable bottom" src="/upload/${bottom.savePath}${bottom.renameFileName}" alt="Image">
			
		</c:forEach>
		<br>
		</div>
		<div class="fitting-shoe">
		<c:forEach var="shoe" items="${requestScope.shoes}" varStatus="imageStatus">
			
			<img class="clothes draggable shoe" src="/upload/${shoe.savePath}${shoe.renameFileName}" alt="Image">
			
		</c:forEach>
		</div>
	</div>
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
</header>


 <footer>
    <div class="container">
      <p>&copy; Your Website 2021. All Rights Reserved.</p>
      <ul class="list-inline">
        <li class="list-inline-item">
          <a href="#">Privacy</a>
        </li>
        <li class="list-inline-item">
          <a href="#">Terms</a>
        </li>
        <li class="list-inline-item">
          <a href="#">FAQ</a>
        </li>
      </ul>
    </div>
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="/resources/js/new-age.min.js"></script>
  <script>
    document.title = "당신이 원하는 !t Tem" ;
  </script>

</body>
</html>
