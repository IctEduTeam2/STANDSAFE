<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STANDSAFE</title>
<!-- <meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" /> -->
<!-- Link Swiper's CSS -->

<link rel="stylesheet" href="resources/css/slide.css" />
<link rel="stylesheet" href="resources/css/basis.css" />
<link rel="stylesheet" href="resources/css/userjoin.css" />
<script type="text/javascript">
function user_joinform() {
	location.href = "user_joinform.do";
}
function user_loginform() {
	location.href = "user_loginform.do";
}
</script>
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents" >
		<article>
				<div class="join-header">
					<h1 style="text-align: center; font-size: 30px; margin-bottom: 20px; margin-top: 100px;">Join</h1>
				</div>
				<div class="join-form">
				<div>
					<button class="join-button" onclick="user_joinform()">일반 회원 가입</button>
				</div>
				<br>
				<div class="login-links">
					<p>이미 계정이 있으신가요?</p><button class="login-button" onclick="user_loginform()">로그인하기</button>
				</div>
				</div>
			</article>
		</section>
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>
