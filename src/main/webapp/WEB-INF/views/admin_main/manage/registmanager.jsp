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
	function adminManageGo() {
		location.href = "adminManageGo.do";
	}
	function adminManageCancel() {
		location.href = "adminManageCancel.do";
	}

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
		<jsp:include page="../header.jsp"></jsp:include>
		<section id="contents">
			<article>
				<br>
				<h1
					style="text-align: center; font-size: 30px; margin-bottom: 20px;">관리자
					등록</h1>
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
					<tr>
						<td>등급</td>
						<td>일반</td>
					</tr>
				</table>
				<div style="width: 100%; text-align: center;">
					<button class="save-button" onclick="adminManageGo()">등록</button>
					<button class="cancel-button" onclick="adminManageCancel()">취소</button>
				</div>
				</form>
			</article>
		</section>
		<jsp:include page="../../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>