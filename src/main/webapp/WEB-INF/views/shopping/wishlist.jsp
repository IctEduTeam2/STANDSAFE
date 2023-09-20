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
	height: 200px;
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
function addToCart(id, prodNum) {
	location.href = "/cartadd.do?client_num=" + id + "&prod_num=" + prodNum + "&quantity=1&st=2";
	alert("상품을 장바구니에 담았습니다.");
}

function deleteItem(id, prodNum) {
	location.href = "/deleteWish.do?client_num=" + id + "&prod_num=" + prodNum;
    alert("상품을 위시리스트에서 삭제하였습니다.");
}

function deleteSelectedProducts() {
	  // 체크된 항목을 배열로 저장
	  const selectedProducts = [];
	  const checkboxes = document.querySelectorAll('.productCheckbox');
	  checkboxes.forEach(checkbox => {
	    if (checkbox.checked) {
	      selectedProducts.push(checkbox.value);
	    }
	  });

	  // 배열을 문자열로 변환하여 hidden input에 설정
	  document.getElementById('selectedProducts').value = selectedProducts.join(',');

	  if (selectedProducts.length === 0) {
		    alert('삭제할 상품이 선택해주세요');
		  } else {
		    document.getElementById('productWishDelForm').submit();
		    alert('선택한 상품을 삭제하였습니다.');
		  }
	}
function basketSelectedProducts() {
	  // 체크된 항목을 배열로 저장
	  const selectedProducts = [];
	  const checkboxes = document.querySelectorAll('.productCheckbox');
	  checkboxes.forEach(checkbox => {
	    if (checkbox.checked) {
	      selectedProducts.push(checkbox.value);
	    }
	  });

	  // 배열을 문자열로 변환하여 hidden input에 설정
	  document.getElementById('selectedProducts2').value = selectedProducts.join(',');

	  if (selectedProducts.length === 0) {
		    alert('장바구니에 추가할 상품을 선택해주세요');
		  } else {
		    document.getElementById('productWishBasketForm').submit();
		    alert('선택한 상품을 장바구니에 담았습니다.');
		  }
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
					<li class="li"><a href="/basketform.do?client_num=${id}"
						class="li_a" style="color: white;">장바구니</a></li>
					<li class="li"><a href="/wishlistform.do?client_num=${id}"
						class="li_a current" style="color: white;">위시리스트</a></li>
					<li class="li"><a href="/orderlistform.do?client_num=${id}"
						class="li_a" style="color: white;">주문조회 | 배송현황</a></li>
				</ul>
			</div>

			<div
				style="width: 60%; margin: auto; height: auto; margin-top: 60px;">
					<c:choose>
						<c:when test="${empty wishlist }">
							<div
								style="float: left; margin: auto; text-align: center; border: 1px solid black; width: 100%; height: 600px; margin-top: 50px;">
								<h1 style="text-align: center;">찜한 상품이 존재하지 않습니다.</h1>
							</div>
						</c:when>
						<c:otherwise>
				<div
					style="width: 100%; height: auto; margin-top: 100px; float: left;">
					<div style="float: left; text-align: center; margin: 0;">
						<input type="checkbox" name="select" value="selectall"
							onclick="selectAll(this)" style="width: 20px; height: 20px;">
						<b style="font-size: 18px;">전체 선택</b>
					</div>
					<div style="float: right">
						<input type="button" value="선택항목 담기" class="select_del"
							onclick="basketSelectedProducts()"> <input type="button"
							value="선택항목 삭제" class="select_del"
							onclick="deleteSelectedProducts()">
					</div>
				</div>
				<div class="baskets">
							<!-- 제품 한개-->
							<c:forEach var="a" items="${prodlist }">
								<form id="productWishDelForm" method="post"
									action="/deleteSelectedWish.do">
									<!-- 선택된 항목을 담을 hidden input -->
									<input type="hidden" name="selectedProducts"
										id="selectedProducts" value="${a.prod_num }" /> <input
										type="hidden" name="client_num" id="client_num" value="${id}" />
								</form>
								<form id="productWishBasketForm" method="post"
									action="/bsketSelectedWish.do">
									<!-- 선택된 항목을 담을 hidden input -->
									<input type="hidden" name="selectedProducts"
										id="selectedProducts2" value="${a.prod_num }" /> <input
										type="hidden" name="client_num" id="client_num" value="${id}" />
								</form>
								<div class="basket_cont">
									<img class="basket_img"
										src="resources/images/products/${a.prod_img }">
									<div style="width: 60%; float: left; margin-top: 80px;">
										<a href="/productOneListform.do?prod_num=${a.prod_num }"
											style="font-size: 18px; margin-left: 10px; font-weight: 600;">${a.prod_name}</a>
										<br> <b style="margin-left: 10px; font-size: 14px;"><c:choose>
												<c:when test="${a.prod_sale == '0'}">
													<fmt:formatNumber value="${a.prod_price}" type="number"
														pattern="#,### 원" />
												</c:when>
												<c:otherwise>
													<del>
														<fmt:formatNumber value="${a.prod_price}" type="number"
															pattern="#,### 원" />
													</del>
										▶ <b style="color: red; font-size: 14px;"><fmt:formatNumber
															value="${a.prod_sale}" type="number" pattern="#,### 원" /></b>
													<b style="font-size: 14px;"> (${((a.prod_price - a.prod_sale) / a.prod_price * 100).intValue()}%↓)</b>
												</c:otherwise>
											</c:choose></b>
									</div>
									<div style="width: 18%; float: left; height: 100px;">
										<input type="checkbox" name="select" value="${a.prod_num }"
											class="productCheckbox"
											style="width: 20px; height: 20px; float: right; margin-right: 20px; margin-top: 20px;">
									</div>
									<div style="float: right;">
										<input type="button" value="장바구니 담기" class="one_basket"
											onclick="addToCart('${id}', '${a.prod_num}')"> <input
											type="button" value="삭제하기" class="one_del"
											onclick="deleteItem('${id}', '${a.prod_num}')">

									</div>
								</div>
							</c:forEach>
							<!-- 제품한개 끝태그 -->
				</div>
						</c:otherwise>
					</c:choose>
			</div>
		</section>
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>