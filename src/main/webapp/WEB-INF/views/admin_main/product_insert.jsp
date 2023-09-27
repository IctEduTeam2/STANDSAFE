<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/basis.css" />
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
	width: 200px;
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
<!-- <script type="text/javascript">
	function save_go() {
		var form = document.getElementById("frm");
		alert(frm.prod_name.value);
		
		form.submit();
	}
</script> -->
<script type="text/javascript">
	function save_go() {
		var form = document.getElementById("frm");
		
		// 판매가와 할인가격을 가져옵니다.
		var regular_price = frm.regualr_price.value;
		var sales_price = frm.sales_price.value;
		
		// 판매가와 할인가격이 같은 경우
		if (parseInt(regular_price) <= parseInt(sales_price)) {
			alert("할인가격이 판매가와 같거나 클수 없습니다.");
			return false;  // 함수 종료
		} else {
			form.submit();
		}

		
	}
</script>
<script>
	function updateSubCategory() {
		var prodhighSelect = document.getElementsByName("prodhigh")[0];
		var prodlowSelect = document.getElementsByName("prodlow")[0];
		var selectedCategory = prodhighSelect.value;

		// 먼저 중분류 드롭다운을 초기화합니다.
		prodlowSelect.innerHTML = '<option value="">중분류 선택</option>';

		// 선택한 대분류에 따라 중분류 옵션을 추가합니다.
		if (selectedCategory === "1") {
			prodlowSelect.innerHTML += '<option value="1">소화기</option>';
			prodlowSelect.innerHTML += '<option value="2">화재감지/대피</option>';
		} else if (selectedCategory === "2") {
			prodlowSelect.innerHTML += '<option value="1">구급함/제세동기</option>';
			prodlowSelect.innerHTML += '<option value="2">재난안전용품</option>';
			prodlowSelect.innerHTML += '<option value="3">방역안전용품</option>';
		} else if (selectedCategory === "3") {
			prodlowSelect.innerHTML += '<option value="1">마스크</option>';
			prodlowSelect.innerHTML += '<option value="2">위생장갑</option>';
			prodlowSelect.innerHTML += '<option value="3">통조림/비상식량</option>';
		}
	}
</script>
</head>
<body>
	<div id="mydiv">
		<jsp:include page="../admin_main/header.jsp"></jsp:include>
	</div>
	<section>
		<article style="width: 100%;">
			<div style="float: left; width: 100%; height: 300px;">
				<h1 style="text-align: center; font-size: 30px; margin-top: 150px;">상품등록
					작성화면</h1>
			</div>
		</article>
	</section>
	<form action="/product_insert.do" id="frm" method="post" enctype="multipart/form-data">
		<table style="margin: auto; border: 1px solid;">
			<tr>
				<th>판매 상태</th>
				<td colspan="5">
				<!-- <span><input type="radio" name="prodst" value="0"
						style="border: 0; height: 15px; width: 50px;">판매중</span> -->
						
						<span><input type="radio" name="prodst" value="1"
						style="border: 0; height: 15px; width: 50px;">미판매중</span></td>

			</tr>
			<tr>
				<th>카테고리</th>
				<td colspan="5"><select name="prodhigh" id="prodhigh"
					style="width: 150px; height: 50px;" onchange="updateSubCategory()">
						<option value="">대분류 선택</option>
						<option value="1">소방/안전</option>
						<option value="2">재난/응급/긴급</option>
						<option value="3">일상/기타</option>
				</select> <select name="prodlow" id="prodlow" style="width: 150px; height: 50px;">
						<option value="">중분류 선택</option>
				</select></td>
			</tr>
	
			<tr>
				<th>상품명</th>
				<td colspan="5"><input type="text" name="prod_name" id="prod_name"></td>

			</tr>
			<tr>
				<th>정상가</th>
				<td><input type="text" name="regualr_price" id="regualr_price"></td>
				<th>할인가격</th>
				<td><input type="text" name="sales_price" id="sales_price"></td>
			</tr>
			<tr>
				<th>재고 수량</th>
				<td colspan="5"><input type="text" name="invenq" id="invenq"></td>
			</tr>
			<tr>
				<th>등록일자</th>
				<td colspan="5"><input type="date" name="regdate" id="regdate"></td>
			</tr>
			<tr>
				<th>썸네일 이미지</th>
				<td colspan="5"><input type="file" id="thumbnail" name="thumbnail"></td>
			</tr>
			<tr>
				<th>상세 이미지</th>
				<td colspan="5"><input type="file" id="detail_img" name="detail_img"></td>
			</tr>



		</table>




		<!-- 하단 버튼 -->
		<div style="margin-bottom: 20%; margin-left: 40%;">
			<span style="float: left; margin-top: 80px; margin-right: 100px;">
				<button type="submit" value="등록" onclick="return save_go();">등록</button>
			</span> <span style="float: left; margin-top: 80px; margin-right: 100px;">
				<button type="button" value="목록"
					onclick="location.href='/product_list.do'">목록</button>
			</span> <span style="float: left; margin-top: 80px; margin-right: 100px;">
				<button type="button" value="취소"
					onclick="location.href='/product_list.do'">취소</button>
			</span>
		</div>
	</form>





	<!-- footer -->
	<jsp:include page="../Semantic/footer.jsp"></jsp:include>
</body>
</html>