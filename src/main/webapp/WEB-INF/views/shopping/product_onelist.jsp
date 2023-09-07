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
} /* 모달 스타일링 */
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
	background-color: white;
	margin: 20% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
	text-align: center;
}

.close {
	position: absolute;
	right: 10px;
	top: 10px;
	font-size: 20px;
	font-weight: bold;
	cursor: pointer;
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

<script>
	// 수량 변경 시 호출되는 함수
	function updateTotalPrice() {
		var quantity = parseInt(document.getElementById('quantityInput').value); // 입력된 수량 가져오기
		var price = parseInt('${pvo.prod_price}'); // 상품 가격 가져오기
		var sale = parseInt('${pvo.prod_sale}'); // 세일상품인지 체크
		var total = quantity * price; // 총 상품금액 계산
		var saletotal = quantity * sale;

		// 최소 수량 확인
		if (quantity <= 0) {
			alert("최소 1개 이상 입력하세요.");
			document.getElementById('quantityInput').value = 1;
			var totalPriceText = price.toLocaleString() + quantityText;
			document.getElementById('totalPrice').textContent = totalPriceText;
		} else if (sale == 0) {
			document.getElementById('totalPrice').textContent = total
					.toLocaleString()
					+ ' 원 (' + quantity + '개)';
		} else {
			// 세일일때
			document.getElementById('totalPrice').textContent = saletotal
					.toLocaleString()
					+ ' 원 (' + quantity + '개)';
		}
	}
	function just_buy(f) {
		var quantity = parseInt(document.getElementById('quantityInput').value);
		f.action = "/justbuy.do?quantity=" + quantity + "&client_num=19"
				+ "&prod_num=" + ${pvo.prod_num};
		f.submit();
	}
	function cart_add(f) {
		openModal(); // 장바구니 추가 후 모달 열기
	}
	function wish_add(f) {
		f.action = "/wishadd.do?client_num=19" + "&prod_num=" + ${pvo.prod_num};
		f.submit();
	}

	//모달 열기
	function openModal(f) {
		document.getElementById('myModal').style.display = 'block';
	}

	// 모달 닫기
	function closeModal() {
		document.getElementById('myModal').style.display = 'none';
	}

	// "쇼핑 계속하기" 버튼 클릭 시 이벤트 처리
	function continueShopping(f) {
		var quantity = parseInt(document.getElementById('quantityInput').value);
		f.action = "/cartadd.do?quantity=" + quantity + "&client_num=19"
				+ "&prod_num=" + ${pvo.prod_num} + "&st=0";
		f.submit();
		closeModal();
	}

	// "장바구니 보기" 버튼 클릭 시 이벤트 처리
	function viewCart(f) {
		var quantity = parseInt(document.getElementById('quantityInput').value);
		f.action = "/cartadd.do?quantity=" + quantity + "&client_num=19"
				+ "&prod_num=" + ${pvo.prod_num} + "&st=1";
		f.submit();
		closeModal();
	}
</script>

</head>

<body onload="InitializeStaticMenu();">
<script type="text/javascript">
    var alertMessage = "${alertMessage}";
    if (alertMessage) {
        alert(alertMessage);
    }
</script>
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents" style="margin-top: 150px;">
			<div style="width: 50%; margin: auto;">
				<div style="float: left;">
					<img src="resources/images/products/${pvo.prod_img }"
						style="width: 420px; height: 490px;">
				</div>

				<div style="float: right; width: 50%;">
					<form method="post" enctype="multipart/form-data">
						<table>
							<thead>
								<tr>
									<th>${pvo.prod_name }</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>판매가</td>
									<td><c:choose>
											<c:when test="${pvo.prod_sale == '0'}">
												<fmt:formatNumber value="${pvo.prod_price}" type="number"
													pattern="#,###원" />
											</c:when>
											<c:otherwise>
												<del>
													<fmt:formatNumber value="${pvo.prod_price}" type="number"
														pattern="#,### 원" />
												</del>
        ▶ <b style="color: red; font-size: 14px;"><fmt:formatNumber
														value="${pvo.prod_sale}" type="number" pattern="#,### 원" /></b>
												<b style="font-size: 14px;"> (${((pvo.prod_price - pvo.prod_sale) / pvo.prod_price * 100).intValue()}%↓)</b>
											</c:otherwise>
										</c:choose></td>
								</tr>
								<tr>
									<td>배송비</td>
									<td>3,000 원</td>
								</tr>
								<tr>
									<td>${pvo.prod_name}</td>
									<td><input type="number" value="1" id="quantityInput"
										style="width: 50px;" onchange="updateTotalPrice()"></td>
								</tr>
								<tr>
									<td><b>총 상품금액 (수량):</b></td>
									<td><b id="totalPrice"><c:choose>
												<c:when test="${pvo.prod_sale == '0'}">
													<fmt:formatNumber value="${pvo.prod_price}" type="number"
														pattern="#,### 원" /> (1개)
										</c:when>
												<c:otherwise>
													<fmt:formatNumber value="${pvo.prod_sale}" type="number"
														pattern="#,### 원" /> (1개)
										</c:otherwise>
											</c:choose></b></td>
								</tr>
								<tr>
									<td colspan="2" style=""><input
										style="width: 100px; float: left; height: 40px; font-weight: 700; background-color: rgba(27, 90, 194, 0.8); color: white; border: 0; border-radius: 5px; margin-bottom: 5px; margin-right: 20px;"
										type="button" value="바로구매" onclick="just_buy(this.form)">
										<input
										style="width: 100px; float: right; height: 40px; font-weight: 700; background-color: rgba(0, 0, 0, 0.3); color: white; border: 0; border-radius: 5px; margin-left: 15px;"
										type="button" value="CART" onclick="cart_add(this.form)">
										<input
										style="width: 100px; float: right; height: 40px; font-weight: 700; background-color: rgba(0, 0, 0, 0.3); color: white; border: 0; border-radius: 5px;"
										type="button" value="WISH" onclick="wish_add(this.form)">
								</tr>
							</tbody>
						</table>
						<div id="myModal" class="modal">

						<div class="modal-content">
							<span class="close" onclick="closeModal()">&times;</span>
							<h2>장바구니에 상품이 추가되었습니다</h2>
							<button onclick="continueShopping(this.form)">쇼핑 계속하기</button>
							<button onclick="viewCart(this.form)">장바구니 보기</button>
						</div></div>
					</form>
				</div>
			</div>
			<div style="width: 100%; float: left; margin-top: 70px;">
				<div class="function" id="test">
					<button onclick="goToScroll('a')">Detail</button>
					<button onclick="goToScroll('b')">Review</button>
					<button onclick="goToScroll('c')">FAQ</button>
				</div>
				<div style="width: 70%; margin: auto;">
					<div class="detail a" style="width: 100%; margin: auto;">
						<h1 style="text-align: center; margin: 80px 0; font-size: 60px;">Detail</h1>
						<div style="width: 70%; text-align: center; margin: auto">
							<img src="resources/images/products/${pvo.prod_detail }">
						</div>
					</div>
					<hr>
					<div class="review b">
						<h1 style="text-align: center; margin: 80px 0; font-size: 60px;">Review</h1>
						리뷰
					</div>
					<hr>
					<div class="faq c">
						<h1 style="text-align: center; margin: 80px 0; font-size: 60px;">FAQ</h1>
						faq
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

