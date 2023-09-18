<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>STANDSAFE</title>
<!-- <meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" /> -->>
<!-- Link Swiper's CSS -->

<link rel="stylesheet" href="resources/css/slide.css" />
<link rel="stylesheet" href="resources/css/basis.css" />
<link rel="stylesheet" href="resources/css/userlogin.css" />

</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents">
			<article>
				<div class="find-box">
					<div class="centered-content">
						<c:choose>
							<c:when test="${empty ID}">
								<h3 class="inquiry">조회결과가 없습니다.</h3>
							</c:when>
							<c:otherwise>
								<h3>${M_NAME}님의 아이디는 ${ID}입니다.</h3>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
								<div>
									비밀번호를 찾으시나요? <a href="find_pw_form.do" class="find-links">
										<p>비밀번호 찾기</p>
									</a>
								</div>
			</article>
		</section>
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>