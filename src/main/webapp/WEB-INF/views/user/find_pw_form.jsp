<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>STANDSAFE</title>
<!-- <meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" /> -->
<!-- Link Swiper's CSS -->

<link rel="stylesheet" href="resources/css/slide.css" />
<link rel="stylesheet" href="resources/css/basis.css" />
<link rel="stylesheet" href="resources/css/userlogin.css" />

<script type="text/javascript">
	function member_login() {
		location.href = "admin_loginok.do";
	}
</script>
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents">
		<article>
				<div class="find-header">
					<h1 style="text-align: center; font-size: 30px; margin-bottom: 20px; margin-top: 100px;">비밀번호 찾기</h1>
				</div>
				<h3>비밀번호를 모르시나요?</h3>
				<p>내 정보에 등록된 이메일로 찾기</p>
				<div class="find-box">
					<p>입력한 이메일로 임시 비밀번호가 전송됩니다.</p>
					<br>
					<form action="/find_pw_result" method="post">
							<tr>
								<td><input type="text" name="ID"
									placeholder="아이디를 입력해주세요."></td>
							</tr>
							<tr>
								<td><input type="text" name="MAIL"
									placeholder="이메일을 전부 입력해주세요."></td>
							</tr>
							<tr>
								<td><button type="submit" class="find-button">이메일 보내기</button></td>
							</tr>
						</form>
				</div>
				<div>
					아이디를 찾으시나요? <a href="find_id_form.do" class="find-links"><p>아이디 찾기</p></a>
				</div>
				<br>
			</article>
		</section>
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
		<script type="text/javascript">
    function sendTemporaryPassword() {
        const userName = document.getElementsByName("ID")[0].value;
        const userEmail = document.getElementsByName("MAIL")[0].value;
        $.ajax({
            type: 'post',
            url: '/email_send.do',
            data: {
                'ID': userId,
                'MAIL': userMail
            },
            dataType: 'json',
            success: function(response) {
                if (response.success) {
                    alert('임시비밀번호를 전송 했습니다.');
                } else {
                    alert('가입되지 않은 이메일입니다.');
                }
            },
            error: function() {
                alert('서버 오류가 발생했습니다.');
            }
        });
    }
</script>
</body>
</html>