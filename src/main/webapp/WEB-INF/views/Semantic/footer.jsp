<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Company Footer</title>
<style>
.footer-container {
	display: flex;
	border-top: 1px solid #000;
	padding: 20px;
}

.footer-left {
	flex: 6;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	border-right: 2px solid #000;
}

.footer-right {
	flex: 4;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: space-between;
}

h1 {
	font-size: 32px;
	margin: 0;
}
.l-top{
	margin-bottom: 20px; 
}
.l-bottom{
	margin-top: 20px; 
}
.l-top a {
	text-decoration: none; /* 밑줄 제거 */
	color: inherit;        /* 부모 요소의 텍스트 색상 상속 */
}

.l-top a:hover {
	color: blue;
}
#footer{
background-color: white;
height: 250px;
}
</style>
</head>
<body>
	<footer id="footer">
		<div class="footer-container">
			<div class="footer-left">
				<div class="l-top"><a href="/">HOME</a>/ <a href="/team.do">TEAM</a> / <a href="/privacypolicy.do">개인정보처리방침</a></div>
				<div class="l-middle">
					상호: (주)STANDSAFE / 대표 : 김OO / 대표전화 : 02-123-4567 / 관리자 메일 : standsafe@gmail.com 
					<br> 주소: 마포구 백범로 3층 케이터틀 3층 / 2호선 신촌역 6번출구 도보 150m 
					<br> 법인사업자등록번호 : 000-00-00000 <br> 통신판매업 신고 : 제 0000-서울마포-0000호 
				</div>
				<div class="l-bottom">택배 교환, 반품착불주소 : 04108 마포구 백범로 3층 (케이터틀 3층)
				<br>COPYRIGHT(C) (주)STANDSAFE 모든 권리 보유.</div>
			</div>

			<div class="footer-right">
				<div>CUSTOMER CENTER</div>
				<div>
					<h1 style="color: darkred;">1544.1234</h1>
				</div>
				<div>
					MON-FRI AM 10:00~PM 5:00 <br> LUNCH PM 1:00~PM 2:00 <br>
					WEEKEND / HOLIDAY OFF
				</div>
			</div>
		</div>
	</footer>
</body>
</html>