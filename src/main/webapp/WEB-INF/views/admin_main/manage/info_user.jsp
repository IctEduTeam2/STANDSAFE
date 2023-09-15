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

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<link rel="stylesheet" href="resources/css/slide.css" />
<link rel="stylesheet" href="resources/css/basis.css" />
<link rel="stylesheet" href="resources/css/userinfo.css" />

</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../../Semantic/header.jsp"></jsp:include>
		<section id="contents">
			<article>
				<br>
				<h1
					style="text-align: center; font-size: 30px; margin-bottom: 20px;">회원정보</h1>
				<table style="margin: auto;">
					<tr>
						<td>회원 아이디</td>
						<td><a type="text" id="username" style="color: grey;">해당
								아이디 출력</a>
					</tr>
					<tr>
						<td>별명<span class="required">*</span></td>
						<td>
							<!-- View mode --> <span id="nicknameView">해당 별명</span> <!-- Edit mode (hidden by default) -->
							<input type="text" id="nicknameEdit" name="nickname"
							placeholder="내용 입력" style="display: none;"> <!-- Edit/Save button -->
							<button class="table-button" onclick="toggleEdit('nickname')">수정</button>
							<!-- Cancel button (hidden by default) -->
							<button class="table-button" onclick="cancelEdit('nickname')"
								style="display: none;" id="nicknameCancel">취소</button>
						</td>
					</tr>
					<tr>
						<td>이름</td>
						<td><a type="text" id="username" style="color: grey;">해당
								이름 출력</a>
					</tr>
					<tr>
						<td>생년월일</td>
						<td><a type="text" id="username" style="color: grey;">해당
								생년월일 출력</a>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><a type="text" id="phone" style="color: grey;">해당
								전화번호 출력</a>
					</tr>
					<tr>
						<!-- For email -->
						<td>이메일<span class="required">*</span></td>
						<td>
							<!-- View mode --> <span id="emailView">해당 이메일</span> <!-- Edit mode (hidden by default) -->
							<input type="text" id="emailEdit" name="email"
							placeholder="내용 입력" style="display: none;"> <!-- Edit/Save button -->
							<button class="table-button" onclick="toggleEdit('email')">수정</button>
							<!-- Cancel button (hidden by default) -->
							<button class="table-button" onclick="cancelEdit('email')"
								style="display: none;" id="emailCancel">취소</button>
						</td>
					</tr>
					<tr>
						<td>이메일 수신여부</td>
						<td><a type="text" id="username" style="color: grey;">동의여부
								출력</a>
					</tr>
					<tr>
						<td>주소</td>
						<td><a type="text" id="username" style="color: grey;">해당 주소
								출력</a>
					</tr>
					<tr>
					<td>적립금</td>
					<td><a type="text" id="username" style="color: grey;">해당
							적립금 출력</a>
					</tr>
					<tr>
						<td>등급<span class="required"></span></td>
						<td><span id="gradeView">현재 등급</span>
							<div id="gradeEdit" style="display: none;">
								<label> <input type="radio" name="grade" value="1">일반	
								</label> 
								<label> <input type="radio" name="grade" value="2">이건 뭐였지
								</label>
							</div> <!-- 수정/저장 버튼 -->
							<button class="table-button" onclick="toggleEdit('grade')">수정</button>

							<!-- 취소 버튼 (기본으로 숨김) -->
							<button class="table-button" onclick="cancelEdit('grade')"
								style="display: none;" id="gradeCancel">취소</button></td>
					</tr>
				</table>
				<div style="width: 100%; text-align: center;">
					<button class="save-button" onclick="user_mypageGo()">수정완료</button>
					<button class="cancel-button" onclick="user_cancel()">취소</button>
				</div>
			</article>
		</section>
		<jsp:include page="../../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>