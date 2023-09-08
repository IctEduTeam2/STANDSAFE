<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STANDSAFE</title>
<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="resources/css/slide.css" />
<link rel="stylesheet" href="resources/css/basis.css" />
<link rel="stylesheet" href="resources/css/userlogin.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents">
			<article>
				<div class="login-header">
					<h1
						style="text-align: center; font-size: 30px; margin-bottom: 20px; margin-top: 100px;">login</h1>
				</div>
				<form action="/user_loginok.do" method="post">
					<div class="login-form">
						<input type="text" class="login-input-field" placeholder="ID"
							name="ID" required> <input type="password"
							class="login-input-field" placeholder="Password" name="PW"
							required>
						<button class="login-button" type="submit">Login</button>
					</div>
				</form>
				<div class="login-links">

					<p>
						<a href="find_id_form.do">아이디 찾기</a>
					</p>
					|
					<p>
						<a href="find_pw_form.do">비밀번호 찾기</a>
					</p>
					|
					<p>
						<a href="user_joinpage.do">가입하기</a>
					</p>
					|
					<p>
						<a href="adminlogin.do">(임시)관리자 로그인</a>
					</p>
				</div>
				<div class="social-login">
					<p class=>
						<c:set var="REST_API_KEY" value="1b5cf56e8cc2a06876bd756e6307c0ad" />
						<!-- 서버에따라 8080 8090 바꿔주기 -->
						<c:set var="REDIRECT_URI" value="http://localhost:8090/kakaologin.do" />
						<!-- &prompt=login : 기존의 로그인 여부와 상관없이 로그인해야하게 해놓음 -->
						<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=${REST_API_KEY}&redirect_uri=${REDIRECT_URI}&prompt=login">
							<img src="/resources/images/kakao_login.png">
						</a>
					</p>
					<!-- <p>
						<img src="/resources/images/naver_login.png">
					</p>
					<p>
						<img src="/resources/images/google_login.png">
					</p> -->
				</div>
			</article>
		</section>
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>