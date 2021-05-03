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
  <style type="text/css">
  	.mb-20 {
  		font-size: 1em;
  	}
	.valid_info{color:white;font-size:0.5vw;}
	.tit{display:inline-block; width:50px;}
	.btn_login{display:block; margin-top:2vh;}
	input::placeholder{
		color : grey;
		font-size: 3px;
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
        <div class="col-lg-7 my-auto">
        
            <div class="div_join">
            
            <form:form modelAttribute="member"
    	action="${context}/member/mailauth" method="post" id="frm_join">
     <table>
        <tr>
           <td>ID  </td>
           <td>
           	  <input type="text" name="userId" id="id" size="10" style="margin-top: 15px; border-radius: 5px 5px 5px 5px; border: none; transform:translateY(-5px)" required/>
              <button  style="border: none; border-radius: 5px 5px 5px 5px; transform:translateY(-5px)" type="button" onclick="idCheck()">check</button>
              <span class="valid_info" id="id_check"></span>
              <!-- path: 필드명 -->
              <form:errors path="userId" cssClass="valid_info"/>
           </td>
        </tr>
        <tr>
           <td>PASSWORD  </td>
           <td>
           	  <input type="password" name="password" id="pw" style="margin-top: 15px; border-radius: 5px 5px 5px 5px; border: none;  transform:translateY(-5px)" placeholder="영문자/숫자/특수문자를 포함한 8~15자리" required/>
           	  <span id="pw_confirm" class="valid_info"></span>
           	  <form:errors path="password" cssClass="valid_info"/>
           </td>
        </tr>
        <tr>
        <td>성별  </td>
        <td>
        <select id="gender" name="gender" style="margin-top: 15px; border-radius: 5px 5px 5px 5px; border: none;  transform:translateY(-5px)">
        <option value="남자">남자</option>
        <option value="여자">여자</option>
      	</select>
      	</td>
      	</tr>
        <tr>
           <td>email  </td>
           <td>
           	  <input type="email" name="email" placeholder="ittem@abc.com" style="margin-top: 20px; border-radius: 5px 5px 5px 5px; border: none;  transform:translateY(-5px)" required/>
           	  <form:errors path="email" cssClass="valid_info"/>
           </td>
        </tr>
        <tr>
           <td>
              <input type="submit" value="가입" style="margin-top: 15px; border: none; border-radius: 5px 5px 5px 5px"/>
              <input type="reset" value="취소" style="margin-top: 15px; margin-left:10px; border: none; border-radius: 5px 5px 5px 5px"/>
           </td>
       </tr>

   </table>
   </form:form>
            
         
    </div>
        </div>
        <div class="col-lg-5 my-auto">
          <div class="device-container">
            <div class="device-mockup iphone6_plus gold portrait white">
            </div>

          </div>
        </div>
      </div>
    </div>
  </header>

   
      <script type="text/javascript">
   let idCheckFlg = false;
   let idCheck = () => {
	   //사용자가 입력한 아이디
	   //요소의 아이디속성이 있을 경우 해당 엘리먼트를 가져다가 사용할 수 있다.
	   let userId = id.value;
	   if(userId){
		  
		   fetch("/member/idcheck?userId=" + userId,{
			   method:"get"
		   })
		   .then(response => response.text())
		   .then(text =>{
			   if(text == 'success'){
				   idCheckFlg = true;
				   id_check.innerHTML = '사용 가능한 아이디 입니다.';
			   }else{
				   idCheckFlg = false;
				   id_check.innerHTML = '사용 불가능한 아이디 입니다.';
				   id.value="";
			   }
		   })
		   
	   }else{
		   alert("아이디를 입력하지 않으셨습니다.");
	   }
   }
   
   document.querySelector('#frm_join').addEventListener('submit',(e)=>{
	   let password = pw.value;
	   let regExp = /^(?!.*[ㄱ-힣])(?=.*\W)(?=.*\d)(?=.*[a-zA-Z])(?=.{8,})/;
	   
	   if(!idCheckFlg){
		   e.preventDefault();
		   alert("아이디 중복검사를 하지 않으셨습니다.");
		   id.focus()
	   }
	   
	   if(!(regExp.test(password))){
		   //form의 데이터 전송을 막음
		   e.preventDefault();
		   pw_confirm.innerHTML = '비밀번호는 숫자,영문자,특수문자 조합의 8글자 이상인 문자열입니다.';
		   pw.value='';
	   }
   });
   
   </script>

</body>
</html>