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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="resources/css/slide.css" />
<link rel="stylesheet" href="resources/css/basis.css" />
<link rel="stylesheet" href="resources/css/userinfo.css" />

</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../header.jsp"></jsp:include>
		<section id="contents">
			<article>
				<br>
				<h1
					style="text-align: center; font-size: 30px; margin-bottom: 20px;">관리자 등록</h1>
				<form action="adminManageGo.do" method="POST" id="adminForm"
					onsubmit="return checkAll()">
				<table style="margin: auto;">
					<tr>
							<td>아이디<span class="required">*</span></td>
							<td><input type="text" id="ADMIN_ID" name="ADMIN_ID"
								placeholder="아이디 입력">
								<button type="button" onclick="checkIdDuplicate()">중복
									검사</button> <span id="id_result"></span></td>
						</tr>
					<tr>
							<td>비밀번호<span class="required">*</span></td>
							<td><input type="password" id="password" name="ADMIN_PW"
								placeholder="비밀번호를 입력하세요" onkeyup="validatePassword()" /><span
								id="password_result"></span></td>
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
							<td><input type="text" id="ADMIN_NICK" name="ADMIN_NICK"
								placeholder="별명 입력">
								<button type="button" onclick="checkNickDuplicate()">중복
									검사</button> <span id="nickname_result"></span></td>
						</tr>
					<tr>
							<td>이름<span class="required">*</span></td>
							<td><input type="text" name="ADMIN_NAME" id="ADMIN_NAME"
								placeholder="이름 입력"></td>
						</tr>
					<tr>
							<td>생년월일<span class="required">*</span></td>
							<td><input type="date" name="ADMIN_BIRTH" id="ADMIN_BIRTH"
								placeholder="YYYYMMDD"></td>
						</tr>
					<tr>
							<td>전화번호<span class="required">*</span></td>
							<td><input name="ADMIN_PHONE" id="ADMIN_PHONE"
								oninput="limitAndFormatPhoneNumber(this)"
								placeholder="'-'없이 작성하세요" type="text" onkeyup="validatePhone()" /><span
								id="phone_result"></span></td>
						</tr>
					<tr>
							<td>이메일<span class="required">*</span></td>
							<td><input type="text" name="ADMIN_MAIL" id="ADMIN_MAIL"
								placeholder="email@standsafe.com" onkeyup="checkEmail()"><span
								id="email_result"></span></td>
						</tr>
					<tr>
							<!-- 카카오 주소 -->
							<td>주소<span class="required">*</span></td>
							<td><input type="text" name="postcode" id="postcode"
								placeholder="우편번호" readonly> <input type="button"
								onclick="execDaumPostcode()" value="우편변호 찾기"><br> <input
								type="text" name="address" id="address" placeholder="주소"
								readonly> <input type="text" name="extraAddress"
								id="extraAddress" placeholder="참고주소" readonly> <span
								id="guide" style="color: #999; display: none"></span> <input
								type="text" name="detailAddress" id="detailAddress"
								placeholder="상세주소"> <!-- 히든 필드 --> <input type="hidden"
								id="ADMIN_ADDR" name="ADMIN_ADDR"></td>
						</tr>
				</table>
				<div style="width: 100%; text-align: center;">
						<button type="submit" class="save-button" onclick="prepareAddr()"
							id="signUpButton">등록</button>
						<button type="button" class="cancel-button"
							onclick="admin_joincancel()">취소</button>
					</div>
				</form>
			</article>
		</section>
		<jsp:include page="../../Semantic/footer.jsp"></jsp:include>
	</div>
	<script>
		function execDaumPostcode() {
			new daum.Postcode(
					{
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
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
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
	</script>
	<script type="text/javascript">
		function admin_joincancel() {
			location.href = "adminManagement.do";
		}

		//addr 추합
		function prepareAddr() {
    var postcode = document.getElementById("postcode").value;
    var address = document.getElementById("address").value;
    var extraAddress = document.getElementById("extraAddress").value;
    var detailAddress = document.getElementById("detailAddress").value;

    var fullAddress = "(" + postcode + ")";

    if (address) {
        fullAddress += ", " + address;
    }
    
    if (extraAddress) {
        fullAddress += ", " + extraAddress;
    }
    
    if (detailAddress) {
        fullAddress += ", " + detailAddress;
    }

    document.getElementById("ADMIN_ADDR").value = fullAddress.trim();
}
	</script>
	<script defer type="text/javascript">
		//비밀번호 일치 색 확인
		document.addEventListener("DOMContentLoaded", function() {
			const password = document.getElementById("password");
			const password_confirm = document
					.getElementById("password_confirm");
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
		//비밀번호 유효성 검사
		function validatePassword() {
			const password = document.getElementById("password").value;
			const resultSpan = document.getElementById("password_result");
			const passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$/;

			if (!passwordRegex.test(password)) {
				resultSpan.textContent = "비밀번호는 최소 8자리, 하나 이상의 문자, 하나 이상의 숫자, 하나 이상의 특수 문자가 필요합니다.";
				resultSpan.style.color = "red";
			} else {
				resultSpan.textContent = "유효한 비밀번호입니다.";
				resultSpan.style.color = "green";
			}
		}
		//전화번호 유효성 검사
		function validatePhone() {
			const phone = document.getElementById("ADMIN_PHONE").value;
			const resultSpan = document.getElementById("phone_result");
			const phoneRegex = /^\d{11}$/;

			if (phone.length === 0) {
				resultSpan.textContent = "전화번호가 누락되었습니다.";
				resultSpan.style.color = "red";
			} else if (isNaN(phone)) {
				resultSpan.textContent = "전화번호는 숫자만 입력 가능합니다.";
				resultSpan.style.color = "red";
			} else if (!phoneRegex.test(phone)) {
				resultSpan.textContent = "전화번호는 11자리의 숫자만 가능합니다.";
				resultSpan.style.color = "red";
			} else {
				resultSpan.textContent = "유효한 전화번호입니다.";
				resultSpan.style.color = "green";
			}
		}
		//이메일 유효성 검사
		function checkEmail() {
			const email = document.getElementById("ADMIN_MAIL").value;
			const resultSpan = document.getElementById("email_result");
			const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

			if (email.length === 0) {
				resultSpan.textContent = "이메일이 누락되었습니다.";
				resultSpan.style.color = "red";
			} else if (!emailRegex.test(email)) {
				resultSpan.textContent = "이메일 형식이 올바르지 않습니다.";
				resultSpan.style.color = "red";
			} else {
				resultSpan.textContent = "유효한 이메일 형식입니다.";
				resultSpan.style.color = "green";
			}
		}
	</script>
	<script defer type="text/javascript" >
		// 별명 유효성 검사
		function checkNickDuplicate() {
			//console.log("Before Ajax call"); // Ajax 호출 전 log
			const nickname = document.getElementById("ADMIN_NICK").value;
			const resultSpan = document.getElementById("nickname_result");

	        // 별명이 빈 문자열인 경우
	        if (nickname.trim() === '') {
	            resultSpan.textContent = "별명을 입력해주세요.";
	            resultSpan.style.color = "red";
	            return;  // 여기서 함수를 종료
	        }
			console.log(`NICKNAME to check: ${nickname}`);

			$.ajax({
				url : "/checkAdminNickDuplicate.do",
				type : "POST",
				data : {'ADMIN_NICK' : nickname},
				
				success : function(result) {
					//console.log("After Ajax call"); // Ajax 호출 후 log
					//console.log(`Server response: ${result}`);

					const resultSpan = document
							.getElementById("nickname_result");

					if (result === "duplicate") {
						resultSpan.textContent = "닉네임이 중복됩니다.";
						resultSpan.style.color = "red";
					} else {
						resultSpan.textContent = "사용 가능한 닉네임입니다.";
						resultSpan.style.color = "green";
					}
				},
				error : function(xhr, status, error) {
					//console.log("Error block"); // 에러 발생 시 log
					//console.log(`Error occurred: ${error}`);

					const resultSpan = document.getElementById("nickname_result");
					resultSpan.textContent = "서버 에러, 다시 시도해 주세요.";
					resultSpan.style.color = "red";
				}
			});
		}
	</script>


	<script defer type="text/javascript">
		async function checkIdDuplicate() {
			const id = document.getElementById("ADMIN_ID").value;
			const resultSpan = document.getElementById("id_result");
			// 아이디가 빈 문자열인 경우
		    if (id.trim() === '') {
		        resultSpan.textContent = "아이디를 입력해주세요.";
		        resultSpan.style.color = "red";
		        return;  // 여기서 함수를 종료
		    }
			
			const formData = new FormData();
			formData.append('ADMIN_ID', id);
			//console.log(`ID to check: ${id}, ${ID}`);
			try {
				//서버 요청 (fetch API 사용)
				const response = await
				fetch("/checkAdminIdDuplicate.do", {
					method : "POST",
					body : formData
				});
				//console.log("After fetch"); // fetch 호출 후 log
				//console.log(`HTTP Status Code: ${response.status}`); // HTTP 상태 코드

				//서버 응답 처리
				const result = await response.text();
				//내용과 스타일을 변경
				const resultSpan = document.getElementById("id_result");

				if (result.trim() === 'duplicate') {
					resultSpan.textContent = "아이디가 중복됩니다.";
					resultSpan.style.color = "red";
				} else if (result.trim() === 'not_duplicate') {
					resultSpan.textContent = "사용 가능한 아이디입니다.";
					resultSpan.style.color = "green";
				} else {
					resultSpan.textContent = "알 수 없는 오류";
					resultSpan.style.color = "orange";
				}
			} catch (error) {
				//console.log("Error block"); // 에러 발생 시 log
				//console.log(`Error occurred: ${error}`);
				const resultSpan = document.getElementById("id_result");
				resultSpan.textContent = "서버 에러, 다시 시도해 주세요.";
				resultSpan.style.color = "red";
			}
		}
	</script>
		<script defer type="text/javascript">
		function validateForm() {
			const id = document.getElementById("ADMIN_ID").value;
			const password = document.getElementById("password").value;
			const password_confirm = document
					.getElementById("password_confirm").value;
			const nickname = document.getElementById("ADMIN_NICK").value;
			const name = document.getElementById("ADMIN_NAME").value;
			const birth = document.getElementById("ADMIN_BIRTH").value;
			const phone = document.getElementById("ADMIN_PHONE").value;
			const email = document.getElementById("ADMIN_MAIL").value;
			const address = document.getElementById("address").value;
			const idResult = document.getElementById("id_result").textContent;
			const nicknameResult = document.getElementById("nickname_result").textContent;
			//비밀번호
			const passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
			//이메일
			const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
			//전화번호
			const phoneRegex = /^\d{11}$/;

			if (!passwordRegex.test(password)) {
				alert("비밀번호는 최소 8자리, 하나 이상의 문자, 하나 이상의 숫자, 하나 이상의 특수 문자가 필요합니다.");
				return false;
			}

			if (password !== password_confirm) {
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}

			if (idResult === "아이디가 중복됩니다.") {
				alert("아이디가 중복됩니다. 다른 아이디를 선택해주세요.");
				return false;
			}

			if (nicknameResult === "닉네임이 중복됩니다.") {
				alert("닉네임이 중복됩니다. 다른 닉네임을 선택해주세요.");
				return false;
			}

			if (!emailRegex.test(email)) {
				alert("이메일 형식이 올바르지 않습니다.");
				return false;
			}

			if (!phoneRegex.test(phone)) {
				alert("전화번호는 11자리의 숫자만 가능합니다.");
				return false;
			}
			
			return true;
		}
	</script>
<script defer type="text/javascript">
    document.getElementById("adminForm").addEventListener("submit", function(event) {
        event.preventDefault(); // 폼 제출 방지
        if (!validateForm()) { 
            // 유효성 검사에 실패한 경우
            return false; 
        }
        const formData = new FormData(this);

        // AJAX 요청
        fetch("/adminManageGo.do", {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert("관리자 등록이 성공적으로 완료되었습니다!");
                window.location.href = "adminManagement.do";
            } else {
                alert("회원가입 중 오류가 발생했습니다. 다시 시도해주세요.");
            }
        })
        .catch(error => {
            console.error("Error:", error);
            alert("서버와의 통신 중 오류가 발생했습니다. 다시 시도해주세요.");
        });
    });
</script>
</body>
</html>