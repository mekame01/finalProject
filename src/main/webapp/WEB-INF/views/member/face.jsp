<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>당신이 원하는 !t Tem </title>
  <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link rel="stylesheet" href="/resources/vendor/simple-line-icons/css/simple-line-icons.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet">
  <link rel="stylesheet" href="/resources/device-mockups/device-mockups.min.css">
  <link href="/resources/css/new-age.min.css" rel="stylesheet">
  	<link href="/resources/css/member.css" rel="stylesheet">
  <style type="text/css">
  	.mb-20 {
  		font-size: 1em;
  	}
  	.choice_div >*{
  	float:left;
  		font-size:7em;
  		font-weight: bold;
  	}
	.valid_info{color:white;font-size:0.5vw;}
	.tit{display:inline-block; width:50px;}
	.btn_login{display:block; margin-top:2vh;}
  </style>

</head>

<body id="page-top">

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
          		 <li class="nav-item">
		            <a class="nav-link js-scroll-trigger" href="/member/face">사진등록</a>
		         </li><li class="nav-item">
		            <a class="nav-link js-scroll-trigger" href="/member/history">저장내역</a>
		         </li>
		         <li class="nav-item">
		            <a class="nav-link js-scroll-trigger" href="/member/logout">로그아웃</a>
		         </li>
		         <c:if test="${sessionScope.userInfo.userId eq 'admin'}">
			         <li class="nav-item">
			            <a class="nav-link js-scroll-trigger" href="/clothes/clothes">옷 등록하기</a>
			         </li>
		         </c:if>
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
            <div class="div_join">
           
            <div class="choice_div"><h1 style="color:skyblue;font-style: italic; margin-right: 10px">C</h1><h1 style="color:lightgreen">H</h1><h1 style="color:orange">O</h1><h1 style="color:purple">I</h1><h1 style="color:yellow">C</h1><h1 style="color:lightblue">E</h1><h1 style="color:white; font-size: 5em; transform:translateY(-40px)">.</h1></div><br><br><br><br><br><br>
            <h2>피팅모델로 사용할 사진을 고르고,</h2> <h1>'잇템'을 시작하세요!</h1>
         <form:form modelAttribute="member"
    	action="${context}/member/faceimpl" method="post" enctype="multipart/form-data" id="frm_join">
	        <input type="file" name="files" id="contract_file" style="margin-top: 15px; border-radius: 5px 5px 5px 5px; border: none; transform:translateY(-5px)" multiple/><br>
	       	
	       	<input type="submit" value="시작하기" style="margin-top: 30px; border: none; border-radius: 5px 5px 5px 5px"/>

    	</form:form>
    	
    </div>
        </div>
         <div class="col-lg-5 my-auto">
          <div class="device-container">
            <div class="device-mockup iphone6_plus gold portrait white">
              <div class="device">
                <div class="screen">
                  <!-- Demo image for screen mockup, you can put an image here, some HTML, an animation, video, or anything else! -->
                  <img src="/resources/img/얼굴선택1.jpg" style="height: 100%" class="img-fluid" alt="">
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


</body>
</html>