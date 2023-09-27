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
	margin-top: 30px;
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

.select_del:hover, .order_detail:hover, .order:hover {
	opacity: 0.8;
}

.order_detail {
	width: 200px;
	height: 50px;
	background-color: rgba(27, 90, 194, 0.8);
	color: white;
	border: 0;
	border-radius: 5px;
	margin-right: 20px;
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
        function selectAll(selectAll) {
            const checkboxes = document.getElementsByName('select');

            checkboxes.forEach((checkbox) => {
                checkbox.checked = selectAll.checked;
            });
        }
    </script>
<script type="text/javascript">
    	function orderOne_go(f) {
			f.action="/orderOneListform.do";
				f.submit();
		}
    </script>
</head>

<body onload="InitializeStaticMenu();">
<script type="text/javascript">
</script>
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents" style="border: 0px solid black;">
			<h3
				style="width: 100%; float: left; margin-top: 100px; font-size: 30px;">주문조회
				| 배송현황</h3>
			<div
				style="width: 100%; height: 82px; background-color: rgba(27, 90, 194, 1); float: left; margin-top: 10px;">
				<ul class="snb">
					<li class="li"><a href="/basketform.do?client_num=${id}" class="li_a" style="color: white;">장바구니</a></li>
					<li class="li"><a href="/wishlistform.do?client_num=${id}" class="li_a" 
						style="color: white;">위시리스트</a></li>
					<li class="li"><a href="/orderlistform.do?client_num=${id}" class="li_a current"
						style="color: white;">주문조회 | 배송현황</a></li>
				</ul>
			</div>

					<c:choose>
					<c:when test="${empty paylist}">
						<div style="float:left; margin: auto; text-align:center; border: 1px solid black; width: 100%; height: 600px; margin-top: 50px;">
						<h1 style="text-align: center;">주문하신 내역이 없습니다.</h1>
						</div>					
					</c:when>
					<c:otherwise>
			<div
				style="width: 60%; margin: auto; height: auto; margin-top: 60px;">
				<div class="baskets">
					<c:forEach var="a" items="${list}">
					<!-- 제품 한개-->
					<div class="basket_cont">
						<img class="basket_img"
							src="resources/images/products/${a.prod_img }">
						<div style="width: 60%; float: left; margin-left: 10px;">
							<a href="/orderOneListform.do?pay_oknum=${a.pay_oknum}&client_num=${id}"
								style="font-size: 18px; margin-left: 10px; font-weight: 600;">
								<p
									style="color: gray; font-size: 16px; opacity: 0.7; margin-bottom: 10px;">${a.pay_ok }
									- <c:choose>
										<c:when test="${a.pay_st == '0'}">
											결제완료
										</c:when>
										<c:otherwise>
											결제취소
										</c:otherwise>
									</c:choose>
									</p> <b style="font-size: 16px;">주문번호:</b> <b
								style="font-size: 14px">${a.pay_oknum }</b>
							</a> <br> <b style="font-size: 14px;"><fmt:formatNumber value="${a.pay_money}" type="number"
									pattern="#,### 원" /></b>
						</div>
						<div style="float: right; margin-top: 30px;">
						<form>
							<input type="hidden" value="${id}" name="client_num">
							<input type="hidden" value="${a.pay_oknum }" name="pay_oknum">
							<input type="button" value="상세보기" class="order_detail"
								onclick="orderOne_go(this.form)"></form>
						</div>
					</div>
					</c:forEach>
					<!-- 제품한개 끝태그 -->
				</div>
			</div>
						<table class="m_table" style="width: 100%;">				
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
													<li><a href="/orderlistform.do?client_num=${id }&cPage=${paging.beginBlock-paging.pagePerBlock }">이전으로</a></li>
												</c:otherwise>
											</c:choose>	
											<c:forEach begin="${paging.beginBlock }" end="${paging.endBlock }" step="1" var="k">
												<c:if test="${k == paging.nowPage }">
													<!--현재페이지와 같으면  -->
													<li class="now">${k }</li>
												</c:if>
												<c:if test="${k != paging.nowPage }">
													<li><a href="/orderlistform.do?client_num=${id }&cPage=${k }"> ${k }</a></li>
												</c:if>
											</c:forEach>
															
											<!-- 이후버튼  -->	
											<c:choose>
												<c:when test="${paging.endBlock >= paging.totalPage }">
													<li class="disable">
					다음으로</li>
												</c:when>
												<c:otherwise>
													<li><a href="/orderlistform.do?client_num=${id }&cPage=${paging.beginBlock+paging.pagePerBlock }">다음으로</a></li>
												</c:otherwise>
											</c:choose>					
										</ol>
									</td>
								</tr>
						</tfoot>
					</table>
					</c:otherwise>
					</c:choose>
		</section>
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>