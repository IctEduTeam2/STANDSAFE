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
function execDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			var addr = '';
			var extraAddr = '';

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 도로명 주소 
				addr = data.roadAddress;
			} else { // 지번 주소
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraAddr !== '') {
					extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				document.getElementById("extraAddress").value = extraAddr;

			} else {
				document.getElementById("extraAddress").value = '';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('postcode').value = data.zonecode;
			document.getElementById("address").value = addr;
			
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("detailAddress").focus();
		}
	}).open();
}
function user_loginform() {
	location.href = "user_joincancel.do";
}

//약관버튼 작동
document.addEventListener("DOMContentLoaded", function() {
	const agreement = document.getElementById("agreement");
	const mandatory1 = document
			.querySelector(".agreement-box input[type='checkbox']");
	const mandatory2 = document
			.querySelector(".collect-box input[type='checkbox']");
	const optional1 = document
			.querySelector(".alarm-box input[type='checkbox']");
	const signUpButton = document.getElementById("signUpButton");

	// 초기 설정
    email_st.value = optional1.checked ? 1 : 0;
	
	agreement.addEventListener("change", function() {
		if (this.checked) {
			mandatory1.checked = true;
			mandatory2.checked = true;
			optional1.checked = true;
		} else {
			mandatory1.checked = false;
			mandatory2.checked = false;
			optional1.checked = false;
		}
		email_st.value = optional1.checked ? 1 : 0;
	});

	function checkMandatory() {
		if (mandatory1.checked && mandatory2.checked) {
			signUpButton.disabled = false;
		} else {
			signUpButton.disabled = true;
		}
	}
	mandatory1.addEventListener("change", checkMandatory);
	mandatory2.addEventListener("change", checkMandatory);
	optional1.addEventListener("change", function() {
		email_st.value = this.checked ? 1 : 0;
	});
});

//비밀번호 일치 색 확인
document.addEventListener("DOMContentLoaded", function() {
	const password = document.getElementById("password");
	const password_confirm = document.getElementById("password_confirm");
	const password_match = document.getElementById("password_match");
	// 비밀번호 확인 필드에 이벤트 리스너 추가
	password_confirm.addEventListener("input", function() {
		if (password.value === password_confirm.value) {
			password_match.textContent = "비밀번호가 일치합니다.";
			password_match.style.color = "green";
		} else {
			password_match.textContent = "비밀번호가 일치하지 않습니다.";
			password_match.style.color = "red";
		}
	});
});

//addr 추합
function prepareAddr() {
var postcode = document.getElementById("postcode").value;
var address = document.getElementById("address").value;
var extraAddress = document.getElementById("extraAddress").value;
var detailAddress = document.getElementById("detailAddress").value;

var fullAddress = postcode + " " + address + "" + extraAddress + " " + detailAddress;

// 띄어쓰기로 구분하여 저장
document.getElementById("ADDR").value = fullAddress.trim();
}
</script>
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../header.jsp"></jsp:include>
		<section id="contents">
			<article>
				<br>
				<h1 style="text-align: center; font-size: 30px; margin-bottom: 20px;">관리자
					등록</h1>
				<form action="adminManageGo.do" method="POST" id="userForm"
					onsubmit="return checkAll()">
				<table style="margin: auto;">
					<tr>
						<td>아이디<span class="required">*</span></td>
						<td><input type="text" name="ADMIN_ID" id="id" maxlength="16"
							placeholder="영문+숫자4~12자리"></td>
					</tr>
					<tr>
						<td>비밀번호<span class="required">*</span></td>
						<td><input type="password" name="ADMIN_PW" id="password"
							maxlength="20" placeholder="영문,숫자,특수 6글자~"></td>
					</tr>
					<tr>
						<td>비밀번호 확인<span class="required">*</span></td>
						<td><input type="password" name="pw_confirm"
							id="password_confirm" placeholder="동일한 비밀번호"> <span
							id="password_match"></span></td>
						<!-- 여기에 일치 여부를 표시 -->
					</tr>
					<tr>
						<td>닉네임<span class="required">*</span></td>
						<td><input type="text" id="NICKNAME" name="ADMIN_NICK"
							placeholder="별명 입력" oninput="checkId()"></td>
					</tr>
					<tr>
						<td>이름<span class="required">*</span></td>
						<td><input type="text" name="ADMIN_NAME" placeholder="이름 입력"></td>
					</tr>
					<tr>
						<td>생년월일<span class="required"></span></td>
						<td><input type="date" name="ADMIN_BIRTH" placeholder="YYYYMMDD"></td>
					</tr>
					<tr>
						<td>전화번호<span class="required"></span></td>
						<td><input name="ADMIN_PHONE" id="PHONE"
							oninput="limitAndFormatPhoneNumber(this)"
							placeholder="'-'없이 작성하세요" type="text" /></td>
					</tr>
					<tr>
						<td>이메일<span class="required">*</span></td>
						<td><input type="text" name="ADMIN_MAIL"
							placeholder="email@standsafe.com"></td>
					</tr>
					<tr>
						<!-- 카카오 주소 -->
						<td>주소<span class="required"></span></td>
						<td><input type="text" name="postcode" id="postcode"
							placeholder="우편번호" disabled="readonly"> <input
							type="button" onclick="execDaumPostcode()" value="우편변호 찾기">
							<br> <input type="text" name="address" id="address"
							placeholder="주소" disabled="readonly"> <input type="text"
							name="extraAddress" id="extraAddress" placeholder="참고주소"
							disabled="readonly"> <span id="guide"
							style="color: #999; display: none"></span> <input type="text"
							name="detailAddress" id="detailAddress" placeholder="상세주소">
							<!-- 히든 필드 --> <input type="hidden" id="ADDR" name="ADMIN_ADDR">
						</td>
					</tr>
				</table>
				<div style="width: 100%; text-align: center;">
					<button type="submit" class="save-button" onclick="prepareAddr()"
							id="signUpButton">등록</button>
					<button class="cancel-button" onclick="adminManageCancel()">취소</button>
				</div>
				</form>
			</article>
		</section>
		<jsp:include page="../../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>