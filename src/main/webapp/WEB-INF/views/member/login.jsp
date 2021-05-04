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
  <script>
    document.title = "당신이 원하는 !t Tem" ;
  </script>
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
	.valid_info{color:white;font-size:0.5vw;}
	.tit{display:inline-block; width:50px;}
	.btn_login{display:block; margin-top:2vh;}
	
	.div_login {
		padding-top: 300px;
		padding-left: 30%;
	}
	
	.btn-xl {
   		font-size: 10px;
    	padding: 5px 105px;
    }
    
    .btn {
    	border-radius: 6px;
    }
    
    .login_box {
    	width: 400px;
    	height: 450px;
   		background-color: rgba( 0, 0, 0, 0.2 );
    	text-align: center;
    	padding-top: 80px;
    }
    
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
          	</c:otherwise>
          </c:choose>
         
        </ul>
      </div>
    </div>
  </nav>
  
    <header class="masthead">
    <div class="container h-100">
      <div class="row h-100">
        
            <div class="div_login">
            	<div class="login_box">
    	<h1 class="login-text" style="text-align: center;">Login</h1>
    	<hr>
	<span class="valid_info"></span><br>	
	<span class="tit">ID :</span><input type="text" name="userId" style="border: none; border-radius: 5px 5px 5px 5px" id="id"><br>
	<span class="tit" style="margin-top: 20px;">PW :</span><input type="password" name="password" style="border: none; border-radius: 5px 5px 5px 5px" id="pw">
	<br><br><br>
	<button class="btn btn-outline btn-xl js-scroll-trigger" onclick="login()" >로그인</button>	
    	</div>
    </div>
        </div>
      </div>
   
  </header>

	
	<script type="text/javascript">
	
	let login = () => {
		
		const url = '/member/loginimpl';
		let params = {};
		params.userId = id.value;
		params.password = pw.value;
		let headerObj = new Headers();
		headerObj.append("content-type","application/json");
		
		fetch(url,{
			method:"post",
			headers:headerObj,
			body:JSON.stringify(params)
		})
		.then(response => {
			if(response.ok){
				return response.text();
			}else{
				throw new AsyncResponseError(response.text());
			}
		})
		.then(text => {
			if(text == 'fail'){
				document.querySelector('.valid_info').innerHTML = '아이디나 비밀번호를 확인하세요.';
			}else if(text == 'success'){
				location.href = "/index";
			}
		}).catch((error)=>{
			error.alertMessage();
		})
	}
	</script>	


</body>
</html>