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

<script type="text/javascript">
	function toggleEdit(fieldName) {
		let viewElement = document.getElementById(fieldName + "View");
		let editElement = document.getElementById(fieldName + "Edit");
		let button = event.target; // 현재 클릭된 버튼
		let cancelButton = document.getElementById(fieldName + "Cancel");

		if (editElement.style.display === "none") {
			// 편집 모드로 전환
			editElement.style.display = "";
			viewElement.style.display = "none";
			editElement.value = viewElement.innerText; // 입력을 현재 값으로 채움
			button.innerText = "수정";
			cancelButton.style.display = ""; // 취소 버튼 표시
		} else {
			// 보기 모드로 전환
			editElement.style.display = "none";
			viewElement.style.display = "";
			viewElement.innerText = editElement.value; // 표시된 값을 편집된 값으로 업데이트합니다
			button.innerText = "수정";
			cancelButton.style.display = "none"; // 취소 버튼 숨기기
		}
	}

	function cancelEdit(fieldName) {
		let viewElement = document.getElementById(fieldName + "View");
		let editElement = document.getElementById(fieldName + "Edit");
		let editSaveButton = document
				.querySelector(`button[onclick="toggleEdit('${fieldName}')"]`);
		let cancelButton = document.getElementById(fieldName + "Cancel");

		// 편집 중에 변경한 내용을 되돌립니다
		editElement.value = viewElement.innerText;

		// 편집 상태를 벗어남
		editElement.style.display = "none";
		cancelButton.style.display = "none"; // 취소 버튼 숨김
		viewElement.style.display = "";

		// 버튼의 이름을 '수정'으로 변경합니다.
		editSaveButton.innerText = "수정";
	}
</script>
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
						<td>관리자 아이디</td>
						<td><a type="text" id="username" style="color: grey;">해당
								아이디 출력</a>
					</tr>
					<tr>
						<td>별명<span class="required">*</span></td>
						<td>
							<!-- View mode --> <span id="nicknameView">admin(1)</span> <!-- Edit mode (hidden by default) -->
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
						<td>주소</td>
						<td><a type="text" id="username" style="color: grey;">해당 주소
								출력</a>
					</tr>
					<tr>
						<td>등급</td>
						<td><a type="text" id="username" style="color: grey;">일반 관리자</a>
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