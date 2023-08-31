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

.select_del:hover, .one_order:hover, .order:hover {
	opacity: 0.8;
}

.one_order {
	width: 200px;
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
<script type="text/javascript">
$(function(){
	$('.decreaseQuantity').click(function(e){
	e.preventDefault();
	var stat = $('.numberUpDown').text();
	var num = parseInt(stat,10);
	num--;
	if(num<=0){
	alert('더이상 줄일수 없습니다.');
	num =1;
	}
	$('.numberUpDown').text(num);
	});
	$('.increaseQuantity').click(function(e){
	e.preventDefault();
	var stat = $('.numberUpDown').text();
	var num = parseInt(stat,10);
	num++;

	// 재고량만큼으로 나중에 수정
	if(num>5){
	alert('더이상 늘릴수 없습니다.');
	num=5;
	}
	$('.numberUpDown').text(num);
	});
	});

</script>
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents" style="border: 0px solid black;">
			<h3 style="width: 100%; float: left; margin-top: 100px; font-size: 30px;">장바구니</h3>
			<div
				style="width: 100%; height: 82px; background-color: rgba(27, 90, 194, 1); float: left; margin-top: 10px;">
				<ul class="snb">
					<li class="li"><a href="/basketform.do" class="current li_a">장바구니</a></li>
					<li class="li"><a href="/wishlistform.do" class="li_a" style="color: white;">위시리스트</a></li>
					<li class="li"><a href="/orderlistform.do" class="li_a" style="color: white;">주문조회 | 배송현황</a></li>
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
						<input type="button" value="선택항목 삭제" class="select_del">
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
								<form
									style="border: 0; float: right; margin-right: 20px; margin-bottom: 5px;">
									<input type="button" value="-"
										onClick="javascript:this.form.amount.value--;"
										style="background: white; font-size: 30px; border: 0">
									<input type="number" name="amount" value="1"
										style="width: 50px; text-align: center; border: 0; font-size: 20px;">개
									<input type="button" value="+"
										onClick="javascript:this.form.amount.value++;"
										style="background: white; font-size: 23px; border: 0">
								</form>
							</div>
							<div style="float: right;">
								<input type="button" value="바로구매" class="one_order">
							</div>
						</div>
					</div> <!-- 제품한개 끝태그 -->
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
								<form
									style="border: 0; float: right; margin-right: 20px; margin-bottom: 5px;">
									<input type="button" value="-"
										onClick="javascript:this.form.amount.value--;"
										style="background: white; font-size: 30px; border: 0">
									<input type="number" name="amount" value="1"
										style="width: 50px; text-align: center; border: 0; font-size: 20px;">개
									<input type="button" value="+"
										onClick="javascript:this.form.amount.value++;"
										style="background: white; font-size: 23px; border: 0">
								</form>
							</div>
							<div style="float: right;">
								<input type="button" value="바로구매" class="one_order">
							</div>
						</div>
					</div> <!-- 제품한개 끝태그 -->
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
								<form
									style="border: 0; float: right; margin-right: 20px; margin-bottom: 5px;">
									<input type="button" value="-"
										onClick="javascript:this.form.amount.value--;"
										style="background: white; font-size: 30px; border: 0">
									<input type="number" name="amount" value="1"
										style="width: 50px; text-align: center; border: 0; font-size: 20px;">개
									<input type="button" value="+"
										onClick="javascript:this.form.amount.value++;"
										style="background: white; font-size: 23px; border: 0">
								</form>
							</div>
							<div style="float: right;">
								<input type="button" value="바로구매" class="one_order">
							</div>
						</div>
					</div> <!-- 제품한개 끝태그 -->
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
								<form
									style="border: 0; float: right; margin-right: 20px; margin-bottom: 5px;">
									<input type="button" value="-"
										onClick="javascript:this.form.amount.value--;"
										style="background: white; font-size: 30px; border: 0">
									<input type="number" name="amount" value="1"
										style="width: 50px; text-align: center; border: 0; font-size: 20px;">개
									<input type="button" value="+"
										onClick="javascript:this.form.amount.value++;"
										style="background: white; font-size: 23px; border: 0">
								</form>
							</div>
							<div style="float: right;">
								<input type="button" value="바로구매" class="one_order">
							</div>
						</div>
					</div> <!-- 제품한개 끝태그 -->
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
								<form
									style="border: 0; float: right; margin-right: 20px; margin-bottom: 5px;">
									<input type="button" value="-"
										onClick="javascript:this.form.amount.value--;"
										style="background: white; font-size: 30px; border: 0">
									<input type="number" name="amount" value="1"
										style="width: 50px; text-align: center; border: 0; font-size: 20px;">개
									<input type="button" value="+"
										onClick="javascript:this.form.amount.value++;"
										style="background: white; font-size: 23px; border: 0">
								</form>
							</div>
							<div style="float: right;">
								<input type="button" value="바로구매" class="one_order">
							</div>
						</div>
					</div> <!-- 제품한개 끝태그 -->
				</div>
			</div>
			<div style="width: 100%; margin: auto; float: left;">
				<table style="width: 80%; margin: auto; border-collapse: collapse;">
					<thead
						style="border-top: 2px solid black; border-bottom: 1px solid black;">
						<tr>
							<th>주문금액</th>
							<th>배송비</th>
							<th>할인금액</th>
							<th style="background-color: rgba(27, 90, 194, 1); color: white;">결제
								금액</th>
						</tr>
					</thead>
					<tbody style="text-align: center; border-bottom: 2px solid black;">
						<tr>
							<td>1,000,000원</td>
							<td>3,000원</td>
							<td>-30,000원</td>
							<td style="background-color: rgba(27, 90, 194, 1); color: white;">973,000원</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="width: 80%; margin: auto;">
			<input type="submit" value="주문하기" class="order" onclick="location.href='/orderform.do'">
			</div>
		</section>
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>