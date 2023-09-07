<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STANDSAFE</title>
<link rel="stylesheet" href="resources/css/basis.css" />
<link rel="stylesheet" href="resources/css/admin/admin_list.css" />
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
</style>
<script type="text/javascript">
function selectAll(selectAll)  {
	  const checkboxes 
	     = document.querySelectorAll('input[type="checkbox"]');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}
</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<!--실시간 현황  -->
	<div style="width: 100%;">
	<table style="float: left; margin-left: 10%; margin-top: 10%; border: 1px solid black; width: 20%; height: 400px;">
		<tr>
			<th>전체 주문 건수:</th>
			<td>100개</td>
		</tr>
		<tr>
			<th>오늘 주문 건수:</th>
			<td>100개</td>
		</tr>
	</table>
	<!-- 검색 영역 -->
	<!--  <div class="search_wrap"> -->
	<form id="searchForm" action="/admin/orderList" method="get">
	<table style="float: left; margin-left: 5%; margin-top: 10%; border: 1px solid black; width: 55%; height: 400px;">
					<tr>
						<th style="width: 200px;">구분</th>
							<td>
							<select id="searchKey" name="searchKey" title="검색항목" class="select_option" style="width: 300px; height: 40px; font-size: 20px;">
									<option value="">검색조건</option>
									<option value="producNm">상품명</option>
									<option value="content">주문번호</option>
									<option value="createName">등록자명</option>
							</select>
							</td>
							<td colspan="3">
							<input type="text" id="proNm" name="proName" value="" title="상품명검색" style="width: 300px; height: 40px;">
							</td>
					</tr>
						<tr>
						<th style="width: 200px;">주문 날짜</th>
							<td>
							<input type="date" style="height: 40px; width: 300px;">
							</td>
							<td>
							<input type="date" style="height: 40px; width: 300px;">
							</td>
					</tr>
						
					<tr>
						<td colspan="2"></td>
						<td>
							<input type="button" alt="검색" value="검색" style="width: 200px; height: 60px; font-size: 25px; border-radius: 10px; background-color: #505BBD; color: white; border: none; float: right;">
						</td>
						<td>
							<input type="button" alt="초기화" value="초기화" style="width: 200px; height: 60px; font-size: 25px; border-radius: 10px; background-color: #B5B5B5; color: white; border: none;  float: right; margin-right: 20px;">
						</td>	
					</tr>
				
	</table>
	</form>
</div>
	<div class="admin_content_wrap" style="margin: auto; width: 100%;">
		<div style="width: 80%; margin: auto;">
			<div style="width: 98%; background-color: #1b5ac2; color: white;  margin: 30px 0;  padding-left: 2%; padding-top: 50px; padding-bottom: 50px; float: left; font-size: 32px;">주문 목록</div>
		</div>
		<div class="author_table_wrap" style="width: 80%; margin: auto;">
			<!-- 게시물 O -->
				<table class="order_table">
					<colgroup>
						<col width="10%">
						<col width="15%">
						<col width="15%">
						<col width="15%">
						<col width="15%">
						<col width="15%">
						<col width="15%"> 
					</colgroup>
					<thead>
						<tr>
							<td class="th_column_1"><input type="checkbox" name="th_column_1" onclick='selectAll(this)'></td>
							<td class="th_column_2">회원번호</td>
							<td class="th_column_3">수령인</td>
							<td class="th_column_4">주소</td>
							<td class="th_column_5">수령인 핸드폰</td>
							<td class="th_column_6">배송메모</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="ovo">
							<tr>
								<td><input type="checkbox" name="th_column_1"></td>
								<td><a href="/order_detail.do?client_num=${ovo.CLIENT_NUM}">${ovo.CLIENT_NUM }</a></td>
								<td>${ovo.TAKE_PEO }</td>
								<td>${ovo.TAKE_ADDR}</td>
								<td>${ovo.TAKE_PHONE}</td>	
								<td>${ovo.TAKE_MEMO}</td>				
	                        </tr>
						</c:forEach>
					</tbody>
				</table>

		</div>
		</div>

		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
		<script>
			// 검색 버튼 클릭 시 실행될 함수
			document
					.getElementById('search-button')
					.addEventListener(
							'click',
							function() {
								const keyword = document
										.getElementById('search-keyword').value;
								const date = document
										.getElementById('date-filter').value;

								// 여기에서 검색 및 결과 표시 로직을 구현합니다.
								// 이 예시에서는 결과를 단순히 results 엘리먼트에 텍스트로 표시합니다.
								const resultsElement = document
										.getElementById('results');
								resultsElement.innerHTML = `검색어: ${keyword}<br>등록일: ${date}`;
							});
		</script>
</body>
</html>