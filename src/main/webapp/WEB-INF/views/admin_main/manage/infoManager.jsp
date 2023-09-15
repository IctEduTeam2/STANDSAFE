<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ict.admin.model.vo.AdminVO"%>
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

				<form action="user_userfixok.do" method="POST" id="userForm">
					<table style="margin: auto;">
						<tr>
							<td>관리자 아이디</td>
							<td><a type="text" id="ADMIN_ID" name="ADMIN_ID"
								style="color: grey;">${adVO.ADMIN_ID }</a><input type="hidden"
								name="ADMIN_ID" value="${sessionScope.adVO.ADMIN_ID}"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" id="password" name="ADMIN_PW"
								placeholder="새 비밀번호" maxlength="18" onkeyup="validatePassword()"
								autocomplete="current-password"> <span
								id="password_result"></span></td>
						</tr>
						<tr>
							<td>별명<span class="required">*</span></td>
							<td><input type="text" id="ADMIN_NICK" name="ADMIN_NICK"
								placeholder="내용 입력" value="${adVO.ADMIN_NICK}">
								<button type="button" onclick="checkAdminNickDuplicate()">중복
									검사</button> <span id="nickname_result"></span></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><a type="text" id="ADMIN_NAME" name="ADMIN_NAME"
								style="color: grey;">${adVO.ADMIN_NAME}</a></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><input type="date" id="ADMIN_BIRTH" name="ADMIN_BIRTH"
								value="${adVO.ADMIN_BIRTH}"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" id="ADMIN_PHONE" name="ADMIN_PHONE"
								placeholder="'-'없이 작성하세요" maxlength="11"
								onkeyup="validatePhone()" value="${adVO.ADMIN_PHONE}"> <span
								id="phone_result"></span></td>
						</tr>
						<tr>
							<td>이메일<span class="required">*</span></td>
							<td><input type="text" id="ADMIN_MAIL" name="ADMIN_MAIL"
								placeholder="email@standsafe.com" value="${adVO.ADMIN_MAIL}"
								onkeyup="checkEmail()"> <span id="email_result"></span></td>
						</tr>
						<tr>
							<td>주소</td>
							
							<td><input type="text" name="postcode" id="postcode"
								placeholder="우편번호" value="${parts.length > 0 ? parts[0] : ''}"
								readonly> <input type="button"
								onclick="execDaumPostcode()" value="우편번호 찾기"><br> <input
								type="text" name="address" id="address" placeholder="주소"
								value="${parts.length > 1 ? parts[1] : ''}" readonly> <input
								type="text" name="extraAddress" id="extraAddress"
								placeholder="참고주소" value="${parts.length > 2 ? parts[2] : ''}"
								readonly> <input type="text" name="detailAddress"
								id="detailAddress" placeholder="상세주소"
								value="${parts.length > 3 ? parts[3] : ''}"> <span
								id="guide" style="color: #999; display: none"></span> <input
								type="hidden" id="ADMIN_ADDR" name="ADMIN_ADDR"
								value="${adVO.ADMIN_ADDR}"></td>
						</tr>
					</table>
					<div style="width: 100%; text-align: center;">
						<button type="submit" class="save-button"
							onclick="return prepareAndSubmit()">수정</button>
						<button class="cancel-button" onclick="user_infoFixCancel(event)">나가기</button>
					</div>
				</form>
			</article>
		</section>
		<jsp:include page="../../Semantic/footer.jsp"></jsp:include>
	</div>
	<script defer type="text/javascript">
	//비밀번호 유효성 검사
		function validatePassword() {
			const password = document.getElementById("password").value;
			const resultSpan = document.getElementById("password_result");
			
			// 새 비밀번호 필드가 비어 있는 경우 검사를 수행하지 않음
		    if (password === "") {
		        resultSpan.textContent = ""; // 결과 메시지 초기화
		        return true; // 검사를 수행하지 않으므로 항상 true 반환
		    }
			
			const passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$/;

			if (!passwordRegex.test(password)) {
				resultSpan.textContent = "비밀번호는 최소 8자리, 하나 이상의 문자, 하나 이상의 숫자, 하나 이상의 특수 문자가 필요합니다.";
				resultSpan.style.color = "red";
				console.log("비밀번호 검증 실패");
				return false;
			} else {
				resultSpan.textContent = "유효한 비밀번호입니다.";
				resultSpan.style.color = "green";
				console.log("비밀번호 검증 성공");
				return true;
			}
		}
		// 별명 유효성 검사
	function checkNickDuplicate() {
    return new Promise((resolve, reject) => {
        const nickname = document.getElementById("ADMIN_NICK").value;
        const resultSpan = document.getElementById("nickname_result");

        // 별명이 빈 문자열인 경우
        if (nickname.trim() === '') {
            resultSpan.textContent = "별명을 입력해주세요.";
            resultSpan.style.color = "red";
            resolve(false);
            console.log("별명을 입력");
            return;
        }

        $.ajax({
            url: "/checkAdminNickDuplicate.do",
            type: "POST",
            data: {
                'ADMIN_NICK': nickname
            },
            success: function(result) {
                if (result === "not_duplicate") {
                    resultSpan.textContent = "사용 가능한 닉네임입니다.";
                    resultSpan.style.color = "green";
                    console.log("닉네임 검증 성공");
                    resolve(true);
                } else {
                    resultSpan.textContent = "닉네임이 중복됩니다.";
                    resultSpan.style.color = "red";
                    console.log("닉네임이 중복");
                    resolve(false);
                }
            },
            error: function(xhr, status, error) {
                resultSpan.textContent = "서버 에러, 다시 시도해 주세요.";
                resultSpan.style.color = "red";
                console.log("닉네임서버 에러");
                reject(false);
                
            }
        });
    });
}
	//전화번호 유효성 검사
	function validatePhone() {
		const phone = document.getElementById("ADMIN_PHONE").value;
		const resultSpan = document.getElementById("phone_result");
		const phoneRegex = /^\d{11}$/;

		if (phone.length === 0) {
			resultSpan.textContent = "전화번호가 누락되었습니다.";
			resultSpan.style.color = "red";
			console.log("전화번호가 누락");
			return false;
		} else if (isNaN(phone)) {
			resultSpan.textContent = "전화번호는 숫자만 입력 가능합니다.";
			resultSpan.style.color = "red";
			console.log("전화번호는 숫자만 입력");
			return false;
		} else if (!phoneRegex.test(phone)) {
			resultSpan.textContent = "전화번호는 11자리의 숫자만 가능합니다.";
			resultSpan.style.color = "red";
			console.log("전화번호는 11자리의 숫자");
			return false;
		} else {
			resultSpan.textContent = "유효한 전화번호입니다.";
			resultSpan.style.color = "green";
			console.log("비밀번호 검증 성공");
			return true;
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
			console.log("이메일이 누락");
			return false;
		} else if (!emailRegex.test(email)) {
			resultSpan.textContent = "이메일 형식이 올바르지 않습니다.";
			resultSpan.style.color = "red";
			console.log("이메일 형식 실패");
			return false;
		} else {
			resultSpan.textContent = "유효한 이메일 형식입니다.";
			resultSpan.style.color = "green";
			console.log("비밀번호 검증 성공");
			return true;
		}
	}
</script>
	<script type="text/javascript">
	//다음 주소
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
	//addr 추합
	// 주소를 적절하게 조합하는 함수
function prepareAddr() {
    var postcode = document.getElementById("postcode").value;
    var address = document.getElementById("address").value;
    var extraAddress = document.getElementById("extraAddress").value;
    var detailAddress = document.getElementById("detailAddress").value;

    var fullAddressParts = [];

    if (postcode && postcode.trim() !== "") {
        fullAddressParts.push("(" + postcode.trim() + ")");
    }
    if (address && address.trim() !== "") {
        fullAddressParts.push(address.trim());
    }
    if (extraAddress && extraAddress.trim() !== "") {
        fullAddressParts.push(extraAddress.trim());
    }
    if (detailAddress && detailAddress.trim() !== "") {
        fullAddressParts.push(detailAddress.trim());
    }

    // 배열의 요소들을 쉼표로 연결하여 문자열로 변환
    var fullAddress = fullAddressParts.join(", ");

    console.log("Full Address:", fullAddress);
    document.getElementById("ADMIN_ADDR").value = fullAddress.trim();
}
</script>
	<script type="text/javascript">
//페이지 로드 시 주소 분할 및 할당 코드
document.addEventListener("DOMContentLoaded", function() {
    var fullAddress = "${sessionScope.adVO.ADMIN_ADDR}";
    var addressParts = fullAddress.split(", ");

    if (addressParts[0] && addressParts[0].trim() !== "") {
        // 괄호만 제거합니다.
        var postcode = addressParts[0].replace(/[()]/g, '').trim();
        document.getElementById("postcode").value = postcode;
    }
    if (addressParts[1] && addressParts[1].trim() !== "") {
        document.getElementById("address").value = addressParts[1].trim();
    }
    if (addressParts[2] && addressParts[2].trim() !== "") {
        document.getElementById("extraAddress").value = addressParts[2].trim();
    }
    if (addressParts[3] && addressParts[3].trim() !== "") {
        document.getElementById("detailAddress").value = addressParts[3].trim();
    }
});
</script>
	<script type="text/javascript">
	function user_infoFixCancel(event) {
		event.preventDefault();
		location.href = "userInfoFixCancel.do";
	}
	</script>
	<script type="text/javascript">
	function validateAll() {
		console.log("validateAll 도착");
		if (validateNickname() && validatePhone()
			&& validatePassword() && checkEmail() 
			&& validateEmail() && validateEmailSt()) {
			console.log("수정완료");
			return true;
		}
		console.log("수정실패");
		return false;
	}
</script>
	<script type="text/javascript">
function prepareAndSubmit() {
	prepareAddr(); 
	
    const fields = ["password", "birth" ,"nickname", "phone", "email", "addr"]; // 여기에 모든 필드 이름을 추가하세요.

	
    fields.forEach(field => {
        const viewElement = document.getElementById(field + "View");
        const editElement = document.getElementById(field + "Edit");
        let passwordField = document.getElementById("password");
     // 원래의 비밀번호 값을 해당 필드에 채웁니다.
        if (actualPassword) {
        document.getElementById("password").value = actualPassword;
    }
     
        if (editElement.style.display === "none") {
            // 편집 중이 아닌 경우, span에서 값을 가져와 input에 설정합니다.
            const inputField = editElement.querySelector('input');
            inputField.value = viewElement.innerText;
            return true;
        }
    });

    // 이제 폼을 제출합니다.
    document.getElementById("userForm").submit();
}
</script>
</body>
</html>