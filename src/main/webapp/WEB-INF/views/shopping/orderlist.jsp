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
	margin-top: 30px;
	border: 1px solid black;
	border-radius: 10px;
	width: 100%;
	height: 200px;
}

.basket_img {
	float: left;
	width: 20%;
	height: 80%;
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

.select_del:hover, .order_detail:hover, .order:hover {
	opacity: 0.8;
}

.order_detail {
	width: 200px;
	height: 50px;
	background-color: rgba(27, 90, 194, 0.8);
	color: white;
	border: 0;
	border-radius: 5px;
	margin-right: 20px;
}
</style>
<script>
        function selectAll(selectAll) {
            const checkboxes = document.getElementsByName('select');

            checkboxes.forEach((checkbox) => {
                checkbox.checked = selectAll.checked;
            });
        }
    </script>
<script type="text/javascript">
    	function orderOne_go(f) {
			f.action="/orderOneListform.do";
				f.submit();
		}
    </script>
</head>

<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents" style="border: 0px solid black;">
			<h3
				style="width: 100%; float: left; margin-top: 100px; font-size: 30px;">주문조회
				| 배송현황</h3>
			<div
				style="width: 100%; height: 82px; background-color: rgba(27, 90, 194, 1); float: left; margin-top: 10px;">
				<ul class="snb">
					<li class="li"><a href="/basketform.do?client_num=${id}" class="li_a" style="color: white;">장바구니</a></li>
					<li class="li"><a href="/wishlistform.do?client_num=${id}" class="li_a" 
						style="color: white;">위시리스트</a></li>
					<li class="li"><a href="/orderlistform.do?client_num=${id}" class="li_a current"
						style="color: white;">주문조회 | 배송현황</a></li>
				</ul>
			</div>

			<div
				style="width: 60%; margin: auto; height: auto; margin-top: 60px;">
				<div class="baskets">
					<!-- 제품 한개-->
					<div class="basket_cont">
						<img class="basket_img"
							src="resources/images/products/product1.jpg">
						<div style="width: 60%; float: left; margin-left: 10px;">
							<a href=""
								style="font-size: 18px; margin-left: 10px; font-weight: 600;">
								<p
									style="color: gray; font-size: 16px; opacity: 0.7; margin-bottom: 10px;">2023.03.02
									- 취소완료</p> <b style="font-size: 16px;">주문번호:</b> <b
								style="font-size: 14px">FENMBIEJS302</b>
							</a> <br> <b style="font-size: 14px;">1,000,000원</b>
						</div>
						<div style="float: right; margin-top: 30px;">
						<form>
							<input type="hidden" value="주문번호" name="주문번호">
							<input type="button" value="상세보기" class="order_detail"
								onclick="orderOne_go(this.form)"></form>
						</div>
					</div>
					<!-- 제품한개 끝태그 -->
					<!-- 제품 한개-->
					<div class="basket_cont">
						<img class="basket_img"
							src="resources/images/products/product1.jpg">
						<div style="width: 60%; float: left; margin-left: 10px;">
							<a href=""
								style="font-size: 18px; margin-left: 10px; font-weight: 600;">
								<p
									style="color: gray; font-size: 16px; opacity: 0.7; margin-bottom: 10px;">2023.03.02
									- 취소완료</p> <b style="font-size: 16px;">주문번호:</b> <b
								style="font-size: 14px">FENMBIEJS302</b>
							</a> <br> <b style="font-size: 14px;">1,000,000원</b>
						</div>
						<div style="float: right; margin-top: 30px;">
							<input type="button" value="상세보기" class="order_detail">
						</div>
					</div>
					<!-- 제품한개 끝태그 -->
					<!-- 제품 한개-->
					<div class="basket_cont">
						<img class="basket_img"
							src="resources/images/products/product1.jpg">
						<div style="width: 60%; float: left; margin-left: 10px;">
							<a href=""
								style="font-size: 18px; margin-left: 10px; font-weight: 600;">
								<p
									style="color: gray; font-size: 16px; opacity: 0.7; margin-bottom: 10px;">2023.03.02
									- 취소완료</p> <b style="font-size: 16px;">주문번호:</b> <b
								style="font-size: 14px">FENMBIEJS302</b>
							</a> <br> <b style="font-size: 14px;">1,000,000원</b>
						</div>
						<div style="float: right; margin-top: 30px;">
							<input type="button" value="상세보기" class="order_detail">
						</div>
					</div>
					<!-- 제품한개 끝태그 -->
					<!-- 제품 한개-->
					<div class="basket_cont">
						<img class="basket_img"
							src="resources/images/products/product1.jpg">
						<div style="width: 60%; float: left; margin-left: 10px;">
							<a href=""
								style="font-size: 18px; margin-left: 10px; font-weight: 600;">
								<p
									style="color: gray; font-size: 16px; opacity: 0.7; margin-bottom: 10px;">2023.03.02
									- 취소완료</p> <b style="font-size: 16px;">주문번호:</b> <b
								style="font-size: 14px">FENMBIEJS302</b>
							</a> <br> <b style="font-size: 14px;">1,000,000원</b>
						</div>
						<div style="float: right; margin-top: 30px;">
							<input type="button" value="상세보기" class="order_detail">
						</div>
					</div>
					<!-- 제품한개 끝태그 -->
					<!-- 제품 한개-->
					<div class="basket_cont">
						<img class="basket_img"
							src="resources/images/products/product1.jpg">
						<div style="width: 60%; float: left; margin-left: 10px;">
							<a href=""
								style="font-size: 18px; margin-left: 10px; font-weight: 600;">
								<p
									style="color: gray; font-size: 16px; opacity: 0.7; margin-bottom: 10px;">2023.03.02
									- 취소완료</p> <b style="font-size: 16px;">주문번호:</b> <b
								style="font-size: 14px">FENMBIEJS302</b>
							</a> <br> <b style="font-size: 14px;">1,000,000원</b>
						</div>
						<div style="float: right; margin-top: 30px;">
							<input type="button" value="상세보기" class="order_detail">
						</div>
					</div>
					<!-- 제품한개 끝태그 -->
					<!-- 제품 한개-->
					<div class="basket_cont">
						<img class="basket_img"
							src="resources/images/products/product1.jpg">
						<div style="width: 60%; float: left; margin-left: 10px;">
							<a href=""
								style="font-size: 18px; margin-left: 10px; font-weight: 600;">
								<p
									style="color: gray; font-size: 16px; opacity: 0.7; margin-bottom: 10px;">2023.03.02
									- 취소완료</p> <b style="font-size: 16px;">주문번호:</b> <b
								style="font-size: 14px">FENMBIEJS302</b>
							</a> <br> <b style="font-size: 14px;">1,000,000원</b>
						</div>
						<div style="float: right; margin-top: 30px;">
							<input type="button" value="상세보기" class="order_detail">
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