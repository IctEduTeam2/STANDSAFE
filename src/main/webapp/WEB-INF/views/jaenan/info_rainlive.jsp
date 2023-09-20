<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
.menu{margin-bottom: 50px;}

#small_news{ background-color: black; color: yellow;}



.top_btn{
	margin-top:20px;
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
#hr1{
	width: 100%;
	border:0px;
	height: 4px;
	background: gray;
	margin-top: 50px;
}
#hr2{
	width: 100%;
	border:0px;
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



.top_location{
	margin-top: 20px;
	float: right;
	margin-bottom: 30px;
	}
#search{
	margin-left: 30px;
	width: 250px;
	height: 30px;
}

.s_btn{
	height: 30px;
	background-color: #1b5ac2;
	color: #ffffff;
	border: 0px;
	width: 60px;
	
	}
</style>
<script type="text/javascript">
<script>
// 슬라이드 쇼를 시작할 때 호출되는 함수
function startSlideshow() {
    var tableRows = document.querySelectorAll("#slideshow table tbody tr");
    var currentRow = 0;

    // 테이블 행을 순차적으로 표시하는 함수
    function showNextRow() {
        tableRows[currentRow].style.display = "none";
        currentRow = (currentRow + 1) % tableRows.length;
        tableRows[currentRow].style.display = "table-row";
    }

    // 3초마다 다음 행을 표시
    setInterval(showNextRow, 3000);
}

// 페이지 로드 시 슬라이드 쇼 시작
window.onload = startSlideshow;
</script>
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
		
			<div class="top_btns" >
			<button onclick="location.href='/jaenan_fire.do'" class="top_btn">화재</button>
			<button onclick="location.href='/jaenan_jijinlive.do'" class="top_btn" >지진</button>
			<button onclick="location.href='/jaenan_rainlive.do'" class="top_btn" style="background-color: #1b5ac2">강수</button>
		</div>
		<hr id="hr1">
		<div class="top_tab">
			<a href="/jaenan_rainlive.do" style="color: #1b5ac2; font-weight: bold" >실시간 날씨 </a> |
			<a href="/jaenan_rainnotice.do">홍수예보 발령자료</a>
			
		</div>
		<div class="top_location">
			<p style="display: inline-block;">지역 조회</p>
			<input type="text" id="search" name="search" placeholder="지역을 입력하세요" >
			<input type="button" value="검색" class="s_btn"/>
		</div>

		
		<hr id="hr2">
		<h3 style="text-align: left">■ 날씨정보</h3>
		<br><br>
		<!--여기에 갖고온 데이터들 나와야함.  -->
		<div id="slideshow">
				<table>
					<thead>
						<tr><td>상태</td><td>경도</td><td>위도</td><td>수치</td></tr>
					</thead>
					<tbody>
    <c:forEach items="${list}" var="k">
        <tr onclick="showNextRow(this)">
            <td>${k.category}</td>
            <td>${k.nx}</td>
            <td>${k.ny}</td>
            <td>${k.obsrValue}</td>
        </tr>
    </c:forEach>
</tbody>
				</table>	
		</div>

		
		
		
		</section>
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>