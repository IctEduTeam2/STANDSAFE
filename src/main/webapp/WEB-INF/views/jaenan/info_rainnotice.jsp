<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>STANDSAFE</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<!-- Link Swiper's CSS -->

<link rel="stylesheet" href="resources/css/slide.css" />
<link rel="stylesheet" href="resources/css/basis.css" />
<link rel="stylesheet" href="resources/css/weather.css" />
<style type="text/css">
#step1, #step2, #step3, #dateInput {
	width: 250px; /* 원하는 너비로 조정 */
	padding: 10px; /* 내부 여백 설정 */
	font-size: 16px; /* 폰트 크기 설정 */
	border: 1px solid #ccc; /* 테두리 스타일 지정 */
}

.go_btn {
	background-color: #1b5ac2; /* 파란색 배경 색상 */
	color: #fff; /* 텍스트 색상 */
	font-size: 16px; /* 폰트 크기 설정 */
	padding: 5px 20px; /* 내부 여백 설정 (상하 10px, 좌우 20px) */
	border: none; /* 테두리 제거 */
	cursor: pointer;
	height: 40px;
}

#w_noti {
	color: red;
	font-size: 14px;
	font-weight: bold;
}

#weather_div {
	display: flex;
	flex-direction: column;
	align-items: left; /* 세로 중앙 정렬 유지 */
	gap: 20px;
}

.weather-categories-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: center; /* 수평 중앙 정렬 */
}

.weather-category {
	flex: 1;
	min-width: 120px;
	background-color: #1b5ac2;
	padding: 10px;
	color: white;
	border-radius: 10px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	margin-right: 20px; /* 각 카테고리 사이에 간격 추가 */
}

.weather-category:last-child {
	margin-right: 0; /* 마지막 요소의 간격 제거 */
}

.weather-category h4 {
	font-weight: bold;
	margin-bottom: 10px;
}

.weather-category ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.weather-category li {
	font-size: 14px;
	margin-bottom: 5px;
}

.front {
	float: left;
	margin: 30px 30px; padding : 20px;
	border: 1px solid #ccc;
	border-radius: 10px;
	background-color: #fff;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	width: 600px;
	padding: 20px;
}

.front h3 {
	font-size: 18px;
	margin-bottom: 10px;
}
/* 마우스 오버 시 배경색과 글씨색 변경 */
.weather-category:hover {
    background-color: white; /* 흰색 배경색 */
    color: #1b5ac2; /* 파란색 글씨색 */
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	function selectArea() {
		var selectStep1 = document.getElementById("step1").value;
		var selectStep2 = document.getElementById("step2");
		var selectStep3 = document.getElementById("step3");

		// Step 1 변경 시, Step 2와 Step 3 초기화
		selectStep2.innerHTML = "";
		selectStep2.innerHTML = "<option value=''>시/도를 선택하세요</option>";
		selectStep3.innerHTML = "";
		selectStep3.innerHTML = "<option value=''>읍/면/동을 선택하세요</option>";

		if (selectStep1 !== "") {
			$.ajax({
				url : "/get_areacity.do?selectStep1=" + selectStep1,
				method : "post",
				dataType : "text",
				async : false,
				success : function(data) {
					console.log(data);
					selectStep2.innerHTML = "";
					selectStep2.innerHTML = data;
				},
				error : function() {
					alert("읽기 실패");
				}
			});
		}
	}

	function selectcounty() {
		var selectStep2 = document.getElementById("step2").value;
		var selectStep3 = document.getElementById("step3");

		// Step 2 변경 시, Step 3 초기화
		selectStep3.innerHTML = "";
		selectStep3.innerHTML = "<option value=''>읍/면/동을 선택하세요</option>";

		if (selectStep2 !== "") {
			$.ajax({
				url : "/get_areacity.do?selectStep2=" + selectStep2,
				method : "post",
				dataType : "text",
				async : false,
				success : function(data) {
					console.log(data);
					selectStep3.innerHTML = "";
					selectStep3.innerHTML = data;
				},
				error : function() {
					alert("읽기 실패");
				}
			});
		}
	}
</script>
<script type="text/javascript">
	function getWeatherList(f) {
		f.action = "/jaenan_rainlist.do"
		f.submit();
	}
</script>
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents">
			<div class="top_header">
				<h1>■ 재난 정보</h1>
				<br>
				<p id="small_news">한줄뉴스처럼 재난문자 뜨게할것(?)</p>
			</div>

			<div class="top_btns">
				<button onclick="location.href='/jaenan_fire.do'" class="top_btn">화재</button>
				<button onclick="location.href='/jaenan_jijinlive.do'"
					class="top_btn">지진</button>
				<button onclick="location.href='/jaenan_rainlive.do'"
					class="top_btn" style="background-color: #1b5ac2">강수</button>
			</div>
			<hr id="hr1">
			<div class="top_tab">
				<a href="/jaenan_rainlive.do">실시간 날씨 </a> | <a
					href="/jaenan_rainnotice.do"
					style="color: #1b5ac2; font-weight: bold">홍수예보 발령자료</a>

			</div>
			<div class="top_location">
				<p style="display: inline-block;">지역 조회</p>
				<input type="text" id="search" name="search" placeholder="지역을 입력하세요">
				<input type="button" value="검색" class="s_btn" />
			</div>
			<hr id="hr2">
			<h3 style="text-align: left">■ 홍수발생현황</h3>
			<br>
			<br>
			<div>
				<p id="w_noti">날씨는 현재시간기준으로 6시간 이내의 날씨정보만 조회됩니다.</p>
				<br> <br>
			</div>

			<form class="form-horizontal" method="post">
				<!-- <form class="form-horizontal" > -->
				<div class="form-group">
					<select id="step1" name="citys" class="citys" title="시/도"
						onchange="selectArea()">
						<option id="city" value="">시/도</option>
						<option value="서울특별시">서울특별시</option>
						<option value="부산광역시">부산광역시</option>
						<option value="대구광역시">대구광역시</option>
						<option value="인천광역시">인천광역시</option>
						<option value="광주광역시">광주광역시</option>
						<option value="대전광역시">대전광역시</option>
						<option value="울산광역시">울산광역시</option>
						<option value="세종특별자치시">세종특별자치시</option>
						<option value="경기도">경기도</option>
						<option value="충청북도">충청북도</option>
						<option value="충청남도">충청남도</option>
						<option value="전라북도">전라북도</option>
						<option value="전라남도">전라남도</option>
						<option value="전라북도">전라북도</option>
						<option value="경상북도">경상북도</option>
						<option value="경상남도">경상남도</option>
						<option value="제주특별자치도">제주특별자치도</option>
						<option value="강원특별자치도">강원특별자치도</option>
					</select> <select id="step2" name="counties" class="counties"
						onchange="selectcounty()">
						<option id="county" value="">시/도 를 선택하세요</option>

					</select> <select id="step3" name="town">
						<option id="town" value="">시/군/구 를 선택하세요</option>
					</select> <label for="dateInput">현재 날짜 및 시간</label> <input type="text"
						id="dateInput" name="dateInput" readonly>
					<button type="submit" class="go_btn" id="search_btn"
						onclick="getWeatherList(this.form)">
						<!-- <button type="button" class="go_btn" onclick="getWeather()"> -->
						<span>검색</span>
					</button>

				</div>
			</form>
			<div id="weather_div">
				<div class="front">
					<c:choose>
						<c:when test="${empty list }">
							<h3>원하는 날씨지역을 클릭후 검색하세요.</h3>
							<p style="color: gray; margin-top: 10px;">서비스 가능지역에 따라 정보 제공이
								안될 수도 있습니다.</p>
						</c:when>
						<c:otherwise>
							<h3>${ citys}${counties }${ town} 의 날씨입니다.</h3>
							<h4>${dateInput }기준으로조회했습니다</h4>
							<p style="color: gray; margin-top: 10px;"">※조회 시간은 매시간 30분이며,
								${front_time }으로 조회했습니다</p>
						</c:otherwise>
					</c:choose>

				</div>

				<!-- 각 카테고리별로 데이터를 감싸는 div 추가 -->
				<div class="weather-categories-container">
					<div class="weather-category DATE">
						<h4>예보날짜</h4>
						<ul>
							<c:forEach var="k" items="${list }">
								<c:if test="${k.category eq 'SKY' }">

									<li>${k.fcstValue}</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
					<div class="weather-category TIME">
						<h4>예보시간</h4>
						<ul>
							<c:forEach var="k" items="${list }">
								<c:if test="${k.category eq 'SKY' }">
									<li>${k.fcstDate}</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
					<div class="weather-category SKY">
						<h4>하늘상태</h4>
						<ul>
							<c:forEach var="k" items="${list}">
								<c:if test="${k.category eq 'SKY'}">
									<c:set var="skyText" value="" />
									<c:choose>
										<c:when test="${k.fcstTime eq '1'}">
											<c:set var="skyText" value="맑음" />
										</c:when>
										<c:when test="${k.fcstTime eq '3'}">
											<c:set var="skyText" value="구름많음" />
										</c:when>
										<c:when test="${k.fcstTime eq '4'}">
											<c:set var="skyText" value="흐림" />
										</c:when>
									</c:choose>
									<li>${skyText}</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>

					<div class="weather-category T1H">
						<h4>기온</h4>
						<ul>
							<c:forEach var="k" items="${list }">
								<c:if test="${k.category eq 'TMP' }">
									<li>${k.fcstTime}˚C</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
						<div class="weather-category POP">
						<h4>강수확률</h4>
						<ul>
							<c:forEach var="k" items="${list }">
								<c:if test="${k.category eq 'POP' }">
									<li>${k.fcstTime} %</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
					<div class="weather-category RN1">
						<h4>1시간 강수량</h4>
						<ul>
							<c:forEach var="k" items="${list }">
								<c:if test="${k.category eq 'PCP' }">
									<li>${k.fcstTime}(mm)</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
					<div class="weather-category PTY">
						<h4>강수형태</h4>
						<ul>
							<c:forEach var="k" items="${list}">
								<c:if test="${k.category eq 'PTY'}">
									<c:set var="ptyText" value="" />
									<c:choose>
										<c:when test="${k.fcstTime eq '0'}">
											<c:set var="ptyText" value="해당없음" />
										</c:when>
										<c:when test="${k.fcstTime eq '1'}">
											<c:set var="ptyText" value="비" />
										</c:when>
										<c:when test="${k.fcstTime eq '2'}">
											<c:set var="ptyText" value="비/눈" />
										</c:when>
										<c:when test="${k.fcstTime eq '3'}">
											<c:set var="ptyText" value="눈" />
										</c:when>
										<c:when test="${k.fcstTime eq '5'}">
											<c:set var="ptyText" value="빗방울" />
										</c:when>
										<c:when test="${k.fcstTime eq '6'}">
											<c:set var="ptyText" value="빗방울날림" />
										</c:when>
										<c:when test="${k.fcstTime eq '7'}">
											<c:set var="ptyText" value="눈날림" />
										</c:when>
									</c:choose>
									<li>${ptyText}</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
					<div class="weather-category REH">
						<h4>습도</h4>
						<ul>
							<c:forEach var="k" items="${list }">
								<c:if test="${k.category eq 'REH' }">
									<li>${k.fcstTime}%</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
					<div class="weather-category UUU">
						<h4>동서바람성분</h4>
						<ul>
							<c:forEach var="k" items="${list }">
								<c:if test="${k.category eq 'UUU' }">
									<li>${k.fcstTime}m/s</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
					<div class="weather-category VVV">
						<h4>남북바람성분</h4>
						<ul>
							<c:forEach var="k" items="${list }">
								<c:if test="${k.category eq 'VVV' }">
									<li>${k.fcstTime}m/s</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				
					<div class="weather-category SNO">
						<h4>산적설</h4>
						<ul>
							<c:forEach var="k" items="${list }">
								<c:if test="${k.category eq 'SNO' }">
									<li>${k.fcstTime} (mm)</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
					<div class="weather-category WSD">
						<h4>풍속</h4>
						<ul>
							<c:forEach var="k" items="${list }">
								<c:if test="${k.category eq 'WSD' }">
									<li>${k.fcstTime}m/s</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
					<div class="weather-category VEC">
						<h4>풍향</h4>
						<ul>
							<c:forEach var="k" items="${list }">
								<c:if test="${k.category eq 'VEC' }">
									<li>${k.fcstTime} deg</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
					<div class="weather-category WAV">
						<h4>파고</h4>
						<ul>
							<c:forEach var="k" items="${list }">
								<c:if test="${k.category eq 'WAV' }">
									<li>${k.fcstTime} M</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>



		</section>
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
	<script>
		// 현재 날짜와 시간을 가져오는 함수
		function getCurrentDateTime() {
			const today = new Date();
			const yyyy = today.getFullYear();
			let mm = today.getMonth() + 1;
			let dd = today.getDate();
			let hh = today.getHours();
			let min = today.getMinutes();

			// 월, 일, 시간, 분을 두 자리 숫자로 만듭니다.
			mm = mm < 10 ? '0' + mm : mm;
			dd = dd < 10 ? '0' + dd : dd;
			hh = hh < 10 ? '0' + hh : hh;
			min = min < 10 ? '0' + min : min;

			return yyyy + '-' + mm + '-' + dd + ' ' + hh + ':' + min; // YYYY-MM-DD HH:MM 형식으로 반환
		}

		// input 요소를 가져옵니다.
		const dateInput = document.getElementById("dateInput");

		// 현재 날짜 및 시간을 설정하고 수정할 수 없게 만듭니다.
		dateInput.value = getCurrentDateTime();
		dateInput.setAttribute("readonly", "readonly");
	</script>
</body>
</html>