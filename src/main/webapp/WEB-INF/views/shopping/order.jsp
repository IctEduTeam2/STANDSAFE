<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>STANDSAFE</title>
<!-- <meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" /> -->
<script src="https://js.tosspayments.com/v1/payment-widget"></script>
<!-- Link Swiper's CSS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/slide.css" />
<link rel="stylesheet" href="resources/css/basis.css" />
<style>
.order_list_td tr {
	text-align: center;
	padding: 20px;
	border-bottom: 1px dotted black;
}

.order_list_th th {
	padding: 10px;
	border-bottom: 1px solid gray;
}

.user_data td {
	padding: 20px;
	border: 1px solid black;
}

.user_data td:first-child {
	width: 20%;
}

.pay:hover {
	opacity: 0.8;
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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
				var addr = '';
				var extraAddr = '';

				// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 도로명 주소 
					addr = data.roadAddress;
				} else { // 지번 주소
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("extraAddress").value = extraAddr;

				} else {
					document.getElementById("extraAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = addr;
				
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress").focus();
			}
		}).open();
	}
</script>
<script>
var addr = '';
var extraAddr = '';
	function execDaumPostcode2() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
				// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 도로명 주소 
					addr = data.roadAddress;
				} else { // 지번 주소
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("extraAddress2").value = extraAddr;

				} else {
					document.getElementById("extraAddress2").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode2').value = data.zonecode;
				document.getElementById("address2").value = addr;
				address = addr + "(" + data.zonecode + ")";
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress2").focus();
			}
		}).open();
	}
    
	function point2(f) {
	    const price = parseFloat('${price}');
	    const inputValue = parseFloat(f.point.value.trim());  
	    var agreeRadio = document.getElementById("agreeRadio");
	    var disagreeRadio = document.getElementById("disagreeRadio");
	    if (!agreeRadio.checked) {
            alert("약관에 동의해야 합니다.");
            return;
        } else if(f.take_peo.value.trim()== null || f.take_peo.value.trim() == "") {
	    	alert("받는분 성함을 입력해주세요.");
	    	return;
	    } else if(f.postcode2.value.trim()== null || f.postcode2.value.trim() == "") {
	    	alert("배송지를 입력해주세요.");
	    	return;
	    } else if(f.address2.value.trim()== null || f.address2.value.trim() == "") {
	    	alert("배송지를 입력해주세요.");
	    	return;
	    } else if(f.phone.value.trim()== null || f.phone.value.trim() == "") {
	    	alert("받는분 핸드폰 번호를 입력해주세요.");
	    	return;
	    } else if(f.phone.value.trim().length < 11) {
	    	alert("핸드폰 번호는 11글자로 입력해주세요.");
	    	return;
	    } else if (inputValue < price) {
	        alert("포인트가 부족합니다.");
	        return;
	    }  
	    else {
	    	var address = '(' + f.postcode2.value.trim() + ') ' + f.address2.value.trim() + " " + f.extraAddress2.value.trim() + " " +  f.detailAddress2.value.trim();
	        f.action = "/ordercom.do?address=" + address + "&price=" + price + "&paytype=1";
	        f.submit();
	    }
	}
</script>
</head>

<body onload="InitializeStaticMenu();">
	<script type="text/javascript">
$(document).ready(function() {
	$('#userinfo').on('click', function() {
		console.log('${uvo.PHONE}');
		$('#userName').val('${uvo.m_NAME}');
		$('#userPhone').val('${uvo.PHONE}');
		$('#userEmail').val('${uvo.MAIL}');
	});  
	$('input[name="delivery"]').on('change', function() {
        if ($(this).val() === 'same') {
            // 주문자 정보 필드의 값 가져오기
            var userName = $('#userName').val();
            var userPhone = $('#userPhone').val();
            var addr1 = $('#postcode').val();
            var addr2 = $('#address').val();
            var addr3 = $('#extraAddress').val();
            var addr4 = $('#detailAddress').val();
            
            // 배송지 정보 필드에 주문자 정보 복사
            $('#deliveryName').val(userName);
            $('#deliveryPhone').val(userPhone);
            $('#postcode2').val(addr1);
            $('#address2').val(addr2);
            $('#extraAddress2').val(addr3);
            $('#detailAddress2').val(addr4);
        } else {
            $('#deliveryName').val("");
            $('#deliveryPhone').val("");
            $('#postcode2').val("");
            $('#address2').val("");
            $('#extraAddress2').val("");
            $('#detailAddress2').val("");
        }
    });
});
</script>

	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents">
			<div style="text-align: center; margin-bottom: 30px;">
				<b style="font-size: 24px;">ORDER WRITE</b>
			</div>
			<hr>
			<div style="">
				<h3 style="margin: 20px 0;">주문리스트</h3>
				<table
					style="width: 100%; border: 1px solid black; border-spacing: 0px; border-collapse: collapse; font-weight: 700;">
					<thead class="order_list_th">
						<tr>
							<th style="width: 5%;"><input type="checkbox" name="select"
								value="selectall" onclick="selectAll(this)"></th>
							<th style="width: 20%;">이미지</th>
							<th style="width: 40%;">상품정보</th>
							<th style="width: 15%;">판매가</th>
							<th style="width: 5%;">수량</th>
							<th style="width: 15%;">합계</th>
						</tr>
					</thead>
					<tbody class="order_list_td">
						<tr class="cart-item">
							<td><input type="checkbox" name="select" value="제품번호"></td>
							<td><img src="resources/images/products/${pvo.prod_img }"
								style="width: 120px; height: 160px"></td>
							<td><a href="/productOneListform.do?prod_num=${prod_num }"
								style="font-size: 16px;">${pvo.prod_name }</a></td>
							<td><c:choose>
									<c:when test="${pvo.prod_sale == '0'}">
										<fmt:formatNumber value="${pvo.prod_price}" type="number"
											pattern="#,###원" />
									</c:when>
									<c:otherwise>
										<p>
											<del>
												<fmt:formatNumber value="${pvo.prod_price}" type="number"
													pattern="#,### 원" />
											</del>
											▶ <b style="color: red; font-size: 14px;"><fmt:formatNumber
													value="${pvo.prod_sale}" type="number" pattern="#,### 원" /></b>
										</p>
										<b style="font-size: 14px;"> (${((pvo.prod_price - pvo.prod_sale) / pvo.prod_price * 100).intValue()}%↓)</b>
									</c:otherwise>
								</c:choose></td>
							<td>${bvo.cart_amount }개</td>
							<td><c:choose>
									<c:when test="${pvo.prod_sale == '0'}">
										<fmt:formatNumber value="${pvo.prod_price * bvo.cart_amount}"
											type="number" pattern="#,###원" />
									</c:when>
									<c:otherwise>
										<fmt:formatNumber value="${pvo.prod_sale * bvo.cart_amount}"
											type="number" pattern="#,### 원" />
									</c:otherwise>
								</c:choose></td>
						</tr>
					</tbody>
				</table>
				<h3 style="margin-bottom: 20px; margin-top: 80px;">주문자 정보</h3>

				<table
					style="width: 100%; border-spacing: 0px; border-collapse: collapse; font-weight: 700;"
					class="user_data">
					<tr>
						<td>주문하시는분 <b style="color: red">*</b></td>
						<td><input type="text" style="width: 400px; padding: 10px;"
							id="userName"><input type="button" id="userinfo"
							value="회원정보 불러오기"></td>
					</tr>
					<tr>
						<td>주소 <b style="color: red"></b></td>
						<td><input style="width: 400px; padding: 10px;" type="text"
							name="postcode" id="postcode" placeholder="우편번호"
							disabled="readonly"> <input
							style="width: 200px; padding: 7px; margin-bottom: 10px;"
							type="button" onclick="execDaumPostcode()" value="우편변호 찾기">
							<br> <input style="width: 400px; padding: 10px;" type="text"
							name="address" id="address" placeholder="주소" disabled="readonly">
							<input style="width: 400px; padding: 10px;" type="text"
							name="extraAddress" id="extraAddress" placeholder="참고주소"
							disabled="readonly"> <span id="guide"
							style="color: #999; display: none"></span> <input
							style="width: 400px; padding: 10px;" type="text"
							name="detailAddress" id="detailAddress" placeholder="상세주소"></td>
					</tr>
					<tr>
						<td>전화 <b style="color: red">*</b></td>
						<td><input type="text" style="width: 300px; padding: 10px;"
							placeholder="'-'없이 입력" id="userPhone"></td>
					</tr>
					<tr>
						<td>이메일 <b style="color: red">*</b></td>
						<td><input type="text" style="width: 400px; padding: 10px;"
							placeholder="example@email.com" id="userEmail"></td>
					</tr>
					<tr>
						<td>쇼핑몰 이용약관 <b style="color: red">*</b></td>
						<td><textarea readonly
								style="resize: none; padding: 10px; font-size: 16px; width: 98.5%; height: 400px;"></textarea>
							<div style="float: right;">
								<input type="radio" name="terms" value="동의" id="agreeRadio"><b>
									동의함</b> <input type="radio" name="terms" value="비동의"
									id="disagreeRadio" style="margin-left: 30px; margin-top: 10px;"
									checked> <b>동의하지 않음</b>
							</div></td>

					</tr>
				</table>
				<h3 style="margin-bottom: 20px; margin-top: 80px;">배송지 정보</h3>

				<form enctype="multipart/form-data" method="post">
					<table
						style="width: 100%; border-spacing: 0px; border-collapse: collapse; font-weight: 700;"
						class="user_data">
						<tr>
							<td>배송지 선택</td>
							<td><input type="radio" name="delivery" value="same">
								주문자 정보와 동일 <input type="radio" checked
								style="margin-left: 50px;" name="delivery" value="new">
								새로운 배송지</td>
						</tr>
						<tr>
							<td>받으시는분 <b style="color: red">*</b></td>
							<td><input type="text" style="width: 400px; padding: 10px;"
								id="deliveryName" name="take_peo"></td>
						</tr>
						<tr>
							<td>주소 <b style="color: red">*</b></td>
							<td><input style="width: 400px; padding: 10px;" type="text"
								name="postcode2" id="postcode2" placeholder="우편번호"
								disabled="readonly"> <input
								style="width: 200px; padding: 7px; margin-bottom: 10px;"
								type="button" onclick="execDaumPostcode2()" value="우편변호 찾기">
								<br> <input style="width: 400px; padding: 10px;"
								type="text" name="address2" id="address2" placeholder="주소"
								disabled="readonly"> <input
								style="width: 400px; padding: 10px;" type="text"
								name="extraAddress2" id="extraAddress2" placeholder="참고주소"
								disabled="readonly"> <span id="guide"
								style="color: #999; display: none"></span> <input
								style="width: 400px; padding: 10px;" type="text"
								name="detailAddress2" id="detailAddress2" placeholder="상세주소">
								<!-- 히든 필드 --> <input type="hidden" id="ADDR" name="ADDR"></td>
						</tr>
						<tr>
							<td>전화 <b style="color: red">*</b></td>
							<td><input type="text" style="width: 300px; padding: 10px;"
								placeholder="'-'없이 입력" id="deliveryPhone" name="phone"></td>
						</tr>
						<tr>
							<td>배송 메모 <b style="color: red"></b></td>
							<td><textarea maxlength="200" name="memo" id="take_memo"
									style="resize: none; padding: 10px; font-size: 16px; width: 400px; height: 100px;"></textarea></td>
						</tr>
					</table>

					<h3 style="margin-bottom: 20px; margin-top: 80px;">결제 수단</h3>

					<table
						style="width: 100%; border-spacing: 0px; border-collapse: collapse"
						class="user_data">
						<tr>
							<td style="width: 80%;"><input type="radio" checked
								name="payment" id="cardPayment"> 카드 결제 <input
								type="radio" style="margin-left: 50px;" name="payment"
								id="pointPayment"> 포인트 결제</td>
							<td
								style="text-align: right; background-color: rgba(27, 90, 194, 1); color: white; font-size: 20px; font-weight: 700;">총
								결제금액</td>
						</tr>
						<tr>
							<td style="height: 300px;">
								<div style="color: gray; font-size: 20px;" id="card">
									<div id="payment-method"></div>
									<div id="agreement"></div>
								</div>
								<div style="color: gray; font-size: 20px; display: none;"
									id="point">
									<h1>
										보유포인트:
										<fmt:formatNumber value="${pointvo.POINT_REM}" type="number"
											pattern="#,###p" />
									</h1>
								</div>
							</td>
							<td
								style="text-align: right; background-color: rgba(27, 90, 194, 1); color: white;"><div
									style="margin-top: 150px;">
									<div
										style="font-size: 30px; font-weight: 700; margin-bottom: 40px;">
										<c:choose>
											<c:when test="${pvo.prod_sale == '0'}">
												<fmt:formatNumber
													value="${pvo.prod_price * bvo.cart_amount}" type="number"
													pattern="#,### 원" />
											</c:when>
											<c:otherwise>
												<fmt:formatNumber value="${pvo.prod_sale * bvo.cart_amount}"
													type="number" pattern="#,### 원" />
											</c:otherwise>
										</c:choose>
									</div>

									<!-- 결제하기 버튼 -->
									<button id="payment-button"
										style="font-size: 26px; width: 100%; height: 100px; border-radius: 20px;"
										class="pay">결제하기</button>

									<div id="point-button" style="display: none;">
										<input type="hidden" value="${id}" name="client_num">
										<input type="hidden" value="${pointvo.POINT_REM}" name="point">
										<input type="hidden" value="${bvo.cart_amount}" name="amount">
										<input type="hidden" value="${pvo.prod_num}" name="prod_num">
										<input type="hidden" value="${order_num}" name="order_num">
										<input type="button"
											style="font-size: 26px; width: 100%; height: 100px; border-radius: 20px;"
											class="pay" onclick="point2(this.form)" value="point">
									</div>


									<script>
    const clientKey = "test_ck_ma60RZblrqJojBKeXmx8wzYWBn14"
    const customerKey = '${id}' // 내 상점에서 고객을 구분하기 위해 발급한 고객의 고유 ID
    const button = document.getElementById("payment-button")

    // ------  결제위젯 초기화 ------ 
    // 비회원 결제에는 customerKey 대신 ANONYMOUS를 사용하세요.
    const paymentWidget = PaymentWidget(clientKey, customerKey) // 회원 결제
    // const paymentWidget = PaymentWidget(clientKey, PaymentWidget.ANONYMOUS) // 비회원 결제
   	var pay = 0;
    if('${pvo.prod_sale}'== "0") {
    	pay = '${pvo.prod_price * bvo.cart_amount}';
    } else {
    	pay = '${pvo.prod_sale * bvo.cart_amount}';
    }
    // ------  결제위젯 렌더링 ------ 
    // 결제수단 UI를 렌더링할 위치를 지정합니다. `#payment-method`와 같은 CSS 선택자와 결제 금액 객체를 추가하세요.
    // DOM이 생성된 이후에 렌더링 메서드를 호출하세요.
    // https://docs.tosspayments.com/reference/widget-sdk#renderpaymentmethods선택자-결제-금액-옵션
    paymentWidget.renderPaymentMethods(
      "#payment-method", 
      { value: pay },
      { variantKey: "DEFAULT" } // 렌더링하고 싶은 결제 UI의 variantKey
    )

    // ------  이용약관 렌더링 ------
    // 이용약관 UI를 렌더링할 위치를 지정합니다. `#agreement`와 같은 CSS 선택자를 추가하세요.
    // https://docs.tosspayments.com/reference/widget-sdk#renderagreement선택자
    paymentWidget.renderAgreement('#agreement')
	
   const orderid = '${order_num}';
    var name = '${uvo.m_NAME}';
    var email = '${uvo.MAIL}';
    var ordername = '${pvo.prod_name}';
    const client_num = '${id}';
    // ------ '결제하기' 버튼 누르면 결제창 띄우기 ------
    // 더 많은 결제 정보 파라미터는 결제위젯 SDK에서 확인하세요.
    // https://docs.tosspayments.com/reference/widget-sdk#requestpayment결제-정보
    button.addEventListener("click", function () {
		event.preventDefault();
	      var take_peo = $('#deliveryName').val();
	      var take_phone = $('#deliveryPhone').val();
	      var take_memo = $('#take_memo').val();
	      var take_addr1 = $('#postcode2').val();
	      var take_addr2 = $('#address2').val();
	      var take_addr3 = $('#extraAddress2').val();
	      var take_addr4 = $('#detailAddress2').val();
	      var take_addr4 = $('#detailAddress2').val();
	      var address = '(' + take_addr1 + ') ' + take_addr2 + " " + take_addr3 + " " +take_addr4;
	      var prod_num = '${pvo.prod_num}';
	      var cart_amount = '${bvo.cart_amount}';
	     	var pay = 0;
	        if('${pvo.prod_sale}'== "0") {
	        	pay = '${pvo.prod_price * bvo.cart_amount}';
	        } else {
	        	pay = '${pvo.prod_sale * bvo.cart_amount}';
	        }
	        var agreeRadio = document.getElementById("agreeRadio");
		    var disagreeRadio = document.getElementById("disagreeRadio");
		    if (!agreeRadio.checked) {
	            alert("약관에 동의해야 합니다.");
	            return;
	        } else if(take_peo== null || take_peo == "") {
		    	alert("받는분 성함을 입력해주세요.");
		    	return;
		    } else if(take_addr1== null || take_addr1 == "") {
		    	alert("배송지를 입력해주세요.");
		    	return;
		    } else if(take_addr2== null || take_addr2 == "") {
		    	alert("배송지를 입력해주세요.");
		    	return;
		    } else if(take_phone== null || take_phone == "") {
		    	alert("받는분 핸드폰 번호를 입력해주세요.");
		    	return;
		    } else if(take_phone.length < 11) {
		    	alert("핸드폰 번호는 11글자로 입력해주세요.");
		    	return;
		    } else {
      paymentWidget.requestPayment({
        orderId: orderid,            // 주문 ID(직접 만들어주세요)
        orderName: ordername,                 // 주문명
        successUrl:  "http://localhost:8090/ordercom2.do?take_peo=" + encodeURIComponent(take_peo) + "&take_addr=" + encodeURIComponent(address) + "&take_phone=" + encodeURIComponent(take_phone) + "&take_memo=" + encodeURIComponent(take_memo) + "&pay_type=0&pay_oknum=" + encodeURIComponent(orderid) + "&client_num=" + encodeURIComponent(client_num) + "&cart_price=" + encodeURIComponent(pay) + "&prod_num=" + encodeURIComponent(prod_num) + "&cart_amount=" + encodeURIComponent(cart_amount),
        failUrl: "http://localhost:8090/error.do",        // 결제에 실패하면 이동하는 페이지(직접 만들어주세요)
        customerEmail: email,
        customerName: name
      });

/* $.ajax({
	url : "/ordercom2.do",
	type : 'post',
	data : {
		take_peo : take_peo,
		take_addr : address,
		take_phone : take_phone,
		take_memo : take_memo,
		pay_type : 0,
		pay_oknum : orderid,
		client_num : client_num,
		cart_price : pay,
		prod_num : prod_num,
		cart_amount : cart_amount
	},
	success : function(data) {
				
     },
	error : function() {
		alert("error");
	}
}); */
		    }
    });
    
  </script>
									<script>
    const cardPayment = document.getElementById("cardPayment");
    const pointPayment = document.getElementById("pointPayment");
    const card = document.getElementById("card");
    const point = document.getElementById("point");
    const cardbtn = document.getElementById("payment-button");
    const pointbtn = document.getElementById("point-button");

    cardPayment.addEventListener("change", function() {
        if (cardPayment.checked) {
            card.style.display = "block";
            cardbtn.style.display = "block";
            point.style.display = "none";
            pointbtn.style.display = "none";
        }
    });

    pointPayment.addEventListener("change", function() {
        if (pointPayment.checked) {
            card.style.display = "none";
            cardbtn.style.display = "none";
            point.style.display = "block";
            pointbtn.style.display = "block";
        }
    });
</script>
								</div></td>
						</tr>
					</table>
				</form>
			</div>
		</section>
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>