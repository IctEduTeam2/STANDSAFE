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
	background-color: rgba(0, 0, 0, 0.3);
	color: floralwhite;
	border: 0;
	border-radius: 5px;
	margin-right: 20px;
}/* 모달 스타일링 */
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
		var prod_high = button.getAttribute('data-high');
		var prod_low = button.getAttribute('data-low');
		location.href = "/basketAdd2.do?client_num=" + client_num + "&prod_num="
				+ prod_num + "&prod_high=" + prod_high + "&prod_low=" + prod_low + "&sort=1";
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
	function changeSortOrder(sortOrder, clickedButton) {
	    // 클릭한 버튼에만 스타일을 적용합니다.
	    const buttons = document.querySelectorAll('button');
	    buttons.forEach(button => {
	        button.style.fontWeight = 'normal';
	    });

	    clickedButton.style.fontWeight = '800';

	    // 서버로 정렬 순서를 전달하는 로직을 추가하세요.
	    // location.href를 이용하여 페이지를 이동하도록 할 때, 스타일 변경 코드보다 이후에 위치시켜야 합니다.
	    location.href = "/productsform.do?prod_high=${prod_high}&prod_low=${prod_low}&sort=" + sortOrder;
	}

</script>
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents">
			<c:choose>
				<c:when test="${prod_high == '1' && prod_low == '1'}">
					<div
						style="float: left; width: 100%; margin-bottom: 30px; margin-top: 100px;">
						<b style="font-size: 22px;">■ 소방/안전 -</b> <b>소화기</b>
					</div>
					<hr>
					<div style="float: left; width: 100%; margin: 30px 0;">
						<button class="cate"
							onclick="window.location.href='/productsform.do?prod_high=1&prod_low=1&sort=1'">소화기</button>
						<button class="current"
							onclick="window.location.href='/productsform.do?prod_high=1&prod_low=2&sort=1'">화재
							감지 | 대피</button>
					</div>
				</c:when>
				<c:when test="${prod_high == '1' && prod_low == '2'}">
					<div
						style="float: left; width: 100%; margin-bottom: 30px; margin-top: 100px;">
						<b style="font-size: 22px;">■ 소방/안전 -</b> <b>화재 감지 | 대피</b>
					</div>
					<hr>
					<div style="float: left; width: 100%; margin: 30px 0;">
						<button class="current"
							onclick="window.location.href='/productsform.do?prod_high=1&prod_low=1&sort=1'">소화기</button>
						<button class="cate"
							onclick="window.location.href='/productsform.do?prod_high=1&prod_low=2&sort=1'">화재
							감지 | 대피</button>
					</div>
				</c:when>
				<c:when test="${prod_high == '2' && prod_low == '1'}">
					<div
						style="float: left; width: 100%; margin-bottom: 30px; margin-top: 100px;">
						<b style="font-size: 22px;">■ 재난/응급/긴급 -</b> <b>구급함 | 제세동기</b>
					</div>
					<hr>
					<div style="float: left; width: 100%; margin: 30px 0;">
						<button class="cate"
							onclick="window.location.href='/productsform.do?prod_high=2&prod_low=1&sort=1'">구급함
							| 제세동기</button>
						<button class="current"
							onclick="window.location.href='/productsform.do?prod_high=2&prod_low=2&sort=1'">재난
							안전용품</button>
						<button class="current"
							onclick="window.location.href='/productsform.do?prod_high=2&prod_low=3&sort=1'">방역
							안점용품</button>
					</div>
				</c:when>
				<c:when test="${prod_high == '2' && prod_low == '2'}">
					<div
						style="float: left; width: 100%; margin-bottom: 30px; margin-top: 100px;">
						<b style="font-size: 22px;">■ 재난/응급/긴급 -</b> <b>재난 안전용품</b>
					</div>
					<hr>
					<div style="float: left; width: 100%; margin: 30px 0;">
						<button class="current"
							onclick="window.location.href='/productsform.do?prod_high=2&prod_low=1&sort=1'">구급함
							| 제세동기</button>
						<button class="cate"
							onclick="window.location.href='/productsform.do?prod_high=2&prod_low=2&sort=1'">재난
							안전용품</button>
						<button class="current"
							onclick="window.location.href='/productsform.do?prod_high=2&prod_low=3&sort=1'">방역
							안점용품</button>
					</div>
				</c:when>
				<c:when test="${prod_high == '2' && prod_low == '3'}">
					<div
						style="float: left; width: 100%; margin-bottom: 30px; margin-top: 100px;">
						<b style="font-size: 22px;">■ 재난/응급/긴급 -</b> <b>방역 안점용품</b>
					</div>
					<hr>
					<div style="float: left; width: 100%; margin: 30px 0;">
						<button class="current"
							onclick="window.location.href='/productsform.do?prod_high=2&prod_low=1&sort=1'">구급함
							| 제세동기</button>
						<button class="current"
							onclick="window.location.href='/productsform.do?prod_high=2&prod_low=2&sort=1'">재난
							안전용품</button>
						<button class="cate"
							onclick="window.location.href='/productsform.do?prod_high=2&prod_low=3&sort=1'">방역
							안점용품</button>
					</div>
				</c:when>
				<c:when test="${prod_high == '3' && prod_low == '1'}">
					<div
						style="float: left; width: 100%; margin-bottom: 30px; margin-top: 100px;">
						<b style="font-size: 22px;">■ 일상/기타 -</b> <b>마스크</b>
					</div>
					<hr>
					<div style="float: left; width: 100%; margin: 30px 0;">
						<button class="cate"
							onclick="window.location.href='/productsform.do?prod_high=3&prod_low=1&sort=1'">마스크</button>
						<button class="current"
							onclick="window.location.href='/productsform.do?prod_high=3&prod_low=2&sort=1'">위생장갑</button>
						<button class="current"
							onclick="window.location.href='/productsform.do?prod_high=3&prod_low=3&sort=1'">통조림
							| 비상식량</button>
					</div>
				</c:when>
				<c:when test="${prod_high == '3' && prod_low == '2'}">
					<div
						style="float: left; width: 100%; margin-bottom: 30px; margin-top: 100px;">
						<b style="font-size: 22px;">■ 일상/기타 -</b> <b>위생장갑</b>
					</div>
					<hr>
					<div style="float: left; width: 100%; margin: 30px 0;">
						<button class="current"
							onclick="window.location.href='/productsform.do?prod_high=3&prod_low=1&sort=1'">마스크</button>
						<button class="cate"
							onclick="window.location.href='/productsform.do?prod_high=3&prod_low=2&sort=1'">위생장갑</button>
						<button class="current"
							onclick="window.location.href='/productsform.do?prod_high=3&prod_low=3&sort=1'">통조림
							| 비상식량</button>
					</div>
				</c:when>
				<c:when test="${prod_high == '3' && prod_low == '3'}">
					<div
						style="float: left; width: 100%; margin-bottom: 30px; margin-top: 100px;">
						<b style="font-size: 22px;">■ 일상/기타 -</b> <b>통조림 | 비상식량</b>
					</div>
					<hr>
					<div style="float: left; width: 100%; margin: 30px 0;">
						<button class="current"
							onclick="window.location.href='/productsform.do?prod_high=3&prod_low=1&sort=1'">마스크</button>
						<button class="current"
							onclick="window.location.href='/productsform.do?prod_high=3&prod_low=2&sort=1'">위생장갑</button>
						<button class="cate"
							onclick="window.location.href='/productsform.do?prod_high=3&prod_low=3&sort=1'">통조림
							| 비상식량</button>
					</div>
				</c:when>
			</c:choose>
			<hr>
			<div style="width: 90%; margin: auto;">
				<div
					style="padding: 15px 10px; border: 1px solid black; width: 100%; float: left; margin-top: 30px;">
					<div style="float: left;">등록제품: ${count } 개</div>
					<div style="float: right;">
						<%-- <button style="border: 0; background-color: white;" onclick="window.location.href='/productsform.do?prod_high=${prod_high}&prod_low=&${prod_low}&sort=1'">
						 --%>
<button style="border: 0; background-color: white;" onclick="changeSortOrder(1, this)">최신순
</button>
|
<button style="border: 0; background-color: white;" onclick="changeSortOrder(2, this)">가나다순</button>
|
<button style="border: 0; background-color: white;" onclick="changeSortOrder(3, this)">낮은 가격순</button>
|
<button style="border: 0; background-color: white;" onclick="changeSortOrder(4, this)">인기순</button>

					</div>
				</div>

				<div style="width: 100%; float: left; margin-top: 100px;">
					<div id="best">
						<ul class="prod-list">
							<c:forEach var="a" items="${prodlist }">
								<li class="product"><img
									src="resources/images/products/${a.prod_img }"
									class="product_img">
									<p class="product_text">${a.prod_name }</p> <br> <c:choose>
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
														value="${a.prod_sale}" type="number" pattern="#,### 원" /></b>
												<b style="font-size: 14px;"> (${((a.prod_price - a.prod_sale) / a.prod_price * 100).intValue()}%↓)</b>
											</p>
										</c:otherwise>
									</c:choose>
									<div class="caption">
								<button class="product_btn1"
									onclick="window.location.href='/productOneListform.do?prod_num=${a.prod_num}'">상세보기</button>
								<button class="product_btn2" onclick="addToCart(this)"
									data-prodnum="${a.prod_num}" data-usernum="${id }">장바구니 담기</button>
							</div></li>
							
							<div id="myModal${a.prod_num }" class="modal">
							<div class="modal-content">
								<h2 style="font-size: 24px; margin-bottom: 10px;">장바구니에 상품이 추가되었습니다</h2>
								<p>선택한 상품: ${a.prod_name }</p>
								<div class="button-container">
									<button class="btn continue-shopping-button"
										onclick="continueShopping(this)" data-prodnum="${a.prod_num}" data-usernum="${id }" data-high="${prod_high }" data-low="${prod_low }">쇼핑 계속하기</button>
									<button class="btn view-cart-button" onclick="viewCart(this)" data-prodnum="${a.prod_num}" data-usernum="${id }">장바구니
										보기</button>
								</div>
							</div>
						</div>
							</c:forEach>
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