<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <script>
    document.title = "당신이 원하는 !t Tem" ;
  </script>

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
  	.mb-20 {
  		font-size: 1em;
  	}
  
  
  
  </style>

</head>

<body id="page-top">

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="#page-top"><img src="/resources/img/logo.png" style="width:55%;"></a>
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
          		 <li class="nav-item">
		            <a class="nav-link js-scroll-trigger" href="/member/logout">로그아웃</a>
		         </li>
          	</c:otherwise>
          </c:choose>
        </ul>
      </div>
    </div>
  </nav>

  <header class="masthead">
    <div class="container h-100">
      <div class="row h-100">
        <div class="col-lg-7 my-auto">
          <div class="header-content mx-auto">
            <h1 class="mb-5"><h2>연예인이 입었던 그 옷?</h2> <h1>'잇템'에게 물어봐!</h1><br><br>
            </h1>
            <h3 class="mb-20">사진을 넣어 클릭만 하면 무료검색이 가능합니다. 비슷한 아이템들로 네이버 쇼핑검색과 가상의 모델로 피팅까지 경험해보세요.</h3>
            <br><br><br><br><br>
            
           <c:choose>
          	<c:when test="${empty sessionScope.userInfo}">
	 			<a href="/member/join" class="btn btn-outline btn-xl js-scroll-trigger">무료회원가입</a>
	            <a href="/member/login" class="btn btn-outline btn-xl js-scroll-trigger" style="margin-left: 20px"> 로그인 </a>
          	</c:when>
          	<c:otherwise>   
		        <a class="btn btn-outline btn-xl js-scroll-trigger" href="/ml/mlTest">옷 찾기</a>
          	</c:otherwise>
          </c:choose>
            
           
          </div>
        </div>
        <div class="col-lg-5 my-auto">
          <div class="device-container">
            <div class="device-mockup iphone6_plus gold portrait white">
              <div class="device">
                <div class="screen">
                  <!-- Demo image for screen mockup, you can put an image here, some HTML, an animation, video, or anything else! -->
                  <img src="/resources/img/demo-screen-4.jpg" class="img-fluid" alt="">
                </div>
                <div class="button">
                  <!-- You can hook the "home button" to some JavaScript events or just remove it -->
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header>

  <section class="download bg-primary text-center" id="download">
    <div class="container" style="height:400px;">
      <div class="row">
        <div class="col-md-8 mx-auto">
          <h2 class="section-heading">사진 한 장으로 <br>쇼핑까지 누려라!</h2>
          <p>연예인 공항패션.. 저거 무슨 옷일까? 네이버쇼핑에서 가상피팅까지 무료로 체험 해보세요.</p>
          <div class="badges">
            <section class="features" id="features" style="padding-top:0;">
            <div class="row">
            <div class="col-lg-8 my-auto">
          <div class="container-fluid">
            <div class="row" style="align-content: space-between; display: flex; flex-wrap: unset; padding-right:100px;">
              <div class="col-lg-6">
                <div class="feature-item">
                  <i class="icon-people text-primary"></i>
                  <h3>Free Sign In</h3>
                </div>
              </div>
              <div class="col-lg-6">
                <div class="feature-item">
                  <i class="icon-camera text-primary"></i>
                  <h3>Flexible Use</h3>
                </div>
              </div>
              <div class="col-lg-6">
                <div class="feature-item">
                  <i class="icon-present text-primary"></i>
                  <h3>Free to Use</h3>
                </div>
              </div>
              <div class="col-lg-6">
                <div class="feature-item">
                  <i class="icon-basket-loaded text-primary"></i>
                  <h3>Shopping Link</h3>
                </div>
              </div>
              </div>
            </div>
          </div>
        </div>
         </section>
         	</div>
          </div>
        </div>
      </div>
  </section>

  <section class="features" id="features">
    <div class="container">
      <div class="section-heading text-center">
        <h2>Unlimited Features, Unlimited Fun</h2>
        <p class="text-muted">Check out what you want to get!</p>
        <hr>
      </div>
      <div class="row">
        <div class="col-lg-4 my-auto">
        <img class="gif-video" src="/resources/img/how_to_use.gif" loof="infinite" style="margin-left:160px;" />
        </div>
      </div>
    </div>
  </section>

  <section class="cta">
    <div class="cta-content">
      <div class="container">
        <h2>지금 <br>체험하세요.</h2>
        <a href="/member/join" class="btn btn-outline btn-xl js-scroll-trigger">무료회원가입</a>
      </div>
    </div>
    <div class="overlay"></div>
  </section>

  <section class="contact bg-primary" id="contact">
    <div class="container">
      <h2>We
        <i class="fas fa-heart"></i>
        new friends!</h2>
      <ul class="list-inline list-social">
        <li class="list-inline-item social-twitter">
          <a href="#">
            <i class="fab fa-twitter"></i>
          </a>
        </li>
        <li class="list-inline-item social-facebook">
          <a href="#">
            <i class="fab fa-facebook-f"></i>
          </a>
        </li>
        <li class="list-inline-item social-google-plus">
          <a href="#">
            <i class="fab fa-google-plus-g"></i>
          </a>
        </li>
      </ul>
    </div>
  </section>

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
