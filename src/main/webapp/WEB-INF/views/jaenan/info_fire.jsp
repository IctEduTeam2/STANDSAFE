<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<style type="text/css">
.menu {
	margin-bottom: 50px;
}

#small_news {
	background-color: black;
	color: yellow;
}

table {
	margin: auto;
	width: 80%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
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
	margin-bottom: 30px;
}

.top_tab {
	margin-top: 20px;
	border: 1px solid black;
	padding: 10px;
	text-align: left;
}

.top_location {
	margin-top: 20px;
	float: right;
	margin-bottom: 30px;
}

#search {
	margin-left: 30px;
	width: 250px;
	height: 30px;
}

.s_btn {
	height: 30px;
	background-color: #1b5ac2;
	color: #ffffff;
	border: 0px;
	width: 60px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function () {
    // ...
    $("#btn1").click(function () {
		$(function() {
			var selectedSidoNm = $('#sido_nm').val();
			let sidoName;
		    switch (selectedSidoNm) {
		        case '서울소방재난본부':
		            sidoName = '서울특별시';
		            break;
		        case '부산소방재난본부':
		            sidoName = '부산광역시';
		            break;
		        case '대구소방안전본부':
		            sidoName = '대구광역시';
		            break;
		        case '인천소방안전본부':
		            sidoName = '인천광역시';
		            break;
		        case '광주소방본부':
		            sidoName = '광주광역시';
		            break;
		        case '대전소방본부':
		            sidoName = '대전광역시';
		            break;
		        case '울산소방본부':
		            sidoName = '울산광역시';
		            break;
		        case '경기소방재난본부':
		            sidoName = '경기남부';
		            break;
		        case '경기북부소방재난본부':
		            sidoName = '경기북부';
		            break;
		        case '강원소방본부':
		            sidoName = '강원도';
		            break;
		        case '충북소방본부':
		            sidoName = '충청북도';
		            break;
		        case '충청남도소방본부':
		            sidoName = '충청남도';
		            break;
		        case '전북소방본부':
		            sidoName = '전라북도';
		            break;
		        case '전남소방본부':
		            sidoName = '전라남도';
		            break;
		        case '경북소방본부':
		            sidoName = '경상북도';
		            break;
		        case '경남소방본부':
		            sidoName = '경상남도';
		            break;
		        case '제주소방본부':
		            sidoName = '제주특별자치도';
		            break;
		        default:
		            sidoName = '미정';
		}
			var today = new Date();
			var dd = String(today.getDate()).padStart(2, '0');
			var mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
			var yyyy = today.getFullYear();
			var currentDate = yyyy + mm + dd;
			var xhr = new XMLHttpRequest();
	        var currentDate2 = new Date().toISOString().split('T')[0]; // 현재 날짜를 YYYY-MM-DD 형식으로 가져옵니다.
			var url = 'https://apis.data.go.kr/1661000/FireInformationService/getOcByfrstFireSmrzPcnd'; /*URL*/
			var queryParams = '?'
					+ encodeURIComponent('serviceKey')
					+ '='
					+ ''; /*Service Key*/
			queryParams += '&' + encodeURIComponent('pageNo') + '='
					+ encodeURIComponent('1'); /**/
			queryParams += '&' + encodeURIComponent('numOfRows') + '='
					+ encodeURIComponent('9999'); /**/
			queryParams += '&' + encodeURIComponent('resultType') + '='
					+ encodeURIComponent('XML'); /**/
			queryParams += '&' + encodeURIComponent('ocrn_ymd') + '='
					+ encodeURIComponent(currentDate); /**/
			$
					.ajax({
						crossOrigin : true,
						url : url + queryParams,
						method : "get",
						dataType : "xml",
						success : function(data) {
							
							var table = "<table style='width: 80%;  margin: auto;'>";
							table += "<thead>";
							table += "<tr>";
							table += "<th>소방서센터명</th>";
							table += "<th>화재접수건수</th>";
							table += "<th>허위신고건수</th>";
							table += "<th>화재진행건수</th>";
							table += "<th>오보처리건수</th>";
							table += "<th>자체진화건수</th>";
							table += "<th>상황종료건수</th>";
							table += "</tr>";
							table += "</thead>";
							table += "<tbody>";
							$(data).find('item').each(function() {
							    var sido_nm = $(this).find("SIDO_HQ_FRST_CETR_NM").text();
							    if (sido_nm === selectedSidoNm) {
							        table += "<tr>";
							        table += "<td>" + $(this).find("FRST_CETR_NM").text() + "</td>";
							        table += "<td>" + $(this).find("FIRE_RCPT_MNB").text() + "</td>";
							        table += "<td>" + $(this).find("FALS_DCLR_MNB").text() + "</td>";
							        table += "<td>" + $(this).find("FIRE_PROG_MNB").text() + "</td>";
							        table += "<td>" + $(this).find("FLSRP_PRCS_MNB").text() + "</td>";
							        table += "<td>" + $(this).find("SLF_EXTSH_MNB").text() + "</td>";
							        table += "<td>" + $(this).find("STN_END_MNB").text() + "</td>";
							        table += "</tr>";
							    }
							});
							table += "</tbody>";
							table += "</table>";
							$("#date2").text(
									'■ 금일 '+ sidoName +' 화재 상세현황 - ' + currentDate2);
							$("#out2").html(table);
						},
						error : function() {
							console.log(data);
							alert("읽기실패");
						}
					});
		});
    });
});
</script>
</head>
<body onload="InitializeStaticMenu();">
	<script type="text/javascript">
		$(function() {
			var today = new Date();
			var dd = String(today.getDate()).padStart(2, '0');
			var mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
			var yyyy = today.getFullYear();
			var currentDate = yyyy + mm + dd;
			var xhr = new XMLHttpRequest();
	        var currentDate2 = new Date().toISOString().split('T')[0]; // 현재 날짜를 YYYY-MM-DD 형식으로 가져옵니다.
			var url = 'https://apis.data.go.kr/1661000/FireInformationService/getOcBysidoFireSmrzPcnd'; /*URL*/
			var queryParams = '?'
					+ encodeURIComponent('serviceKey')
					+ '='
					+ 's5XZ4UZ0i%2FT8pulopVQB5C5AW1yjyQzb7hB%2BIpHW5%2FsGi%2FlJTkQohr%2BKCnon%2BdEDLn2nHdCXf2xdc5C1hgbwZQ%3D%3D'; /*Service Key*/
			queryParams += '&' + encodeURIComponent('pageNo') + '='
					+ encodeURIComponent('1'); /**/
			queryParams += '&' + encodeURIComponent('numOfRows') + '='
					+ encodeURIComponent('9999'); /**/
			queryParams += '&' + encodeURIComponent('resultType') + '='
					+ encodeURIComponent('XML'); /**/
			queryParams += '&' + encodeURIComponent('ocrn_ymd') + '='
					+ encodeURIComponent(currentDate); /**/
			$
					.ajax({
						crossOrigin : true,
						url : url + queryParams,
						method : "get",
						dataType : "xml",
						success : function(data) {
							//console.log(data);
							var table = "<table>";
							table += "<thead>";
							table += "<tr>";
							table += "<th>도시명</th><th>화재접수건</th><th>화재진행중</th><th>종료건수</th>";
							table += "</tr>";
							table += "</thead>";
							table += "<tbody>";
							$(data).find('item').each(function() {
										table += "<tr>";
										table += "<td>"
												+ $(this).find("SIDO_NM")
														.text() + "</td>";
										table += "<td>"
												+ $(this).find("FIRE_RCPT_MNB")
														.text() + "</td>";
										table += "<td>"
												+ $(this)
														.find("FLSRP_PRCS_MNB")
														.text() + "</td>";
										table += "<td>"
												+ $(this).find("STN_END_MNB")
														.text() + "</td>";
										table += "</tr>";
									});
							table += "</tbody>";
							table += "</table>";
							$("#date").text(
									'■ 금일 전국 화재 발생현황 - ' + currentDate2);
							$("#out").html(table);
						},
						error : function() {
							console.log(data);
							alert("읽기실패");
						}
					});
		});
	</script>
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents">
			<div class="top_header">
				<h1>■ 재난 정보</h1>
				<br>
				<!-- <p id="small_news">한줄뉴스처럼 재난문자 뜨게할것(?)</p> -->
			</div>

			<div class="top_btns">
				<button onclick="location.href='/jaenan_fire.do'" class="top_btn"
					style="background-color: #1b5ac2">화재</button>
				<button onclick="location.href='/jaenan_jijinlive.do'"
					class="top_btn">지진</button>
				<button onclick="location.href='/jaenan_rainlive.do'"
					class="top_btn">강수</button>
			</div>
			<hr id="hr1">
			<div class="top_tab">
				<a href="/jaenan_fire.do" style="color: #1b5ac2; font-weight: bold">금일
					화재현황 </a> | <a href="/jaenan_firegraph.do">통계</a>

			</div>

			<hr id="hr2">
			<h3 style="text-align: left">
				<div id="date"></div>
			</h3>
			<hr>
			<br>
			<div id="out"></div>
			<br> <br>

			<div class="top_location">
				<label for="sido_nm">지역 상세정보 확인:</label>
<select id="sido_nm" name="sido_nm">
    <option value="서울소방재난본부">서울특별시</option>
    <option value="부산소방재난본부">부산광역시</option>
    <option value="대구소방안전본부">대구광역시</option>
    <option value="인천소방안전본부">인천광역시</option>
    <option value="광주소방본부">광주광역시</option>
    <option value="대전소방본부">대전광역시</option>
    <option value="울산소방본부">울산광역시</option>
    <option value="경기소방재난본부">경기남부</option>
    <option value="경기북부소방재난본부">경기북부</option>
    <option value="강원소방본부">강원도</option>
    <option value="충북소방본부">충청북도</option>
    <option value="충청남도소방본부">충청남도</option>
    <option value="전북소방본부">전라북도</option>
    <option value="전남소방본부">전라남도</option>
    <option value="경북소방본부">경상북도</option>
    <option value="경남소방본부">경상남도</option>
    <option value="제주소방본부">제주특별자치도</option>
</select>
				<button id="btn1">조회</button>
			</div>

			<h3 style="text-align: left">
				<div id="date2"></div>
			</h3>
			<br> <br>
			<div id="out2" style="float: left; width: 100%;"></div>
		</section>
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>