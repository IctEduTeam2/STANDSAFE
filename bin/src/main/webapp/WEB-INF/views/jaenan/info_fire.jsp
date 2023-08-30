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
			<button onclick="location.href='/jaenan_fire.do'" class="top_btn" style="background-color: #1b5ac2">화재</button>
			<button onclick="location.href='/jaenan_jijinlive.do'" class="top_btn" >지진</button>
			<button onclick="location.href='/jaenan_rainlive.do'" class="top_btn" >강수</button>
		</div>
		<hr id="hr1">
		<div class="top_tab">
			<a href="/jaenan_fire.do" style="color: #1b5ac2; font-weight: bold" >금일 화재현황 </a> |
			<a href="/jaenan_firegraph.do" >통계</a>
			
		</div>

		<hr id="hr2">
		<h3 style="text-align: left">■ 금일 화재 발생</h3>
		<br><br>
		
		
		<h3 style="text-align: left">■ 화재 발생 상세</h3>
		<br><br>
		<div class="top_location">
			<p style="display: inline-block;">지역 조회</p>
			<input type="text" id="search" name="search" placeholder="지역을 입력하세요" >
			<input type="button" value="검색" class="s_btn"/>
		</div>
		

		
		
		
		</section>
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>