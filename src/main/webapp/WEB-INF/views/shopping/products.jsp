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
<style>
    
.cate {
	width: 200px;
	height: 50px;
	background-color: rgba(27, 90, 194, 0.8);
	color: white;
	border: 0;
	border-radius: 5px;
	margin-right: 20px;
}
    button:hover {
        opacity: 0.8;
    }
    .current {
	width: 200px;
	height: 50px;;
	background-color: rgba(0,0,0,0.3);
	color: floralwhite;
	border: 0;
	border-radius: 5px;
	margin-right: 20px;
    }
    </style>
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents">
		<!-- 여기에 컨텐츠 넣으시면 됩니다. -->
		<div style="float: left; width: 100%; margin-bottom: 30px; margin-top: 100px;">
		    <b style="font-size: 22px;">■ 소방/안전 -</b> <b>소화기</b>
		</div>
		    <hr>
		<div style=" float: left; width: 100%; margin: 30px 0;">
		    <button class="cate">소화기</button>
		    <button class="current">화재 감지 | 대피</button>
		</div>
		    <hr>
        <div style="width: 90%; margin: auto;">
            <div style="padding: 15px 10px; border: 1px solid black; width: 100%; float: left; margin-top: 30px;">
                <div style="float: left;">
                    등록제품: 10개
                </div>
                <div style="float: right;">
                   <button style="border: 0; background-color: white;"><b>최신순</b></button> | 
                   <button style="border: 0; background-color: white;">가나다순</button> | 
                   <button style="border: 0; background-color: white;">낮은 가격순</button> | 
                   <button style="border: 0; background-color: white;">인기순</button>
                </div>
            </div>
            
            <div style="width: 100%; float: left; margin-top: 100px;">
                <div id="best">
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
            </div>
        </div>
		</section>
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>