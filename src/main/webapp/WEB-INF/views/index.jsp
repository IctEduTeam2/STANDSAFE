<%@ page import="com.ict.statistics.model.vo.SalesSummaryVO"%>
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
<link rel="icon" type="image/x-icon"
	href="/resources/images/favicon.ico">

<!-- Link Swiper's CSS -->
<script type="text/javascript">
	function addToCart(button) {
		var prod_num = button.getAttribute('data-prodnum');
		var client_num = button.getAttribute('data-usernum');
		if ("${id}" == "" || "${id}" == null) {
			alert("로그인 후 이용 가능합니다.");
			return;
		} else {
			openModal(button); // 장바구니 추가 후 모달 열기, button을 전달
		}
	}

	// 모달 열기
	function openModal(button) {
		var prod_num = button.getAttribute('data-prodnum');
		var client_num = button.getAttribute('data-usernum');
		var modalId = 'myModal' + prod_num; // 모달의 ID 생성
		document.getElementById(modalId).style.display = 'block';
	}

	// 모달 닫기
	function closeModal(button) {
		var prod_num = button.getAttribute('data-prodnum');
		var client_num = button.getAttribute('data-usernum');
		var modalId = 'myModal' + prod_num; // 모달의 ID 생성

		document.getElementById(modalId).style.display = 'none';
	}

	// "쇼핑 계속하기" 버튼 클릭 시 이벤트 처리
	function continueShopping(button) {
		var prod_num = button.getAttribute('data-prodnum');
		var client_num = button.getAttribute('data-usernum');
		location.href = "/basketAdd.do?client_num=" + client_num + "&prod_num="
				+ prod_num + "&st=0";
		closeModal(button);
	}

	// "장바구니 보기" 버튼 클릭 시 이벤트 처리
	function viewCart(button) {
		var prod_num = button.getAttribute('data-prodnum');
		var client_num = button.getAttribute('data-usernum');
		location.href = "/basketAdd.do?client_num=" + client_num + "&prod_num="
				+ prod_num + "&st=1";
		closeModal(button);
	}
</script>
<link rel="stylesheet" href="resources/css/slide.css" />
<link rel="stylesheet" href="resources/css/basis.css" />
<style type="text/css">
/* 모달 스타일링 */
.modal {
	display: none;
	position: fixed;
	z-index: 100;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	max-width: 400px;
	margin: 0 auto; /* 가운데 정렬을 위해 좌우 마진을 자동으로 설정 */
	text-align: center;
	position: fixed; /* 모달을 고정 위치로 설정 */
	top: 50%; /* 화면 상단에서 절반의 위치로 이동 */
	left: 50%; /* 화면 왼쪽에서 절반의 위치로 이동 */
	transform: translate(-50%, -50%); /* 중앙 정렬 */
}
/* 닫기 버튼 스타일 */
.close {
	color: #888;
	float: right;
	font-size: 24px;
	font-weight: bold;
	cursor: pointer;
}

.close:hover {
	color: #000;
}
/* 버튼 스타일 */
.button-container {
	margin-top: 20px;
}

.btn {
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	margin: 0 10px;
}

.continue-shopping-button {
	background-color: #3498db;
	color: #fff;
}

.continue-shopping-button:hover {
	background-color: #2980b9;
}

.view-cart-button {
	background-color: #e74c3c;
	color: #fff;
}

.view-cart-button:hover {
	background-color: #c0392b;
}
</style>
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="Semantic/header.jsp"></jsp:include>
		<section id="contents">
			<article>
				<div class="slide slide_wrap">
					<c:forEach var="k" items="${popuplist}">
						<div class="slide_item item">
							<img src="resources/images/slide/${k.popup_img }"
								class="slide_img">
						</div>
					</c:forEach>
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
				<h3 style="color: red; margin-top: 50px;">BEST 상품</h3>
				<hr
					style="margin-bottom: 30px; margin-top: 20px; border: 3px solid #1b5ac2;">
				<ul class="prod-list">
					<c:forEach var="a" items="${productBestList2}">
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
									data-prodnum="${a.prod_num}" data-usernum="${id }">장바구니
									담기</button>
							</div></li>

						<div id="myModal${a.prod_num }" class="modal">
							<div class="modal-content">
								<h2 style="font-size: 24px; margin-bottom: 10px;">장바구니에 상품이
									추가되었습니다</h2>
								<p>선택한 상품: ${a.prod_name }</p>
								<div class="button-container">
									<button class="btn continue-shopping-button"
										onclick="continueShopping(this)" data-prodnum="${a.prod_num}"
										data-usernum="${id }">쇼핑 계속하기</button>
									<button class="btn view-cart-button" onclick="viewCart(this)"
										data-prodnum="${a.prod_num}" data-usernum="${id }">장바구니
										보기</button>
								</div>
							</div>
						</div>
					</c:forEach>
				</ul>
			</div>
			<script type="text/javascript">
				
			</script>
			<div id="event">
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
									data-prodnum="${a.prod_num}" data-usernum="${id }">장바구니
									담기</button>
							</div></li>

						<div id="myModal${a.prod_num }" class="modal">
							<div class="modal-content">
								<h2 style="font-size: 24px; margin-bottom: 10px;">장바구니에 상품이
									추가되었습니다</h2>
								<p>선택한 상품: ${a.prod_name }</p>
								<div class="button-container">
									<button class="btn continue-shopping-button"
										onclick="continueShopping(this)" data-prodnum="${a.prod_num}"
										data-usernum="${id }">쇼핑 계속하기</button>
									<button class="btn view-cart-button" onclick="viewCart(this)"
										data-prodnum="${a.prod_num}" data-usernum="${id }">장바구니
										보기</button>
								</div>
							</div>
						</div>
					</c:forEach>
				</ul>
			</div>
			<div id="event">
				<h3 style="color: red; margin-top: 50px;">할인 상품</h3>
				<hr
					style="margin-bottom: 30px; margin-top: 20px; border: 3px solid #1b5ac2;">
				<ul class="prod-list">
					<c:forEach var="a" items="${productSaleList}">
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
									data-prodnum="${a.prod_num}" data-usernum="${id }">장바구니
									담기</button>
							</div></li>

						<div id="myModal${a.prod_num }" class="modal">
							<div class="modal-content">
								<h2 style="font-size: 24px; margin-bottom: 10px;">장바구니에 상품이
									추가되었습니다</h2>
								<p>선택한 상품: ${a.prod_name }</p>
								<div class="button-container">
									<button class="btn continue-shopping-button"
										onclick="continueShopping(this)" data-prodnum="${a.prod_num}"
										data-usernum="${id }">쇼핑 계속하기</button>
									<button class="btn view-cart-button" onclick="viewCart(this)"
										data-prodnum="${a.prod_num}" data-usernum="${id }">장바구니
										보기</button>
								</div>
							</div>
						</div>
					</c:forEach>
				</ul>
			</div>
		</section>
		<jsp:include page="Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>