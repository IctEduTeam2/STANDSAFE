<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.io.StringReader"%>
<%@ page import="javax.xml.parsers.DocumentBuilder"%>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@ page import="org.w3c.dom.Document"%>
<%@ page import="org.w3c.dom.Element"%>
<%@ page import="org.w3c.dom.Node"%>
<%@ page import="org.w3c.dom.NodeList"%>
<%@ page import="org.xml.sax.InputSource"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>STANDSAFE</title>
<!-- <meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" /> -->
<!-- Link Swiper's CSS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/slide.css" />
<link rel="stylesheet" href="resources/css/basis.css" />

<style type="text/css">
.mapButton {
	background-color: blue;
	color: white;
	padding: 10px 15px;
	border: none;
	cursor: pointer;
	position: absolute; /* 절대 위치 설정 */
	right: 0; /* 오른쪽 끝으로 이동 */
	top: 50%; /* 수직 중앙으로 이동 */
	transform: translateY(-50%); /* 수직 중앙 정렬 보정 */
}

.mapButton:hover {
	background-color: darkblue;
}

/* 지진 데이터 <li> 항목의 위치 설정 */
ul .earthquakeItem {
	position: relative;
	padding-right: 120px; /* 버튼을 위한 오른쪽 여백 추가 */
}

.menu {
	margin-bottom: 50px;
}

#small_news {
	background-color: black;
	color: yellow;
}

.content-wrapper {
	display: flex;
	justify-content: space-between;
}

#map {
	width: 70%; /* 지도의 너비를 조정하세요. */
	height: 500px;
}

.earthquake-list {
	width: 25%; /* 지진 정보 리스트의 너비를 조정하세요. */
	padding: 20px;
	background-color: #f5f5f5;
	border: 1px solid #ddd;
	margin-left: 20px;
}

.earthquake-list h2 {
	font-size: 18px;
	margin-bottom: 10px;
}

.earthquake-list ul {
	list-style-type: none;
	padding-left: 0;
}

.earthquake-list li {
	padding: 5px 0;
}

.top_btn {
	margin-top: 20px;
	width: 130px;
	height: 50px;
	font-size: 16px;
	background-color: gray;
	color: white;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
}

.top_btn:hover {
	background-color: #1b5ac2;
	color: white;
}

.top_btn:active {
	background-color: #1b5ac2;
	color: white;
}

#hr1 {
	width: 100%;
	border: 0px;
	height: 4px;
	background: gray;
	margin-top: 50px;
}

#hr2 {
	width: 100%;
	border: 0px;
	height: 4px;
	background: black;
	margin-top: 30px;
}

.top_tab {
	margin-top: 20px;
	border: 1px solid black;
	padding: 10px;
	text-align: left;
}

#date {
	margin-left: 30px;
	width: 130px;
	height: 50px;
}

.top_date {
	margin-top: 20px;
	float: right;
	margin-bottom: 30px;
}

.table {
	text-align: center;
	width: 100%;
	height: auto;
	border-top: 1px solid #444;
	border-collapse: collpas;
	margin-left: auto;
	margin-right: auto;
}

.table td {
	border-bottom: 1px dashed #444;
	padding: 10px;
	height: 30px;
}

.h_table th {
	border-bottom: 1px solid #444;
	padding: 10px;
}

.b_table td {
	border-bottom: 1px dashed #444;
	padding: 10px;
	height: 30px;
}

.map_btn {
	width: 50px;
	height: 100%;
	border: 0px;
	background: #1b5ac2;
	outline: none;
	color: #ffffff;
}

.s_btn {
	height: 50px;
	background-color: #1b5ac2;
	color: #ffffff;
	border: 0px;
	width: 60px;
}

#liveTime {
	font-size: 24px; /* 글자 크기를 24px로 설정합니다. 원하는 대로 조절할 수 있습니다. */
	color: yellow; /* 글자 색상을 노란색으로 설정합니다. */
	background-color: black; /* 배경 색상을 검은색으로 설정합니다. */
	padding: 5px; /* 패딩을 추가하여 글자와 배경 사이에 약간의 공간을 만듭니다. */
}
</style>
</head>
<body onload="initMap(); InitializeStaticMenu();">
	<script>
  function initMap() {
    const map = new google.maps.Map(document.getElementById("map"), {
      center: { lat: 37.5665, lng: 126.9780 }, // 대한민국 중앙 좌표로 설정
      zoom: 6.7,
    });

    // Ajax 요청을 통해 서버에서 데이터를 가져옵니다.
    fetch("/getEarthquakeData.do") // 서버의 데이터 엔드포인트 경로를 지정해야 합니다.
      .then((response) => response.json())
      .then((data) => {
        // 데이터를 반복하여 마커를 추가합니다.
        data.forEach((earthquake) => {
          const latLng = { lat: parseFloat(earthquake.lat), lng: parseFloat(earthquake.lon) };
          new google.maps.Marker({
            position: latLng,
            map: map,
            title: earthquake.loc,
          });
        });
      })
      .catch((error) => {
        console.error("Error fetching data:", error);
      });
  }
</script>


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
					class="top_btn" style="background-color: #1b5ac2">지진</button>
				<button onclick="location.href='/jaenan_rainlive.do'"
					class="top_btn">강수</button>
			</div>
			<hr id="hr1">

			<div class="top_tab">
				<a href="/jaenan_jijinlive.do"
					style="color: #1b5ac2; font-weight: bold;">실시간 지진상황 </a> | <a
					href="/jaenan_jijin.do">국내지진 규모 4.0이상 기록</a>
			</div>
			<hr id="hr2">
			<div class="content-wrapper">
				<div id="map" style="height: 800px; width: 75%;"></div>
				<!-- 지진 정보 리스트 -->
				<div class="earthquake-list">
					<p id="liveTime"></p>
					<br>
					<h2>최근 3일간 지진 정보</h2>
					<%
					List<Map<String, String>> earthquakeList = (List<Map<String, String>>) request.getAttribute("earthquakeList");
					if (earthquakeList == null || earthquakeList.isEmpty()) {
					%>
					<p>3일간 지진이 발생하지 않았습니다.</p>
					<%
					} else {
					%>
					<ul>
						<%
						for (Map<String, String> earthquake : earthquakeList) {
						%>
						<li class="earthquakeItem">발표시각: <%=earthquake.get("tmFc")%>,
							<br> 진앙시: <%=earthquake.get("tmEqk")%>, <br> 위치: <%=earthquake.get("loc")%>,
							<br> <%=earthquake.get("rem")%>, <br> 진도: <%=earthquake.get("dep")%>
							<br> <!-- 버튼 추가 -->
							<button class="mapButton"
								onclick="showImagePopup('<%=earthquake.get("img")%>')">지도
								보기</button>

						</li>
						<%
						}
						%>
					</ul>
					<%
					}
					%>
				</div>
			</div>
		</section>
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
	<script>
    function updateLiveTime() {
        var now = new Date();
        var timeString = now.getHours().toString().padStart(2, '0') + ':' +
                         now.getMinutes().toString().padStart(2, '0') + ':' +
                         now.getSeconds().toString().padStart(2, '0');
        document.getElementById('liveTime').innerText = timeString;
    }

    // 페이지가 로드되면 첫 번째로 시간을 업데이트하고, 이후에는 1초마다 시간을 업데이트합니다.
    updateLiveTime();
    setInterval(updateLiveTime, 1000);
</script>
	<script>
    function showImagePopup(imgSrc) {
        var popupWindow = window.open("", "ImagePopup", "width=600,height=600");
        popupWindow.document.write('<html><head><title>지도</title></head><body><img src="' + imgSrc + '" alt="지도" style="max-width:100%;height:auto;"></body></html>');
    }
</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAb3NBYkG16DZLB73H30uLi4yz0x7RjOtU&callback=initMap"
		defer></script>
</body>
</html>