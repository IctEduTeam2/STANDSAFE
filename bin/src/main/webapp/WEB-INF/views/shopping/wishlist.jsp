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

<link rel="stylesheet" href="resources/css/basis.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
.snb {
	float: left;
	width: 100%;
	line-height: 80px;
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.li {
	width: 20%;
	height: 100%;
	float: left;
}

th {
	padding: 30px;
}

td {
	padding: 40px;
}

.li:first-child {
	border: 1px solid black;
}

.li:nth-child(2) {
	border-bottom: 1px solid black;
	border-top: 1px solid black;
}

.li:last-child {
	border: 1px solid black;
}

.li_a {
	width: 100%;
	height: 100%;
	display: block;
	background-color: rgba(27, 90, 194, 1);
	color: white;
	text-align: center;
	font-weight: bold;
}

.li a.current {
	background-color: rgba(255, 255, 255, 0.3);
	color: white;
}

.li a:hover:not(.current) {
	background-color: rgba(255, 255, 255, 0.5);
}

.baskets {
	width: 100%;
	float: left;
}

.basket_cont {
	margin-bottom: 30px;
	border: 1px solid black;
	border-radius: 10px;
	width: 100%;
	height: 280px;
}

.basket_img {
	float: left;
	width: 230px;
	height: 160px;
	margin-top: 20px;
	margin-left: 20px;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

.order {
	float: right;
	width: 200px;
	height: 50px;
	background-color: rgba(27, 90, 194, 0.8);
	color: white;
	border: 0;
	border-radius: 5px;
	margin-right: 10px;
	margin-top: 20px;
}

.select_del {
	padding: 8px 20px;
	background-color: rgba(27, 90, 194, 1);
	color: white;
	margin-bottom: 5px;
	border: 0;
	border-radius: 5px;
}

.select_del:hover, .one_basket:hover, .one_del:hover {
	opacity: 0.8;
}

.one_del {
	width: 200px;
	float: left;
	height: 50px;
	background-color: rgba(0, 0, 0, 0.3);
	color: white;
	border: 0;
	border-radius: 5px;
	margin-bottom: 5px;
	margin-right: 20px;
}

.one_basket {
	width: 200px;
	float: left;
	height: 50px;
	background-color: rgba(27, 90, 194, 0.8);
	color: white;
	border: 0;
	border-radius: 5px;
	margin-bottom: 5px;
	margin-right: 20px;
}
</style>
<script>
    function selectAll(selectAll)  {
  const checkboxes 
       = document.getElementsByName('select');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  });
}
</script>
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents" style="border: 0px solid black;">
			<h3
				style="width: 100%; float: left; margin-top: 100px; font-size: 30px;">위시리스트</h3>
			<div
				style="width: 100%; height: 82px; background-color: rgba(27, 90, 194, 1); float: left; margin-top: 10px;">
				<ul class="snb">
					<li class="li"><a href="/basketform.do" class="li_a"
						style="color: white;">장바구니</a></li>
					<li class="li"><a href="/wishlistform.do" class="current li_a">위시리스트</a></li>
					<li class="li"><a href="/orderlistform.do" class="li_a"
						style="color: white;">주문조회 | 배송현황</a></li>
				</ul>
			</div>

			<div
				style="width: 60%; margin: auto; height: auto; margin-top: 60px;">
				<div
					style="width: 100%; height: auto; margin-top: 100px; float: left;">
					<div style="float: left; text-align: center; margin: 0;">
						<input type="checkbox" name="select" value="selectall"
							onclick="selectAll(this)" style="width: 20px; height: 20px;">
						<b style="font-size: 18px;">전체 선택</b>
					</div>
					<div style="float: right">
						<input type="button" value="선택항목 담기" class="select_del"> <input
							type="button" value="선택항목 삭제" class="select_del">
					</div>
				</div>
				<div class="baskets">
					<!-- 제품 한개-->
					<div class="basket_cont">
						<img class="basket_img"
							src="resources/images/products/product1.jpg">
						<div style="width: 60%; float: left; margin-top: 80px;">
							<a href=""
								style="font-size: 18px; margin-left: 10px; font-weight: 600;">가정용
								/ 캠핑용 액체 소방 스프레이</a> <br> <b
								style="margin-left: 10px; font-size: 14px;">100,000원</b>
						</div>
						<div style="width: 18%; float: left; height: 200px;">
							<input type="checkbox" name="select" value="제품명"
								style="width: 20px; height: 20px; float: right; margin-right: 20px; margin-top: 20px;">
							<div
								style="width: 100%; margin-top: 100px; font-size: 20px; font-weight: 700;">
							</div>
						</div>
						<div style="float: right;">
							<input type="button" value="장바구니 담기" class="one_basket">
							<input type="button" value="삭제하기" class="one_del">
						</div>
					</div>
					<!-- 제품한개 끝태그 -->
					<!-- 제품 한개-->
					<div class="basket_cont">
						<img class="basket_img"
							src="resources/images/products/product1.jpg">
						<div style="width: 60%; float: left; margin-top: 80px;">
							<a href=""
								style="font-size: 18px; margin-left: 10px; font-weight: 600;">가정용
								/ 캠핑용 액체 소방 스프레이</a> <br> <b
								style="margin-left: 10px; font-size: 14px;">100,000원</b>
						</div>
						<div style="width: 18%; float: left; height: 200px;">
							<input type="checkbox" name="select" value="제품명"
								style="width: 20px; height: 20px; float: right; margin-right: 20px; margin-top: 20px;">
							<div
								style="width: 100%; margin-top: 100px; font-size: 20px; font-weight: 700;">
							</div>
						</div>
						<div style="float: right;">
							<input type="button" value="장바구니 담기" class="one_basket">
							<input type="button" value="삭제하기" class="one_del">
						</div>
					</div>
					<!-- 제품한개 끝태그 -->
					<!-- 제품 한개-->
					<div class="basket_cont">
						<img class="basket_img"
							src="resources/images/products/product1.jpg">
						<div style="width: 60%; float: left; margin-top: 80px;">
							<a href=""
								style="font-size: 18px; margin-left: 10px; font-weight: 600;">가정용
								/ 캠핑용 액체 소방 스프레이</a> <br> <b
								style="margin-left: 10px; font-size: 14px;">100,000원</b>
						</div>
						<div style="width: 18%; float: left; height: 200px;">
							<input type="checkbox" name="select" value="제품명"
								style="width: 20px; height: 20px; float: right; margin-right: 20px; margin-top: 20px;">
							<div
								style="width: 100%; margin-top: 100px; font-size: 20px; font-weight: 700;">
							</div>
						</div>
						<div style="float: right;">
							<input type="button" value="장바구니 담기" class="one_basket">
							<input type="button" value="삭제하기" class="one_del">
						</div>
					</div>
					<!-- 제품한개 끝태그 -->
					<!-- 제품 한개-->
					<div class="basket_cont">
						<img class="basket_img"
							src="resources/images/products/product1.jpg">
						<div style="width: 60%; float: left; margin-top: 80px;">
							<a href=""
								style="font-size: 18px; margin-left: 10px; font-weight: 600;">가정용
								/ 캠핑용 액체 소방 스프레이</a> <br> <b
								style="margin-left: 10px; font-size: 14px;">100,000원</b>
						</div>
						<div style="width: 18%; float: left; height: 200px;">
							<input type="checkbox" name="select" value="제품명"
								style="width: 20px; height: 20px; float: right; margin-right: 20px; margin-top: 20px;">
							<div
								style="width: 100%; margin-top: 100px; font-size: 20px; font-weight: 700;">
							</div>
						</div>
						<div style="float: right;">
							<input type="button" value="장바구니 담기" class="one_basket">
							<input type="button" value="삭제하기" class="one_del">
						</div>
					</div>
					<!-- 제품한개 끝태그 -->
				</div>
			</div>
		</section>
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>