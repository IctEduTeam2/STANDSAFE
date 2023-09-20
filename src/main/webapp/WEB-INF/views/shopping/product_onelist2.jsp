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

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://underscorejs.org/underscore-min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.blockUI/2.70.0-2014.11.23/jquery.blockUI.min.js"></script>
   <script src="https://unpkg.com/floatthead"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
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
			alert("최소 1개 이상 입력하세요.");
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

<body onload="InitializeStaticMenu();"> <script type="text/javascript">
 let totalData; //총 데이터 수
 let dataPerPage; //한 페이지에 나타낼 글 수
 let pageCount = 5; //페이징에 나타낼 페이지 수
 let globalCurrentPage=1; //현재 페이지
 let dataList; //표시하려하는 데이터 리스트

 $(document).ready(function () {
  //dataPerPage 선택값 가져오기
  dataPerPage = $("#dataPerPage").val();
  var prod_num = 10;
  $.ajax({ // ajax로 데이터 가져오기
 	method: "GET",
 	url: "reqAjax2",
 	dataType: "json",
 	data: { prod_num: prod_num },
 	success: function (d) {
 		console.log(d);
 	   //totalData(총 데이터 수) 구하기
 	   totalData = d.length;
            //데이터 대입
            dataList=d;
  //글 목록 표시 호출 (테이블 생성)
  displayData(1, dataPerPage);
  
  //페이징 표시 호출
  paging(totalData, dataPerPage, pageCount, 1);
 	}
  	});
 });
 
//현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
 function displayData(currentPage, dataPerPage) {

   let chartHtml = "";

 //Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림.. 
   currentPage = Number(currentPage);
   dataPerPage = Number(dataPerPage);
   
   for (
     var i = (currentPage - 1) * dataPerPage;
     i < (currentPage - 1) * dataPerPage + dataPerPage;
     i++
   ) {
     chartHtml +=
       "<tr><td>" +
       dataList[i].re_content +
       "</td></tr>";
   } //dataList는 임의의 데이터임.. 각 소스에 맞게 변수를 넣어주면 됨...
   $("#dataTableBody").html(chartHtml);
 }
 
 function paging(totalData, dataPerPage, pageCount, currentPage) {
	  console.log("currentPage : " + currentPage);

	  totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수
	  
	  if(totalPage<pageCount){
	    pageCount=totalPage;
	  }
	  
	  let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
	  let last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
	  
	  if (last > totalPage) {
	    last = totalPage;
	  }

	  let first = last - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호
	  let next = last + 1;
	  let prev = first - 1;

	  let pageHtml = "";

	  if (prev > 0) {
	    pageHtml += "<li><a href='' id='prev'> 이전 </a></li>";
	  }

	 //페이징 번호 표시 
	  for (var i = first; i <= last; i++) {
	    if (currentPage == i) {
	      pageHtml +=
	        "<li class='on'><a href='' id='" + i + "'>" + i + "</a></li>";
	    } else {
	      pageHtml += "<li><a href='' id='" + i + "'>" + i + "</a></li>";
	    }
	  }

	  if (last < totalPage) {
	    pageHtml += "<li><a href='' id='next'> 다음 </a></li>";
	  }

	  $("#pagingul").html(pageHtml);
	  let displayCount = "";
	  displayCount = "총 리뷰수: " + totalData;
	  $("#displayCount").text(displayCount);


	  //페이징 번호 클릭 이벤트 
	  $("#pagingul li a").click(function () {
	    let $id = $(this).attr("id");
	    selectedPage = $(this).text();

	    if ($id == "next") selectedPage = next;
	    if ($id == "prev") selectedPage = prev;
	    
	    //전역변수에 선택한 페이지 번호를 담는다...
	    globalCurrentPage = selectedPage;
	    //페이징 표시 재호출
	    paging(totalData, dataPerPage, pageCount, selectedPage);
	    //글 목록 표시 재호출
	    displayData(selectedPage, dataPerPage);
	  });
	}
 
 $("#dataPerPage").change(function () {
	    dataPerPage = $("#dataPerPage").val();
	    //전역 변수에 담긴 globalCurrent 값을 이용하여 페이지 이동없이 글 표시개수 변경 
	    paging(totalData, dataPerPage, pageCount, globalCurrentPage);
	    displayData(globalCurrentPage, dataPerPage);
	 });
 </script>
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
						<h1 style="text-align: center; margin: 80px 0; font-size: 60px;">Review</h1>    <div class="app">
						<input type="hidden" value="5" id="dataPerPage">
						<table id="dataTableBody">
						</table>
						<ul id="pagingul">
						</ul>
				</div>
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

