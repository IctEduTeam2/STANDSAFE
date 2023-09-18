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

<link rel="stylesheet" href="resources/css/slide.css" />
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

button {
	width: 100px;
	float: left;
	height: 40px;
	background-color: rgba(27, 90, 194, 0.8);
	color: white;
	border: 0;
	border-radius: 5px;
	margin-bottom: 5px;
	margin-right: 20px;
}

button:hover {
	opacity: 0.8;
}

td {
	border-spacing: 0px;
	border-style: none;
	padding: 10px 30px;
}
</style>
<script type="text/javascript">
	function main_go() {
		location.href = "/";
	}
	function order_go() {
		location.href = "/orderlistform.do?client_num=" + ${id};
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
					<li class="li"><a href="/basketform.do?client_num=${id}"
						class="li_a" style="color: white;">장바구니</a></li>
					<li class="li"><a href="/wishlistform.do?client_num=${id}"
						class="li_a" style="color: white;">위시리스트</a></li>
					<li class="li"><a href="/orderlistform.do?client_num=${id}"
						class="li_a current" style="color: white;">주문조회 | 배송현황</a></li>
				</ul>
			</div>

			<div
				style="width: 100%; margin: auto; height: auto; margin-top: 60px; float: left;">
				<div style="width: 60%; margin: auto;">
					<div style="width: 100%; float: left;">
						<p>
							<b style="font-size: 18px;">주문내역 - </b> <b
								style="font-size: 12px;">AASFSB123123F (구매완료)</b>
						<button style="float: right; margin: 0">구매확정</button>
						</p>
					</div>
					<!--주문내역-->
					<div
						style="width: 100%; float: left; border: 1px solid black; margin-top: 30px;">
						<!--물품하나 시작태그-->
						<div style="width: 100%; float: left; padding: 20px;">
							<div style="float: left;">
								<img src="resources/images/products/product1.jpg"
									style="width: 160px; height: 200px;">
							</div>
							<div style="float: left; margin-left: 30px;">
								<p style="color: gray; opacity: 0.5;">2022.11.02 결제</p>
								<p style="font-size: 14px; margin-top: 10px;">톰과 싸우는 제리 인형</p>
								<p style="font-size: 20px; margin-top: 10px;">
									<b>5,000 원 x 1 = 5,000 원</b>
								</p>
							</div>
							<div style="float: right; margin-right: 20px; margin-top: 160px;">
								<!-- 구매완료시 반품요청 / 배송준비시 환불요청-->
								<button>반품요청</button>
								<button style="display: none;">환불요청</button>
								<button>재구매</button>
								<button>리뷰쓰기</button>
							</div>
						</div>
						<hr style="width: 100%;">
						<!--물품하나 끝태크-->

						<!-- 배송내용-->
						<div style="float: left; width: 100%; padding: 20px;">
							<table>
								<thead>
									<tr>
										<th style="text-align: left;">배송지 정보</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>수령인:</td>
										<td>단호박</td>
									</tr>
									<tr>
										<td>연락처:</td>
										<td>010-1234-5678</td>
									</tr>
									<tr>
										<td>배송지:</td>
										<td>서울 애호박구 늙은호박동 단호박길</td>
									</tr>
									<tr>
										<td>배송메모:</td>
										<td>배송주세요</td>
									</tr>
								</tbody>
							</table>
						</div>
						<hr style="width: 100%;">
						<!-- 배송내용 끝-->

						<!-- 명세서-->
						<div style="float: left; width: 100%; padding: 20px;">
							<table>
								<thead>
									<tr>
										<th style="text-align: left;">명세서</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>상품금액:</td>
										<td><b style="color: blue;">+ </b>159,593 원</td>
									</tr>
									<tr>
										<td>할인금액:</td>
										<td><b style="color: orangered;">- </b>5,000 원</td>
									</tr>
									<tr>
										<td>배송비:</td>
										<td>0 원</td>
									</tr>
									<tr>
										<td>결제금액:</td>
										<td>154,593 원</td>
									</tr>
								</tbody>
							</table>
						</div>
						<hr style="width: 100%;">
						<!-- 명세서 끝-->

						<!-- 결제방법-->
						<div style="float: left; width: 100%; padding: 20px;">
							<table>
								<thead>
									<tr>
										<th style="text-align: left;">결제 방법</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>결제방법:</td>
										<td>신용카드</td>
									</tr>
									<tr>
										<td>할부:</td>
										<td>(무이자) 3개월</td>
									</tr>
									<tr>
										<td>카드번호:</td>
										<td>154,593 원</td>
									</tr>
								</tbody>
								<tbody style="display: none;">
									<tr>
										<td>결제방법:</td>
										<td>포인트</td>
									</tr>
									<tr>
										<td>카드번호:</td>
										<td>154,593 원</td>
									</tr>
								</tbody>
							</table>
							<p style="opacity: 0.5; margin-top: 50px;">
								무이자 적용 여부는 카드사로 문의하시면 정확하게 확인 할 수 있습니다. <br>
								<br> 배송중으로 된 상태에서는 결제취소가 어렵습니다. 반품 후 취소/환불신청을 통해 해주세요.
							</p>
						</div>
						<!-- 명세서 끝-->
					</div>
					<!--주문내역 끝-->
					<div
						style="width: 100%; margin: auto; float: left; margin-top: 50px;">
						<div style="width: 40%; margin: auto;">
							<button style="width: 200px; height: 50px;" onclick="main_go()">홈으로</button>
							<button style="width: 200px; height: 50px;" onclick="order_go()">주문조회
								| 배송현황</button>
						</div>
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