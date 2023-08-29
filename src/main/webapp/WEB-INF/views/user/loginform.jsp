<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STANDSAFE</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<!-- Link Swiper's CSS -->

<link rel="stylesheet" href="resources/css/slide.css" />
<link rel="stylesheet" href="resources/css/basis.css" />
<link rel="stylesheet" href="resources/css/userlogin.css" />
<script type="text/javascript">
function user_login() {
	//location.href = "/member_login.do";
	location.href = "admin_loginok.do";
}
</script>
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents">
		<article>
		<div class="login-header">
		<h1  style="text-align: center; font-size: 30px; margin-bottom: 20px; margin-top: 100px;" >login</h1>
		</div>
		<div class="login-form">
			<input type="text" class="login-input-field" placeholder="ID">
			<input type="password" class="login-input-field" placeholder="Password">
			<button class="login-button" onclick="user_login()">Login</button>
		</div>
		<div class="login-links">
		<p><a href="find_id_form.do">아이디 찾기</a></p>|<p><a href="find_pw_form.do">비밀번호 찾기</a></p>|<p><a href="user_joinpage.do">가입하기</a></p>
		</div>
		<div class="social-login">
			<p><img src="/resources/images/kakao_login.png"></p>
			<p><img src="/resources/images/naver_login.png"></p>
			<p><img src="/resources/images/google_login.png"></p>
		</div>
		</article>
		</section>
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>