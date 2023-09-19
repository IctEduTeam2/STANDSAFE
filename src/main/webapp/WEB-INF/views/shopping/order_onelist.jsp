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
	function Order1(st) {
		if(st==0 || st == 1) {
	    	if (confirm("주문을 취소하시겠습니까?")) {
	    	var pb_content = prompt("취소 사유를 작성해주세요.");
	    	if(pb_content == null || pb_content.trim() == "") {
	    		alert("취소사유를 작성해주세요.");
	    		return;
	    	} else {
	    		alert("주문이 취소되었습니다.");
	    		location.href = "/Order.do?client_num=${id}&pay_oknum=${paylist[0].pay_oknum}&st=" + st + "&pb_content=" + pb_content;
	    	}
	    }
		} else if(st==2) {
			if (confirm("구매확정 하시겠습니까?\n구매확정 이후 교환 및 환불이 불가능합니다.")) {
				location.href = "/Order.do?client_num=${id}&pay_oknum=${paylist[0].pay_oknum}&st=" + st + "&pb_content=구매확정";
		    	}
		}
	        	}
	
	function cancle(st, prod_num) {
		if(st==0) {
			if(confirm("교환 접수를 취소하시겠습니까?")) {
				alert("교환 접수가 취소되었습니다.");
    			location.href = "/productcanclereturniscancle.do?client_num=${id}&pay_oknum=${paylist[0].pay_oknum}&st=" + st + "&prod_num=" + prod_num;
			}
		} else if(st==1) {
			if(confirm("환불 접수를 취소하시겠습니까?")) {
				alert("환불 접수가 취소되었습니다.");
    			location.href = "/productcanclereturniscancle.do?client_num=${id}&pay_oknum=${paylist[0].pay_oknum}&st=" + st + "&prod_num=" + prod_num;
			}
		} else if(st==2) {
			alert("접수를 취소할수 없습니다.\n관리자에게 문의하세요.");
			return;
		} else if(st==3) {
			alert("접수를 취소할수 없습니다.\n관리자에게 문의하세요.");
			return;
		}
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
								style="font-size: 12px;">${paylist[0].pay_oknum } 
        <c:choose>
            <c:when test="${paylist[0].pay_st == 1 }">
            	(결제취소 - ${pbvo.pb_date })
            </c:when>
            <c:when test="${deliveryvo.deli_st == 0}">
                (배송준비중 - ${deliveryvo.deli_date })
                		<c:choose>
            				<c:when test="${paylist[0].pay_type == 1}">
						<button style="float: right; margin: 0" onclick="Order1(1)">결제취소</button>
             				</c:when>
            				<c:when test="${paylist[0].pay_type == 0}">
						<button style="float: right; margin: 0" onclick="Order1(0)">결제취소</button>
             				</c:when>
                		</c:choose>
            </c:when>
            <c:when test="${deliveryvo.deli_st == 1}">
                (배송중 - ${deliveryvo.deli_date })
            </c:when>
            <c:when test="${deliveryvo.deli_st == 2}">
                (배송완료 - ${deliveryvo.deli_date })
						<button style="float: right; margin: 0" onclick="Order1(2)">구매확정</button>
            </c:when>
            <c:when test="${deliveryvo.deli_st == 3}">
                (구매확정 - ${deliveryvo.deli_date })
            </c:when>
            <c:otherwise>
                (알 수 없는 상태- 관리자에게 문의하세요.)
            </c:otherwise>
        </c:choose></b>
						</p>
					</div>
					<!--주문내역-->
					<div
						style="width: 100%; float: left; border: 1px solid black; margin-top: 30px;">
						<!--물품하나 시작태그-->
					<c:forEach var="a" items="${cartList}">
							<c:forEach var="b" items="${prodList}">
								<c:choose>
									<c:when test="${a.prod_num == b.prod_num }">
										<div style="width: 100%; float: left; padding: 20px;">
											<div style="float: left;">
<a href="/productOneListform.do?prod_num=${b.prod_num }">
												<img src="resources/images/products/${b.prod_img }"
													style="width: 160px; height: 200px;"></a>
											</div>
											<div style="float: left; margin-left: 30px;">
												<p style="color: gray; opacity: 0.5;">${paylist[0].pay_ok }
													결제</p>
												<p style="font-size: 14px; margin-top: 10px;">
<a href="/productOneListform.do?prod_num=${b.prod_num }">${b.prod_name}</a></p>
												<p style="font-size: 20px; margin-top: 10px;">
													<b><fmt:formatNumber
															value="${a.cart_price/a.cart_amount}" type="number"
															pattern="#,### 원" /> x ${a.cart_amount } = <fmt:formatNumber
															value="${a.cart_price }" type="number" pattern="#,### 원" /></b>
												</p>
											</div>
											<div
												style="float: right; margin-right: 20px; margin-top: 160px;">
												<!-- 구매완료시 반품요청 / 배송준비시 환불요청-->
												<c:choose>
										            <c:when test="${paylist[0].pay_st == 1 }">
										            </c:when>
										            <c:when test="${pbvo.pb_st == 0 }">
										            	<button onclick="cancle(0, ${b.prod_num})">교환 접수중</button>
										            </c:when>
										            <c:when test="${pbvo.pb_st == 1 }">
										            	<button onclick="cancle(2, ${b.prod_num})">교환 접수완료</button>
										            </c:when>
										            <c:when test="${pbvo.pb_st == 2 }">
										            	<button onclick="cancle(2, ${b.prod_num})">교환 회수완료</button>
										            </c:when>
										            <c:when test="${pbvo.pb_st == 3 }">
										            	<button onclick="cancle(2, ${b.prod_num})">교환 완료</button>
										            </c:when>
										            <c:when test="${pbvo.pb_st == 4 }">
										            	<button onclick="cancle(1, ${b.prod_num})")">반품 접수중</button>
										            </c:when>
										            <c:when test="${pbvo.pb_st == 5 }">
										            	<button onclick="cancle(3, ${b.prod_num})">반품 접수완료</button>
										            </c:when>
										            <c:when test="${pbvo.pb_st == 6 }">
										            	<button onclick="cancle(3, ${b.prod_num})">반품 회수완료</button>
										            </c:when>
										            <c:when test="${pbvo.pb_st == 7 }">
										            	<button onclick="cancle(3, ${b.prod_num})">반품 완료</button>
										            </c:when>
													<c:when test="${deliveryvo.deli_st == 0}">
													</c:when>
													<c:when test="${deliveryvo.deli_st == 1}">
														<button onclick="location.href = '/productcancleform.do?client_num=${id}&prod_num=${b.prod_num }&pay_oknum=${pay_oknum }&st=0'">환불요청</button>
														<button onclick="location.href = '/productcancleform.do?client_num=${id}&prod_num=${b.prod_num }&pay_oknum=${pay_oknum }&st=1'">교환요청</button>
													</c:when>
													<c:when test="${deliveryvo.deli_st == 2}">
														<button onclick="location.href = '/productcancleform.do?client_num=${id}&prod_num=${b.prod_num }&pay_oknum=${pay_oknum }&st=0'">환불요청</button>
														<button onclick="location.href = '/productcancleform.do?client_num=${id}&prod_num=${b.prod_num }&pay_oknum=${pay_oknum }&st=1'">교환요청</button>
													</c:when>
													<c:when test="${deliveryvo.deli_st == 3}">
														<button onclick="location.href = '/productOneListform.do?prod_num=${b.prod_num }'">재구매</button>
														<button onclick="location.href = '/reviewprodwriteform.do?prod_num=${b.prod_num }'">리뷰쓰기</button>
													</c:when>
												</c:choose>
											</div>
										</div>
										<hr style="width: 100%;">
									</c:when>
								</c:choose>
							</c:forEach>
							<!--물품하나 끝태크-->
					</c:forEach>
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
										<td>${paylist[0].take_peo}</td>
									</tr>
									<tr>
										<td>연락처:</td>
										<td>${paylist[0].take_phone}</td>
									</tr>
									<tr>
										<td>배송지:</td>
										<td>${paylist[0].take_addr}</td>
									</tr>
									
									<c:choose>
									<c:when test="${paylist[0].take_memo == null || paylist[0].take_memo == ''}">
									</c:when>
									<c:otherwise>
									<tr>
										<td>배송메모:</td>
										<td>${paylist[0].take_memo}</td>
									</tr>
									</c:otherwise>
									</c:choose>
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
										<td><b style="color: blue;">+ </b><fmt:formatNumber value="${sum}" type="number"
									pattern="#,### 원" /></td>
									</tr>
									<tr>
										<td>할인금액:</td>
										<td><b style="color: orangered;">- </b>
										<fmt:formatNumber value="${sum - paylist[0].pay_money}" type="number"
									pattern="#,### 원" /></td>
									</tr>
									<tr>
										<td>배송비:</td>
										<td>3,000 원</td>
									</tr>
									<tr>
										<td>결제금액:</td>
										<td><c:set var="totalPay" value="${paylist[0].pay_money + 3000}" />
<fmt:formatNumber value="${totalPay}" type="number" pattern="#,### 원" /></td>
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
								
								 <c:choose>
            						<c:when test="${paylist[0].pay_type == 0}">
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
								</c:when>
								<c:otherwise>
								<tbody>
									<tr>
										<td>결제방법:</td>
										<td>포인트</td>
									</tr>
								</tbody></c:otherwise>
								</c:choose>
							</table>
								 <c:choose>
            						<c:when test="${paylist[0].pay_type == 0}">
							<p style="opacity: 0.5; margin-top: 50px;">
								무이자 적용 여부는 카드사로 문의하시면 정확하게 확인 할 수 있습니다. <br>
								<br> 배송중으로 된 상태에서는 결제취소가 어렵습니다. 반품 후 취소/환불신청을 통해 해주세요.
							</p>
							</c:when></c:choose>
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