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

#step1, #step2, #step3, #dateInput {
    width: 250px; /* 원하는 너비로 조정 */
    padding: 10px; /* 내부 여백 설정 */
    font-size: 16px; /* 폰트 크기 설정 */
    border: 1px solid #ccc; /* 테두리 스타일 지정 */
   
}
.go_btn{
	background-color: #1b5ac2; /* 파란색 배경 색상 */
    color: #fff; /* 텍스트 색상 */
    font-size: 16px; /* 폰트 크기 설정 */
    padding: 5px 20px; /* 내부 여백 설정 (상하 10px, 좌우 20px) */
    border: none; /* 테두리 제거 */
    cursor: pointer;
    height: 40px; 
}
#w_noti{
	color: red;
	font-size: 14px;
	font-weight: bold;
}
.weather_div {
    border: 1px solid #ccc;
    padding: 20px;
    margin: 20px;
    max-width: 400px;
    text-align: center;
    background-color: #f5f5f5;
}

.weather-_data {
    margin-top: 20px;
}

.weather-_data .weather_item {
    display: inline-block;
    margin: 10px;
    padding: 10px;
    border: 1px solid #ddd;
    background-color: #fff;
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
}


   /* 각 카테고리를 감싸는 박스 스타일 */
    .weather-box {
        width: 250px;
        height: 120px;
        border: 1px solid #ccc;
        margin: 10px;
        display: inline-block;
    }
    
    /* 카테고리 아이콘 스타일 */
    .weather-box .weather-icon {
        float: left;
        width: 100px;
        height: 100px;
    }
    
    /* 카테고리 아이콘 이미지 스타일 */
    .weather-box .weather-icon img {
        width: 100%;
        height: 100%;
    }
    
    /* 카테고리 정보 스타일 */
    .weather-box .weather-info {
        float: left;
        width: 140px;
        height: 100px;
        padding: 10px;
    }
    
    /* 카테고리 정보 제목 스타일 */
    .weather-box .weather-info h3 {
        font-size: 18px;
        margin: 0;
    }
    
    /* 카테고리 정보 값 스타일 */
    .weather-box .weather-info p {
        font-size: 24px;
        margin: 0;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
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
                url: "/get_areacity.do?selectStep1=" + selectStep1,
                method: "post",
                dataType: "text",
                async :false,
                success: function (data) {
                    console.log(data);
                    selectStep2.innerHTML = "";
                    selectStep2.innerHTML = data;
                },
                error: function () {
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
                url: "/get_areacity.do?selectStep2=" + selectStep2,
                method: "post",
                dataType: "text",
                async :false,
                success: function (data) {
                    console.log(data);
                    selectStep3.innerHTML = "";
                    selectStep3.innerHTML = data;
                },
                error: function () {
                    alert("읽기 실패");
                }
            });
        }
    }
</script>
<script type="text/javascript">
	function getWeather(){

		var areacode="";
		var step1 = document.getElementById("step1").value;
		var step2 = document.getElementById("step2").value;
		var step3 = document.getElementById("step3").value;
		var dateInput = document.getElementById("dateInput").value;
				
		if(step3 == '' && step2 == '') {
			areacode = step1;
		}else if (step3 == '' && step2 != '') {
			areacode = step2;
		}else if (step3 != '') {
			areacode = step3;
		}
		
		 var data = {
		            areacode: areacode,
		            dateInput: dateInput,
		            step2: step2,
		            step1: step1
		        };
	
		 
		        $.ajax({
		            url: "/get_weather.do",
		            dataType: "JSON",
		            method: "POST",
		            async :false,
		            data:data,
		            success: function (res) {
		            	console.log(res)
		            	 displayWeatherData(res);
		                
		            },
		            error: function () {
		                alert("읽기 실패");
		            }
		        });
		    }
	
	  function displayWeatherData(data) {
	        // 기온 데이터
	        var tempData = data.filter(function(item) {
	            return item.category === 'T1H';
	        })[0];
	        
	        // 강수량 데이터
	        var rainData = data.filter(function(item) {
	            return item.category === 'RN1';
	        })[0];
	        
	        //하늘상태
	        var skyData = data.filter(function(item) {
	            return item.category === 'SKY';
	        })[0];
	        
	        //강수형태
	        var rainStData= data.filter(function(item) {
	            return item.category === 'PTY';
	        })[0];
	      
	        
	        // 기온 데이터 출력
	        if (tempData) {
	            document.getElementById("temperatureValue").innerText = tempData.fcstValue + "°C";
	        }
	        
	        // 강수량 데이터 출력
	        if (rainData) {
	            document.getElementById("precipitationValue").innerText = rainData.fcstValue + "mm";
	        }
	        
	        //하늘상태
	        if (skyData) {
	            document.getElementById("skyValue").innerText = skyData.fcstValue ;
	        }
	        
	        if (rainStData) {
	            document.getElementById("rainStatusValue").innerText = rainStData.fcstValue ;
	        }
	        
	       
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
		<hr id="hr2">
		<h3 style="text-align: left">■ 날씨정보</h3>
		<br><br>
		<!--여기에 갖고온 데이터들 나와야함.  -->
		<div>
		 <p id="w_noti">날씨는 현재시간기준으로 6시간 이내의 날씨정보만 조회됩니다. </p><br><br>
		</div>

	<!-- <form class="form-horizontal" method="post" action="/get_weather.do"> -->
	<form class="form-horizontal" >
		<div class="form-group">
			<select id="step1" name="citys"  class="citys" title="시/도" onchange="selectArea()">
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
			</select>

			<select id="step2" name="counties" class="counties" onchange="selectcounty()">
				<option id="county" value="">시/도 를 선택하세요</option>
				
			</select>

			<select id="step3" name="town">
				<option id="town" value="">시/군/구 를 선택하세요</option>
			</select>

			 <label for="dateInput">현재 날짜 및 시간</label>
			 <input type="text" id="dateInput" name="dateInput" readonly>
			<!-- <button type="submit" class="go_btn"> -->
			<button type="button" class="go_btn" onclick="getWeather()">
				<span>검색</span>
			</button>
			
		</div>
	</form>
	
			<div class="weather_div">
		    <h2>날씨정보</h2>
		    
			    <!-- 날씨 정보를 표시할 요소 -->
			    <div class="weather_data">
			    
			        <!-- 예시: 기온 데이터 출력 -->
			        <div id="tempData" class="weather-box">
			            <h3>기온</h3>
			            <p id="temperatureValue"></p>
			     	</div>
		
		       		<!-- 예시: 강수량 데이터 출력 -->
		        	<div id="rainData" class="weather-box">
		           		<h3>강수량</h3>
		          	  	<p id="precipitationValue"></p>
      				</div>
      			  
      			   <!-- 예시: 강수량 데이터 출력 -->
		       		<div id="skyData" class="weather-box">
		           		<h3>하늘상태</h3>
		          	  	<p id="skyValue"></p>
      			 	</div>
      			  
      			  
      			   <!-- 예시: 강수량 데이터 출력 -->
		        	<div id="rainStData" class="weather-box">
		           		<h3>강수형태</h3>
		          	  	<p id="rainStatusValue"></p>
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