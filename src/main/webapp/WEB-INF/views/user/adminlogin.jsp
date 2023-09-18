<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STANDSAFE</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!-- <meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" /> -->
<!-- Link Swiper's CSS -->

<link rel="stylesheet" href="resources/css/slide.css" />
<link rel="stylesheet" href="resources/css/basis.css" />
<link rel="stylesheet" href="resources/css/userlogin.css" />
<script type="text/javascript">

</script>
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents">
			<article>
				<div class="login-header">
					<h1
						style="text-align: center; font-size: 30px; margin-bottom: 20px; margin-top: 100px;">관리자 login</h1>
				</div>
				<form action="/admin_loginok.do" method="post">
					<div class="login-form">
						<input type="text" class="login-input-field" placeholder="ID" name="ADMIN_ID" required> 
							<input type="password"class="login-input-field" placeholder="Password" name="ADMIN_PW" required>
						<button class="login-button" type="submit">Login</button>
					</div>
				</form>
			</article>
		</section>
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>