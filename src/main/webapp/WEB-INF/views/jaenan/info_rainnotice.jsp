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
.radar_btn {
	background-color: #1b5ac2;
	color: white;
	padding: 10px;
	border-radius: 10px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	margin-right: 20px;
	border: none;
	cursor: pointer;
}

.radar_btn:hover {
	background-color: white;
	color: #1b5ac2;
}

#w_noti {
	color: red;
	font-size: 14px;
	font-weight: bold;
}

.front {
	float: left;
	margin: 30px 30px;
	padding: 20px;
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

.all_div {
	display: flex;
	flex-direction: column;
}

.radar_img {
	margin-left: 30px;
}
/*슬라이드  */
.radar_slide {
	position: relative;
}

.slide_box {
	display: flex;
	overflow: hidden;
}

.slide_img {
	width: 635px;
	height: 620px;
	height: auto;
	transition: transform 0.3s ease-in-out;
	height: auto;
}

.slide_btn {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	background-color: rgba(0, 0, 0, 0.5);
	color: white;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
}

#prevbtn {
	left: 0;
}

#nextbtn {
	right: 0;
}

.playbtn {
    background-color: rgba(0, 0, 0, 0.5);
    color: white;
    padding: 10px 20px;
    border: none;
    cursor: pointer;
    position: absolute;
    bottom: 30px;
    left: 10px;
    z-index: 1; /* 다른 버튼 위에 표시하기 위해 z-index 설정 */
}

</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
					style="color: #1b5ac2; font-weight: bold">실시간 레이더 영상</a>

			</div>
			<hr id="hr2">
			<h3 style="text-align: left">■ 실시간 레이더 영상</h3>
			<br> <br>
			<div class="all_div">
				<div class="front">
					<c:choose>
						<c:when test="${empty list }">
							<h3>죄송합니다. 레이더 정보를 가져오지 못했습니다.</h3>
							<p style="color: gray; margin-top: 10px;">시간대에 따라 서비스가 제공이 안될
								수도 있습니다.</p>
						</c:when>
						<c:otherwise>
							<h3>${year}년 ${month } 월 ${day } 일 의 ${front_time } 기준의 레이더
								캡처입니다.</h3>
							<p style="color: gray; margin-top: 10px;">
								※조회 시간은 5분 단위이며, ${front_time2 } 으로 조회했습니다 <br> 15~30분 정도
								차이가 있을 수 있습니다.
							</p>
						</c:otherwise>
					</c:choose>
				</div>


				<div>
					<div class="radar_img"
						style="display: inline-block; vertical-align: top;">
						<c:choose>
							<c:when test="${empty list }">
								<p>죄송합니다. 레이더 정보를 가져오지 못했습니다.</p>
							</c:when>
							<c:otherwise>
								<img alt="레이더" src="${last_img}" />
							</c:otherwise>
						</c:choose>
					</div>
					<div
						style="display: inline-block; vertical-align: top; margin-left: 100px; margin-top: 100px;">
						<button id="show_radar" class="radar_btn"
							title="금일 자정부터의 이전시간까지 영상">이전 시간 레이더 영상 보기</button>
						<p style="margin-top: 10px; color: gray;">
							금일 자정부터 이전시간까지의 <br> 레이더 영상입니다.
						</p>
					</div>
					<div class="radar_slide"
						style="display: none; vertical-align: top; margin-left: 100px;">
						<div class="slide_box">
							<c:forEach var="k" items="${list }">
								<img alt="레이더" src="${k.rdr_img}" class="slide_img" />
							</c:forEach>
						</div>
						<button id="prevbtn" class="slide_btn">이전</button>
						<button id="playbtn" class="playbtn">▷</button>
						<button id="nextbtn" class="slide_btn">다음</button>		
					</div>
				</div>
			</div>

		</section>
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
	<script>
	  document.addEventListener("DOMContentLoaded", function () {
	        const toggleButton = document.getElementById("show_radar");
	        const radarSlide = document.querySelector(".radar_slide");
	        const sliderImages = document.querySelectorAll('.slide_img');
	        const prevBtn = document.getElementById('prevbtn');
	        const playBtn = document.getElementById('playbtn');
	        const nextBtn = document.getElementById('nextbtn');
	        let currentIndex = 0;
	        let isPlaying = false;

	        function showImage(index) {
	            sliderImages.forEach((image, i) => {
	                image.style.display = i === index ? 'block' : 'none';
	            });
	        }

	        function playSlideshow() {
	            isPlaying = true;
	            playBtn.textContent = "❚❚"; // 일시 정지 아이콘
	            // 이미지 변경 타이머 설정 (여기에서는 3초마다 이미지 전환)
	            slideInterval = setInterval(() => {
	                currentIndex = (currentIndex + 1) % sliderImages.length;
	                showImage(currentIndex);
	            }, 500);
	        }

	        function pauseSlideshow() {
	            isPlaying = false;
	            playBtn.textContent = "▷"; // 재생 아이콘
	            clearInterval(slideInterval); // 타이머 중지
	        }

	        // 초기화
	        showImage(currentIndex);

	        toggleButton.addEventListener("click", function () {
	            if (isPlaying) {
	                pauseSlideshow();
	            }
	            if (radarSlide.style.display === "none" || radarSlide.style.display === "") {
	                radarSlide.style.display = "inline-block";
	                toggleButton.textContent = "이전 시간 레이더 영상 닫기";
	            } else {
	                radarSlide.style.display = "none";
	                toggleButton.textContent = "이전 시간 레이더 영상 보기";
	            }
	        });

	        prevBtn.addEventListener('click', () => {
	            currentIndex = Math.max(currentIndex - 1, 0);
	            showImage(currentIndex);
	        });

	        playBtn.addEventListener('click', () => {
	            if (isPlaying) {
	                pauseSlideshow();
	            } else {
	                playSlideshow();
	            }
	        });

	        nextBtn.addEventListener('click', () => {
	            currentIndex = Math.min(currentIndex + 1, sliderImages.length - 1);
	            showImage(currentIndex);
	        });
	    });
</script>
	<script type="text/javascript">
	

</script>
	<script type="text/javascript">
const radarbtn = document.getElementById('show_radar');

//마우스 오버 시 툴팁을 표시하는 함수
function showTooltip() {
	radarbtn.setAttribute('title', '금일 자정부터의 이전시간까지 영상');
}

//마우스 아웃 시 툴팁을 숨기는 함수 (선택 사항)
function hideTooltip() {
	radarbtn.removeAttribute('title');
}

//이벤트 리스너를 추가하여 마우스 오버 및 마우스 아웃 이벤트를 처리합니다.
radarbtn.addEventListener('mouseover', showTooltip);
radarbtn.addEventListener('mouseout', hideTooltip);
</script>
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