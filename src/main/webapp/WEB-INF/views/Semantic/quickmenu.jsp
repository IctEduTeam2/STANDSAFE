<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$("#scrollToTop").click(function() {
			$("html, body").animate({
				scrollTop : 0
			}, 500);
			return false;
		});
	});
</script>
</head>
<body>
	<c:choose>
		<c:when test="${id != null}">

			<div id="STATICMENU" style="border: 0;">
				<div class="quick1"
					style="border: 1px solid black; padding-bottom: 20px; padding-top: 20px;">
					<h3>빠른메뉴</h3>
					<br> <a href="/mypageform.do?client_num=${id }"><img
						src="resources/images/quick/mypage.png" class="quickIcon"
						style="width: 90px; height: 90px;"><span class="quickText">마이페이지</span></a>
					<br> <a href="/basketform.do?client_num=${id }"><img
						src="resources/images/quick/basket.png" class="quickIcon"
						style="width: 90px; height: 90px;"><span class="quickText">장바구니
					</span></a> <br> <a href="/jaenan_rainlive.do"><img
						src="resources/images/quick/weather_icon.png" class="quickIcon"
						style="width: 90px; height: 90px;"><span class="quickText">실시간
							날씨</span></a> <br> <a href="/bbs_notice_go.do"><img
						src="resources/images/quick/notice_icon.png" class="quickIcon"
						style="width: 90px; height: 90px;"><span class="quickText">공지사항</span></a>
				</div>
				<div class="quick2" style="padding-top: 30px;">
					<a href="javascript:void(0);" id="scrollToTop"> <img
						src="resources/images/quick/top.png" class="quickIcon"
						style="width: 40px; height: 40px;"><br> <span
						class="quickText">TOP</span>
					</a>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div id="STATICMENU" style="border: 0;">
				<div class="quick1"
					style="border: 1px solid black; padding-bottom: 20px; padding-top: 20px;">
					<h3>빠른메뉴</h3>
					<br> <a href="/loginform.do"><img
						src="resources/images/quick/login.png" class="quickIcon"
						style="width: 90px; height: 90px;"><span class="quickText">로그인</span></a>
						<br> <a href="/registerform.do"><img
						src="resources/images/quick/register.png" class="quickIcon"
						style="width: 90px; height: 90px;"><span class="quickText">회원가입</span></a>
					<br> <a href="/jaenan_rainlive.do"><img
						src="resources/images/quick/weather_icon.png" class="quickIcon"
						style="width: 90px; height: 90px;"><span class="quickText">실시간
							날씨</span></a> <br> <a href="/bbs_notice_go.do"><img
						src="resources/images/quick/notice_icon.png" class="quickIcon"
						style="width: 90px; height: 90px;"><span class="quickText">공지사항</span></a>
					
				</div>
				<div class="quick2" style="padding-top: 30px;">
					<a href="javascript:void(0);" id="scrollToTop"> <img
						src="resources/images/quick/top.png" class="quickIcon"
						style="width: 40px; height: 40px;"><br> <span
						class="quickText">TOP</span>
					</a>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>