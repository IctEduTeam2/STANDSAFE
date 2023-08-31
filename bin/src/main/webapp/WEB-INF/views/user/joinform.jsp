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
<link rel="stylesheet" href="resources/css/userjoin.css" />

<script type="text/javascript">
	function user_joinok() {
		location.href = "user_joinok.do";
	}
	function user_loginform() {
		location.href = "user_joincancel.do";
	}
</script>
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents">
			<article>
				<br>
				<h1 style="text-align: center; font-size: 30px; margin-bottom: 20px;">회원가입</h1>
				<table style="margin: auto;">
					<tr>
						<td>아이디<span class="required">*</span></td>
						<td><input type="text" name="username"
							placeholder="4~20자리/영문,숫자,특수문자'_'사용 가능">
							<button>중복확인</button></td>
					</tr>
					<tr>
						<td>비밀번호<span class="required">*</span></td>
						<td><input type="password" name="password"
							placeholder="8~16자리/영문,숫자,특문"></td>
					</tr>
					<tr>
						<td>비밀번호 확인<span class="required">*</span></td>
						<td><input type="password" name="password_confirmation"
							placeholder="동일한 비밀번호">
							<button>중복확인</button></td>
					</tr>
					<tr>
						<td>닉네임<span class="required">*</span></td>
						<td><input type="text" name="nickname" placeholder="별명 입력"></td>
					</tr>
					<tr>
						<td>이름<span class="required">*</span></td>
						<td><input type="text" name="name" placeholder="이름 입력"></td>
					</tr>
					<tr>
						<td>생년월일<span class="required">*</span></td>
						<td><input type="text" name="birth" placeholder="YYYYMMDD"></td>
					</tr>
					<tr>
						<td>이메일<span class="required">*</span></td>
						<td><input type="text" name="email"
							placeholder="email@standsafe.com"></td>
					</tr>
					<tr>
						<!-- 카카오 주소 -->
						<td>주소<span class="required">*</span></td>
						<td><input type="text" id="sample4_postcode"
							placeholder="우편번호"> <input type="button"
							onclick="sample4_execDaumPostcode()" value="우편번호 찾기"> <br>
							<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
							<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
							<span id="guide" style="color: #999; display: none"></span> <input
							type="text" id="sample4_detailAddress" placeholder="상세주소">
							<input type="text" id="sample4_extraAddress" placeholder="참고항목">
						</td>
					</tr>
				</table>

				<div class="agreebox">
					<h3 class="align-left">전체동의</h3>
					<div>
						<input type="checkbox" checked> 이용약관 및 개인정보수집 및 이용, 쇼핑정보
						수신(선택)에 동의합니다.
					</div>
					<div class="agreement-box">
						[필수] 이용약관 동의
						<p><%@ include file="text/agreement_text.jsp"%></p>
						이용약관에 동의하십니까?<input type="checkbox" checked> 동의함
					</div>
					<div class="collect-box">
						[필수] 개인정보 수집 및 이용 동의
						<p><%@ include file="text/collect_text.jsp"%></p>
						개인정보 수집 및 이용에 동의하십니까?<input type="checkbox" checked> 동의함
					</div>
					<div class="alarm-box">
						[선택] 쇼핑정보 수신 동의
						<p><%@ include file="text/alarm_text.jsp"%></p>
						이메일 수신에 동의하십니까?<input type="checkbox" checked> 동의함
					</div>
					<br>
				</div>
				<div style="width: 100%; text-align:center;">
					<button class="join-button" onclick="user_joinok()">회원가입</button>
					<button class="cancel-button" onclick="user_joincancel()">취소</button>
				</div>
			</article>
		</section>
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>