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

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<!--실시간 현황  -->
	<div style="width: 100%; float: left;">
	<div style="width: 85%; margin: auto;">
	<table style="float: left; margin-top: 10%; border: 1px solid black; width: 30%; height: 400px; margin-left: 3%;">
		<tr>
			<th>전체 등록 상품:</th>
			<td>100개</td>
		</tr>
		<tr>
			<th>오늘 등록 상품: </th>
			<td>100개</td>
		</tr>
	</table>
	<!-- 검색 영역 -->
	<!--  <div class="search_wrap"> -->
	<form id="searchForm" action="/admin/orderList" method="get">
	<table style="float: right; margin-left: 2%; margin-top: 10%; border: 1px solid black; width: 60%; height: 400px; margin-right: 3%">
					<tr>
						<th style="width: 200px;">구분</th>
							<td>
							<select id="searchKey" name="searchKey" title="검색항목" class="select_option" style="width: 300px; height: 40px; font-size: 20px;">
									<option value="">검색조건</option>
									<option value="producNm">상품명</option>
									<option value="content">내용</option>
									<option value="createName">등록자명</option>
							</select>
							</td>
							<td colspan="3">
							<input type="text" id="proNm" name="proName" value="" title="상품명검색" style="width: 300px; height: 40px;">
							</td>
					</tr>
						<tr>
						<th style="width: 200px;">상품 등록일</th>
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
</div>
	<div class="admin_content_wrap" style="margin: auto; width: 100%;">
		<div style="width: 80%; margin: auto;">
			<div style="width: 98%; background-color: #1b5ac2; color: white;  margin: 30px 0;  padding-left: 2%; padding-top: 50px; padding-bottom: 50px; float: left; font-size: 32px;">상품 목록</div>
		</div>
		<div class="author_table_wrap" style="width: 80%; margin: auto;">
			<!-- 게시물 O -->
				<table class="order_table">
					<colgroup>
						<col width="5%">
						<col width="20%">
						<col width="15%">
						<col width="15%">
						<col width="15%">
						<col width="10%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr>
							<td class="th_column_1">선택</td>
							<td class="th_column_2">상품이미지</td>
							<td class="th_column_3">상품명</td>
							<td class="th_column_4">정상가</td>
							<td class="th_column_5">판매가</td>
							<td class="th_column_6">재고</td>
							<td class="th_column_7">등록일</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="pvo">
						<tr>
                                <td><input type="checkbox"></td>
                                <td>${pvo.PROD_IMG}</td>
                                <td>${pvo.PROD_NAME}</td>
                                <td>${pvo.PROD_PRICE}</td>
                                <td>${pvo.PROD_SALE}</td>
                                <td>${pvo.PROD_AMOUNT}</td>
                                <td>
                                <fmt:parseDate value="${pvo.PROD_REGDATE}" var="regdate" pattern="yyyy-MM-dd HH:mm:ss" />
                                <fmt:formatDate value="${regdate}" pattern="yyyy-MM-dd" />
                                </td>
                            </tr>
                        </c:forEach>
					</tbody>
				</table>

		</div>
		<!-- 하단 버튼 -->
		<div style="width: 80%; margin: auto;">
			<span style="float: right; margin-top: 80px;">
				<button type="button" alt="삭제" value="삭제"
				style="width: 250px; height: 60px; font-size: 25px; background-color: #505BBD; color: white; border: none;">삭제</button>
			</span> <span style="float: right; margin-top: 80px; margin-right: 100px;">
				<button type="button" alt="등록" value="등록"
				style="width: 250px; height: 60px; font-size: 25px; background-color: #505BBD; color: white; border: none;" onclick="location.href='/product_insertform.do'">등록</button>
			</span> <span style="float: right; margin-top: 80px; margin-right: 100px;">
				<button type="button" alt="홈페이지등록" value="홈페이지등록"
				style="width: 250px; height: 60px; font-size: 25px; background-color: #505BBD; color: white; border: none;">홈페이지등록</button>
			</span>
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