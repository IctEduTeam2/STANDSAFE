<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>STANDSAFE</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<!-- Link Swiper's CSS -->
<script type="text/javascript">
	function addToCart(button) {
		var prod_num = button.getAttribute('data-prodnum');
		var client_num = button.getAttribute('data-usernum');
		location.href = "/basketAdd.do?client_num=" + client_num + "&prod_num="
				+ prod_num;
	}
</script>
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
						<c:forEach var="k" items="${popuplist}">
							<img src="resources/images/slide/${k.popup_img }"
								class="slide_img">
						</c:forEach>
					</div>
					<div class="slide_prev_button slide_button">◀</div>
					<div class="slide_next_button slide_button">▶</div>
					<ul class="slide_pagination"></ul>
				</div>
				<script src="resources/js/slide.js"></script>
			</article>
			<div
				style="width: 100%; height: 185px; float: left; margin-bottom: 50px; margin-top: 20px;">
				<c:forEach var="a" items="${productBestList}">
					<a href="/productOneListform.do?prod_num=${a.prod_num }"> <img
						src="resources/images/products/${a.prod_img }"
						style="width: 184px; height: 100%; border: 1px solid black;"></a>
				</c:forEach>
			</div>
			<form style="float: right;">
				<input type="search" placeholder="검색어를 입력하세요."
					style="width: 300px; height: 40px; float: left;"> <input
					type="image" src="resources/images/search.png" alt="검색버튼"
					style="width: 18px; height: 25px; padding: 6px; float: left; border: 1px solid black;">
			</form>
			<div id="best">
				<h3 style="color: red; margin-top: 50px;">최신 상품</h3>
				<hr
					style="margin-bottom: 30px; margin-top: 20px; border: 3px solid #1b5ac2;">
				<ul class="prod-list">
					<c:forEach var="a" items="${productNewList}">
						<li class="product"><img
							src="resources/images/products/${a.prod_img }"
							class="product_img">
						<p class="product_text" style="margin-top: 10px;">
								${a.prod_name }</p> <br> <c:choose>
								<c:when test="${a.prod_sale == '0'}">
									<p class="product_text">
										<fmt:formatNumber value="${a.prod_price}" type="number"
											pattern="#,### 원" />
									</p>
								</c:when>
								<c:otherwise>
									<p class="product_text">
										<del>
											<fmt:formatNumber value="${a.prod_price}" type="number"
												pattern="#,### 원" />
										</del>
										▶ <b style="color: red; font-size: 14px;"><fmt:formatNumber
												value="${a.prod_sale}" type="number" pattern="#,### 원" /></b> <b
											style="font-size: 14px;"> (${((a.prod_price - a.prod_sale) / a.prod_price * 100).intValue()}%↓)</b>
									</p>
								</c:otherwise>
							</c:choose>
							<p class="product_text">
							<div class="caption">
								<button class="product_btn1"
									onclick="window.location.href='/productOneListform.do?prod_num=${a.prod_num}'">상세보기</button>
								<button class="product_btn2" onclick="addToCart(this)"
									data-prodnum="${a.prod_num}" data-usernum="${id }">장바구니 담기</button>
							</div></li>
					</c:forEach>
				</ul>
			</div>
			<script type="text/javascript">
			</script>
			<div id="event">
				<h3 style="color: red;">필수품</h3>
				<hr
					style="margin-bottom: 30px; margin-top: 20px; border: 3px solid #1b5ac2;">
				<ul class="prod-list">
					<li class="product"><img
						src="resources/images/products/product1.jpg" class="product_img">
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
	${msg }
</body>
</html>