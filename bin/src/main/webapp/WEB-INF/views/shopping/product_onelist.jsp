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

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="resources/css/slide.css" />
<link rel="stylesheet" href="resources/css/basis.css" />
<style>
td, th {
	margin: 0;
	padding: 30px 5px;
}

tbody td {
	border-top: 1px dotted black;
}

table {
	border-top: 2px solid black;
	border-bottom: 2px solid black;
	width: 100%;
	text-align: left;
	border-spacing: 0;
}

input[type="number"]::-webkit-inner-spin-button, input[type="number"]::-webkit-outer-spin-button
	{
	-webkit-appearance: inner-spin-button;
	opacity: 1;
}

button:hover {
	opacity: 0.8;
}

.detail {
	width: 100%;
	float: left;
	height: auto;
}

.review {
	float: left;
	width: 100%;
}

.faq {
	float: left;
	width: 100%;
}

.function {
	width: 100%;
	float: left;
}

.function>button, .top>button {
	float: left;
	width: 33%;
	font-size: 20px;
	font-weight: 700;
	border: 0;
	border-right: 1px solid black;
	height: 50px;
	background-color: rgba(27, 90, 194, 0.8);
	color: floralwhite;
}

.function>button:last-child, .top>button:last-child {
	float: left;
	width: 34.001%;
	font-size: 20px;
	font-weight: 700;
	border: 0;
	border-right: 1px solid black;
	height: 50px;
	background-color: rgba(27, 90, 194, 0.8);
	color: floralwhite;
}

hr {
	margin-top: 100px;
	float: left;
	width: 100%;
}

tr td:nth-child(2) {
	text-align: right;
}

.top {
	width: 1920px;
	position: fixed;
	top: 0;
	color: white;
	background: teal;
	font-weight: bold;
	display: flex;
	margin: auto;
	justify-content: space-between;
	align-items: center;
}
</style>
<script>
	function goToScroll(name) {
		var location = document.querySelector("." + name).offsetTop;
		window.scrollTo({
			top : location,
			behavior : 'smooth'
		});
	}
</script>
<script>
	$(document).ready(function() {
		$(window).scroll(function() {

			var here = $(".detail").offset().top;
			var height = $(document).scrollTop();

			if (here <= height) {
				$('#test').removeClass('function');
				$('#test').addClass('top');
			} else {
				$('#test').addClass('function');
				$('#test').removeClass('top');
			}
		});
	});
</script>
</head>

<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents" style="margin-top: 150px;">
			<div style="width: 50%; margin: auto;">
				<div style="float: left;">
					<img src="../images/error_message.png"
						style="width: 420px; height: 490px;">
				</div>

				<div style="float: right; width: 50%;">
					<table>
						<thead>
							<tr>
								<th>친환경 에러메세지입니다.</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>판매가</td>
								<td>28,000 원</td>
							</tr>
							<tr>
								<td>배송비</td>
								<td>3,000 원</td>
							</tr>
							<tr>
								<td>친환경 에러메세지입니다. <input type="number" value="1"
									style="width: 35px;"></td>
								<td><button
										style="width: 100px; float: right; height: 40px; font-weight: 700; background-color: rgba(0, 0, 0, 0.3); color: white; border: 0; border-radius: 5px;">담기</button></td>
							</tr>
							<tr>
								<td><b>총 상품금액</b> (수량):</td>
								<td><b>28,800 원</b> (1개)</td>
							</tr>
							<tr>
								<td colspan="2" style=""><button
										style="width: 100px; float: left; height: 40px; font-weight: 700; background-color: rgba(27, 90, 194, 0.8); color: white; border: 0; border-radius: 5px; margin-bottom: 5px; margin-right: 20px;">바로구매</button>
									<button
										style="width: 100px; float: right; height: 40px; font-weight: 700; background-color: rgba(0, 0, 0, 0.3); color: white; border: 0; border-radius: 5px;">CART</button>
									<button
										style="width: 100px; float: right; height: 40px; font-weight: 700; background-color: rgba(0, 0, 0, 0.3); color: white; margin-right: 20px; border: 0; border-radius: 5px;">WISH</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div style="width: 100%; float: left; margin-top: 70px;">
				<div class="function" id="test">
					<button onclick="goToScroll('a')">Detail</button>
					<button onclick="goToScroll('b')">Review</button>
					<button onclick="goToScroll('c')">FAQ</button>
				</div>
				<div style="width: 70%; margin: auto;">
					<div class="detail a">
						<h1 style="text-align: center; margin: 80px 0; font-size: 60px;">Detail</h1>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇ
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
						ㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>ㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ<br>
					</div>
					<hr>
					<div class="review b">
						<h1 style="text-align: center; margin: 80px 0; font-size: 60px;">Review</h1>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd <br> asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd <br>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd <br> asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd <br>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd <br> asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd <br>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd <br> asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd <br>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd <br> asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd <br>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd <br> asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd <br>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd <br> asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd <br>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd <br> asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd <br>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd <br> asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd <br>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd <br> asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd <br>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd <br> asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd <br>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd <br> asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd <br>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd <br> asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd <br>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd <br>
					</div>
					<hr>
					<div class="faq c">
						<h1 style="text-align: center; margin: 80px 0; font-size: 60px;">FAQ</h1>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd <br> asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd <br>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd <br> asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd <br>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd <br> asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd <br>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd <br> asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd <br>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd <br> asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd <br>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd <br> asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd <br>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd <br> asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd <br>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd <br> asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd <br>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd <br> asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd <br>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd <br> asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd <br>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd <br> asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd <br>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd <br> asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd <br>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd <br> asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd <br>
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd <br> asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd
						asdasdasdasdasd asdasdasdasdasd asdasdasdasdasd <br>
					</div>
				</div>
			</div>
		</section>
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>

