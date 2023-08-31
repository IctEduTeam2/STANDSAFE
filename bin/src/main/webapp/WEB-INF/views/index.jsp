<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>STANDSAFE</title>  
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
  <!-- Link Swiper's CSS -->

<link rel="stylesheet" href="resources/css/slide.css" />
<link rel="stylesheet" href="resources/css/basis.css" />
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="Semantic/header.jsp"></jsp:include>
		<section id="contents">
			<article>
				<div class="slide slide_wrap">
					<div class="slide_item item">
						<img src="resources/images/slide/slide_dust.png" class="slide_img">
					</div>
					<div class="slide_item item">
						<img src="resources/images/slide/slide_fire2.png" class="slide_img">
					</div>
					<div class="slide_item item">
						<img src="resources/images/slide/slide_hat.png" class="slide_img">
					</div>
					<div class="slide_item item">
						<img src="resources/images/slide/slide_note.png" class="slide_img">
					</div>
					<div class="slide_item item">
						<img src="resources/images/slide/slide_rain.png" class="slide_img">
					</div>
					<div class="slide_item item">
						<img src="resources/images/slide/slide_rain2.png" class="slide_img">
					</div>
					<div class="slide_item item">
						<img src="resources/images/slide/slide_san.png" class="slide_img">
					</div>
					<div class="slide_prev_button slide_button">◀</div>
					<div class="slide_next_button slide_button">▶</div>
					<ul class="slide_pagination"></ul>
				</div>
				<script src="resources/js/slide.js"></script>
			</article>
			<div style="width: 100%; height: 185px; float: left; margin-bottom: 50px; margin-top: 20px;">
				<a href="/productOneListform.do"><img src="resources/images/products/product1.jpg" style="width: 185px; height: 100%; border: 1px solid black; "></a>
				<a href=""><img src="resources/images/products/product1.jpg" style="width: 185px; height: 100%; border: 1px solid black; "></a>
				<a href=""><img src="resources/images/products/product1.jpg" style="width: 185px; height: 100%; border: 1px solid black; "></a>
				<a href=""><img src="resources/images/products/product1.jpg" style="width: 185px; height: 100%; border: 1px solid black; "></a>
				<a href=""><img src="resources/images/products/product1.jpg" style="width: 185px; height: 100%; border: 1px solid black; "></a>
				<a href=""><img src="resources/images/products/product1.jpg" style="width: 185px; height: 100%; border: 1px solid black; "></a>
				<a href=""><img src="resources/images/products/product1.jpg" style="width: 185px; height: 100%; border: 1px solid black; "></a>
				<a href=""><img src="resources/images/products/product1.jpg" style="width: 185px; height: 100%; border: 1px solid black; "></a>
				<a href=""><img src="resources/images/products/product1.jpg" style="width: 185px; height: 100%; border: 1px solid black; "></a>
				<a href=""><img src="resources/images/products/product1.jpg" style="width: 184px; height: 100%; border: 1px solid black; "></a>
			</div>
			<form style="float: right;">
				<input type="search" placeholder="검색어를 입력하세요."
					style="width: 300px; height: 40px; float: left;"> <input
					type="image" src="resources/images/search.png" alt="검색버튼"
					style="width: 18px; height: 25px; padding: 6px; float: left; border: 1px solid black;">
			</form>
			<div id="best">
				<h3 style="color: red; margin-top: 50px;">최신 상품</h3>
				<hr style="margin-bottom: 30px; margin-top: 20px; border: 3px solid #1b5ac2;">
					<ul class="prod-list">
						<li class="product"><img src="resources/images/products/product1.jpg" class="product_img">
							<p class="product_text">친환경 분말 소화기 주방 가정용요용용용용용용용용</p> <br>
							<p class="product_text">28,000원</p>
							<div class="caption">
								<button class="product_btn1">상세보기</button>
								<button class="product_btn2">장바구니 담기</button>
							</div></li>
						<li class="product"><img src="resources/images/products/product1.jpg" class="product_img">
							<p class="product_text">친환경 분말 소화기 주방 가정용요용용용용용용용용</p> <br>
							<p class="product_text">28,000원</p>
							<div class="caption">
								<button class="product_btn1">상세보기</button>
								<button class="product_btn2">장바구니 담기</button>
							</div></li>
						<li class="product"><img src="resources/images/products/product1.jpg" class="product_img">
							<p class="product_text">친환경 분말 소화기 주방 가정용요용용용용용용용용</p> <br>
							<p class="product_text">28,000원</p>
							<div class="caption">
								<button class="product_btn1">상세보기</button>
								<button class="product_btn2">장바구니 담기</button>
							</div></li>
						<li class="product"><img src="resources/images/products/product1.jpg" class="product_img">
							<p class="product_text">친환경 분말 소화기 주방 가정용요용용용용용용용용</p> <br>
							<p class="product_text">28,000원</p>
							<div class="caption">
								<button class="product_btn1">상세보기</button>
								<button class="product_btn2">장바구니 담기</button>
							</div></li>
						<li class="product"><img src="resources/images/products/product1.jpg" class="product_img">
							<p class="product_text">친환경 분말 소화기 주방 가정용요용용용용용용용용</p> <br>
							<p class="product_text">28,000원</p>
							<div class="caption">
								<button class="product_btn1">상세보기</button>
								<button class="product_btn2">장바구니 담기</button>
							</div></li>
						<li class="product"><img src="resources/images/products/product1.jpg" class="product_img">
							<p class="product_text">친환경 분말 소화기 주방 가정용요용용용용용용용용</p> <br>
							<p class="product_text">28,000원</p>
							<div class="caption">
								<button class="product_btn1">상세보기</button>
								<button class="product_btn2">장바구니 담기</button>
							</div></li>
					</ul>
			</div>
			<div id="event">
				<h3 style="color: red;">필수품</h3>
				<hr style="margin-bottom: 30px; margin-top: 20px; border: 3px solid #1b5ac2;">
					<ul class="prod-list">
						<li class="product"><img src="resources/images/products/product1.jpg" class="product_img">
							<p class="product_text">친환경 분말 소화기 주방 가정용요용용용용용용용용</p> <br>
							<p class="product_text">28,000원</p>
							<div class="caption">
								<button class="product_btn1">상세보기</button>
								<button class="product_btn2">장바구니 담기</button>
							</div></li>
					</ul>
			</div>
		</section>
		<jsp:include page="Semantic/quickmenu.jsp"></jsp:include>
				<script src="resources/js/quick.js"></script>
		<jsp:include page="Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>