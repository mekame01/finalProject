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
	.mb-20 {
  		font-size: 1em;
  	}
  	
  	.clothes {
  		padding-left: 300px;
  		padding-right: 200px;
  	}
  	
	.category{
		border: none;
		margin: 0;
		border-width: 5px;
	}
	
	.oneImage{
		display: inline-block;
		vertical-align: middle;
		text-align: center;
	}
	
	.image{
		max-width: 200px;
		max-height: 250px;
	}
	
	.del-outline {
  		border: 1px solid;
  		border-color: white;
	}

	.del-outline:hover, .del-outline:focus, .del-outline:active, .del-outline.active {
  		color: white;
  		border-color: #fdcc52;
  		background-color: #fdcc52;
	}

	.del {
  		border-radius: 100px;
  		font-family: 'Lato', 'Helvetica', 'Arial', 'sans-serif';
  		letter-spacing: 2px;
  		text-transform: uppercase;
	}

	.del-xl {
 	 	font-size: 11px;
  		padding: 10px 40px;
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
  

<div class="clothes">
	<c:forEach var="category" items="${requestScope.categories}" varStatus="status">
		<form action="/clothes/clothes" method="post" enctype="multipart/form-data">
			<h2>${category}</h2>
			<div class="category">
				<c:forEach var="clothes" items="${requestScope.clothes}" varStatus="imageStatus">
					<c:if test="${status.count eq clothes.clothesCode}">
						<div class="oneImage">
							<img class="image" src="/upload/${requestScope.files[imageStatus.index].savePath}${requestScope.files[imageStatus.index].renameFileName}" alt="Image">
							<button class="del del-outline del-xl" type="button" onclick="addFileParameter(${clothes.clothesIdx}, this)">삭제</button>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<br>
			<input type="file" name="files" multiple/>
			<input type="hidden" name="division" value="${status.count}">
			<button type="submit">전송</button>
		</form>
		<br><br>
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