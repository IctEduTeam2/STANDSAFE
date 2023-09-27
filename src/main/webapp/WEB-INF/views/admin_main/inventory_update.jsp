<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 스타일링을 위한 CSS 코드 */
body {
	font-family: Arial, sans-serif;
}

#search-form {
	margin: 20px;
}

#results {
	margin: 20px;
}

table {
	width: 100%;
	border: 1px solid #444444;
	border-collapse: collapse;
	margin-left: 20%;
}

th {
	border: 1px solid #444444;
	padding: 10px;
	width: 50px;
	background-color: #505BBD;
	color: white;
}

td {
	border: 1px solid #444444;
	padding: 10px;
	width: 300px;
}

input {
	border: 0;
	height: 30px;
	width: 250px;
}

button {
	width: 100px;
	height: 40px;
	font-size: 25px;
	background-color: #505BBD;
	color: white;
	border: none;
}
</style>
<link rel="stylesheet" href="resources/css/basis.css" />

<script type="text/javascript">
	function go_update() {
		location.href = "/inventory_update.do";
		document.getElementById("frm").submit();
	}
</script>
</head>
<body>
	<div id="mydiv">
		<jsp:include page="../admin_main/header.jsp"></jsp:include>
		<div style="width: 100%; margin: auto;">
			<div style="float: left; width: 100%; height: 300px;">
				<h1 style="text-align: center; font-size: 30px; margin-top: 150px;">재고
					관리</h1>
			</div>
			<form id="frm" name="frm" method="post" action="/inventory_update.do">
				<input type="hidden" id="prod_num" name="prod_num"
					value="${invo.PROD_NUM}">
				<table style="margin: auto; border: 1px solid;">
					<tr>
						<th>판매 상태</th>
						<td colspan="3">
								<span><input type="radio" name="prodStatus" id="prodStatus"
								style="border: 0; height: 15px; width: 50px;" value="0"
								${invo.PROD_ST == 0 ? 'checked' : ''} />판매중</span> 
								<span><input type="radio" name="prodStatus" id="prodStatus" 
								style="border: 0; height: 15px; width: 50px;" value="1"
								${invo.PROD_ST == 1 ? 'checked' : ''} />미판패중</span></td>
					</tr>
					<tr>
						<th>상품명</th>
						<td colspan="5"><input type="text" id="prod_name"
							name="prod_name" value="${invo.PROD_NAME }"></td>
					</tr>
					<tr>
						<th>정상가</th>
						<td><input type="text" name="regualr_price"id="regualr_price" value="${invo.PROD_PRICE}"></td>
						<th>할인가격</th>
						<td><input type="text" name="sales_price" id="sales_price" value="${invo.PROD_SALE}"></td>
					</tr>
					<tr>
						<th>판매 수량</th>
						<td colspan="5"><input type="text" id="salesq" name="salesq"
							value=""></td>
					</tr>
					<tr>
						<th>재고 수량</th>
						<td colspan="5"><input type="text" id="invenq" name="invenq"
							value="${invo.PROD_AMOUNT}"></td>
					</tr>
				<%-- 	<tr>
						<th>등록일자</th>
						<td colspan="5"><input type="date" id="regdate"
							name="regdate" value="${invo.PROD_REGDATE}"></td>
					</tr> --%>
					<tr>
						<th>썸네일 이미지</th>
						<td colspan="5">
						<img src="resources/images/products/${invo.PROD_IMG}" />
					</tr>
					<tr>
						<th>상세 이미지 </th>
						<td colspan="5">
						<img src="resources/images/products/${invo.PROD_DETAIL}" /></td>
					</tr>


				</table>
				<!-- 하단 버튼 -->
				<div style="margin-bottom: 20%; margin-left: 40%;">
					<span style="float: left; margin-top: 80px; margin-right: 100px;">
						<button type="button" value="등록" onclick="go_update()">수정</button>
					</span> <span style="float: left; margin-top: 80px; margin-right: 100px;">
						<button type="button" value="다시"
							onclick="location.href='/inventory_management.do'">목록</button>
					</span> <span style="float: left; margin-top: 80px; margin-right: 100px;">
						<button type="button" value="취소"
							style="background-color: #B5B5B5;">취소</button>
					</span>
				</div>
			</form>
		</div>
	</div>
	<!-- footer -->
	<div style="margin-top: 20%;">
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>