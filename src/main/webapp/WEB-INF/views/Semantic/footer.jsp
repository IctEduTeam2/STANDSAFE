<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Company Footer</title>
<style>
.loading-overlay {
	display: none; /* 기본적으로 숨깁니다. */
	position: fixed; /* 화면에 고정합니다. */
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(255, 255, 255, 0.7); /* 반투명한 흰색 배경 */
	z-index: 1000; /* 다른 요소 위에 표시됩니다. */
}

.loading-gif {
	position: absolute; /* overlay 내에서 중앙에 위치시키기 위해 절대 위치를 사용합니다. */
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%); /* 중앙 정렬을 위한 트릭 */
}

.footer-container {
	display: flex;
	border-top: 1px solid #D1D1D1;
	padding: 20px;
}

.footer-left {
	flex: 6;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	border-right: 1px solid #D1D1D1;
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

.l-top {
	margin-bottom: 20px;
}

.l-bottom {
	margin-top: 20px;
}

.l-top a {
	text-decoration: 1px solid #000; /* 밑줄 제거 */
	color: inherit; /* 부모 요소의 텍스트 색상 상속 */
}

.l-top a:hover {
	color: blue;
}

#footer {
	height: 250px;
	/*box-shadow: 0 -5px 15px rgba(135, 142, 195, 0.1);*/
}
</style>

</head>
<body>
		<!-- 로딩 오버레이 -->
		<div id="loadingOverlay"
			style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(255, 255, 255, 0.7); z-index: 9999;">
			<div class="loader"
				style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
				<img src="resources\images\Sunny.gif" alt="Loading..."
					class="loading-gif" style="transform: scale(3);">
			</div>
		</div>
	<footer id="footer">
		<div class="footer-container">
			<div class="footer-left">
				<div class="l-top">
					<a href="/">HOME</a>/ <a href="/team.do">TEAM</a> / <a
						href="/privacypolicy.do">개인정보처리방침</a>
				</div>
				<div class="l-middle">
					상호: (주)STANDSAFE / 대표 : 김OO / 대표전화 : 02-123-4567 / 관리자 메일 :
					standsafe@gmail.com <br> 주소: 마포구 백범로 3층 케이터틀 3층 / 2호선 신촌역 6번출구
					도보 150m <br> 법인사업자등록번호 : 000-00-00000 <br> 통신판매업 신고 : 제
					0000-서울마포-0000호
				</div>
				<div class="l-bottom">
					택배 교환, 반품착불주소 : 04108 마포구 백범로 3층 (케이터틀 3층) <br>COPYRIGHT&#169;
					(주)STANDSAFE 모든 권리 보유.
				</div>
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
		<script type="text/javascript">
			// 로딩 중일 때 overlay를 표시합니다.
			function showLoading() {
				document.getElementById('loadingOverlay').style.display = 'block';
			}

			// 로딩이 완료되면 overlay를 숨깁니다.
			function hideLoading() {
				document.getElementById('loadingOverlay').style.display = 'none';
			}
		</script>
		</div>
	</footer>
</body>
</html>