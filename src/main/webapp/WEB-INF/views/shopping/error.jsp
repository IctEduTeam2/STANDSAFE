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
<link rel="stylesheet" href="resources/css/basis.css" />
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<section id="contents" style="border: 0px solid black;">
			<div style="width: 55%; margin: auto; padding-top: 100px;">
				<a href="/mainform.do"><img src="resources/images/logo.png"
					style="width: 200px;"></a>
			</div>
			<div
				style="border: 1px solid black; width: 55%; margin: auto; height: 250px; padding-top: 20px;">
				<div style="float: left; margin-right: 100px; margin-left: 60px;">
					<img src="resources/images/error_message.png">
				</div>
				<div style="float: left;">
					<br>
					<h1 style="font-size: 32px;">죄송합니다.</h1>
					<br>
					<p style="font-size: 16px; font-weight: 600;">
						요청하신 페이지에서 일시적인 에러가 발생하였습니다.<br>
						<br> 동일한 문제가 지속적으로 발생할 경우 관리자(1577-1111)에게 문의해주길 바랍니다.<br>
						<br> (에러코드: 404)
					</p>
				</div>
			</div>
			<div style="width: 122px; margin: auto; margin-top: 30px;">
				<a href="/mainform.do"
					style="padding: 20px 40px; background-color: rgba(27, 90, 194, 0.8); color: white; border: 0; border-radius: 5px;">홈으로</a>
			</div>
		</section>
	</div>
</body>
</html>

