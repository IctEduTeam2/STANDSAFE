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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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

/* paging */

table tfoot ol.paging {
    list-style: none;
    text-align: center; /* 가운데 정렬을 위한 변경 */
}
table tfoot ol.paging li {
    display: inline-block; /* 가로 정렬을 위해 float 제거하고 inline-block으로 변경 */
     margin-right: 8px; 
}


table tfoot ol.paging li a {
	display: block;
	padding: 3px 7px;
	border: 1px solid #6c98c2;
	color: #2f313e;
	 font-weight: bold; 
}

table tfoot ol.paging li a:hover {
	background: #6c98c2;
	color: white;
	font-weight: bold;
}



.disable {
	padding: 3px 7px;
	border: 1px solid silver;
	color: silver;
}

.now {
	padding: 3px 7px;
	border: 1px solid #1b5ac2;
	background: #1b5ac2;
	color: white;
	font-weight: bold;
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
		var prodquantity = parseInt('${pvo.prod_amount}'); // 상품의 재고량

		// 최소 수량 확인
		if (quantity <= 0) {
			alert("최소 주문수량은 1개 입니다.");
			document.getElementById('quantityInput').value = 1;
			var totalPriceText = price.toLocaleString() + quantityText;
			document.getElementById('totalPrice').textContent = totalPriceText;
		} else if (quantity > prodquantity) {
			alert("재고량을 초과구매 불가능합니다.");
			document.getElementById('quantityInput').value = prodquantity;
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
		if ("${id}" == "" || "${id}" == null) {
			alert("로그인 후 이용 가능합니다.");
			return;
		} else {
			var quantity = parseInt(document.getElementById('quantityInput').value);
			f.action = "/justbuy.do?quantity=" + quantity + "&client_num=" + ${id}+"&prod_num=" + ${pvo.prod_num};
			f.submit();
		}
	}
	function cart_add(f) {
		if ("${id}" == "" || "${id}" == null) {
			alert("로그인 후 이용 가능합니다.");
			return;
		} else {
			openModal(); // 장바구니 추가 후 모달 열기
		}
	}
	function wish_add(f) {
		if ("${id}" == "" || "${id}" == null) {
			alert("로그인 후 이용 가능합니다.");
			return;
		} else {
			f.action = "/wishadd.do?client_num=" + ${id}+"&prod_num=" + ${pvo.prod_num};
			f.submit();
		}
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
		f.action = "/cartadd.do?quantity=" + quantity + "&client_num=" + ${id} +"&prod_num=" + ${pvo.prod_num}+"&st=0";
		f.submit();
		closeModal();
	}

	// "장바구니 보기" 버튼 클릭 시 이벤트 처리
	function viewCart(f) {
		var quantity = parseInt(document.getElementById('quantityInput').value);
		f.action = "/cartadd.do?quantity=" + quantity + "&client_num=" + ${id}+"&prod_num=" + ${pvo.prod_num}+"&st=1";
		f.submit();
		closeModal();
	}
</script>
<script type="text/javascript">

</script>
</head>
<body onload="InitializeStaticMenu();">
	<script type="text/javascript">
		var alertMessage = "${alertMessage}";
		if (alertMessage) {
			alert(alertMessage);
		}
		var test = "${test}";
		if(test==1) {
				var location = document.querySelector("." + b).offsetTop;
				window.scrollTo({
					top : location,
					behavior : 'smooth'
				});
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
								<h2 style="font-size: 24px; margin-bottom: 10px;">장바구니에 상품이 추가되었습니다</h2>
								<p>선택한 상품: ${pvo.prod_name }</p>
								<div class="button-container">
									<button class="btn continue-shopping-button"
										onclick="continueShopping(this.form)">쇼핑 계속하기</button>
									<button class="btn view-cart-button" onclick="viewCart(this.form)">장바구니
										보기</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div style="width: 100%; float: left; margin-top: 70px;">
				<div class="function" id="test">
					<button onclick="goToScroll('a')">Detail</button>
					<button onclick="goToScroll('b')">Review</button>
					<button onclick="goToScroll('c')">QnA</button>
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
							<c:choose>
								<c:when test="${empty list}"><h3 style="text-align: center;">현재 상품은 리뷰가 존재하지 않습니다.</h3>
								</c:when>
								
								<c:otherwise>
								<div style="font-weight: 800; width: 90%; margin: auto;"><div style="float: right;">총리뷰수: ${paging.totalRecord }</div></div>
								<div style="width: 90%; margin: auto;">
                            		<hr style="margin-top:5px; margin-bottom: 20px;">
									<c:forEach var="k" items="${list}" varStatus="vs">
										<div class="review_box" style="width: 100%; float: left; ">
								   			<div style=" width: 100%; float: left;"><div style="float: left; padding: 0 60px; margin: auto; font-weight: 800;">
												${k.re_writer }
                                        		</div>
                                        		<div class="contentContainer" style="float: left; padding: 0 10px; word-break:break-all; width: 930px; border-left: 1px solid black;">
													${k.re_content}
                                        		</div><script>
var contentElements = document.querySelectorAll(".contentContainer");
contentElements.forEach(function(element) {
    element.style.height = element.scrollHeight > 100 ? "auto" : "100px";
});
</script>
                            					<hr style="margin: 20px 0;">
											</div>
										</div>
									
									</c:forEach>
									</div>
											
						<table class="m_table">				
						<tfoot>
								<tr>
									<td colspan="2">
										<ol class="paging">
											<!-- 이전버튼 : 첫블럭이면 비활성화-->
											<c:choose>
												<c:when test="${paging.beginBlock <= paging.pagePerBlock }">
													<li class="disable">이전으로</li>
												</c:when>
												<c:otherwise>
													<li><a href="/productOneListform.do?prod_num=${prod_num }&cPage=${paging.beginBlock-paging.pagePerBlock }">이전으로</a></li>
												</c:otherwise>
											</c:choose>	
											<c:forEach begin="${paging.beginBlock }" end="${paging.endBlock }" step="1" var="k">
												<c:if test="${k == paging.nowPage }">
													<!--현재페이지와 같으면  -->
													<li class="now">${k }</li>
												</c:if>
												<c:if test="${k != paging.nowPage }">
													<li><a href="/productOneListform.do?prod_num=${prod_num }&cPage=${k }"> ${k }</a></li>
												</c:if>
											</c:forEach>
															
											<!-- 이후버튼  -->	
											<c:choose>
												<c:when test="${paging.endBlock >= paging.totalPage }">
													<li class="disable">
					다음으로</li>
												</c:when>
												<c:otherwise>
													<li><a href="/productOneListform.do?prod_num=${prod_num }&cPage=${paging.beginBlock+paging.pagePerBlock }">다음으로</a></li>
												</c:otherwise>
											</c:choose>					
										</ol>
									</td>
								</tr>
						</tfoot>
					</table>
									</c:otherwise>
									</c:choose>
					</div>
					</div>
					<div style="width: 70%; margin: auto;">
					<hr>
					</div>
					<div class="faq c">
						<h1 style="text-align: center; margin: 80px 0; font-size: 60px;">QnA</h1>
						<h3 style="text-align: center;">현재 상품은 QnA가 존재하지 않습니다.</h3>
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

