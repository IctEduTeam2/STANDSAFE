<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<!-- <div style="width: 100%;">
	<table style="float: left; margin-left: -10%; margin-top: 10%; border: 1px solid black; width: 20%; height: 400px;">
		<tr>
			<th>전체 반품 건수:</th>
			<td>100개</td>
		</tr>
		<tr>
			<th>오늘 반품 건수: </th>
			<td>100개</td>
		</tr>
	</table>
	검색 영역
	 <div class="search_wrap">
	<form id="searchForm" action="/admin/orderList" method="get">
	<table style="float: left; margin-left: 2%; margin-top: 10%; border: 1px solid black; width: 55%; height: 400px;">
					<tr>
						<th style="width: 200px;">상품명</th>
							<td colspan="3">
							<input type="text" id="proNm" name="proName" value="" title="상품명검색" style="width: 300px; height: 40px;">
							</td>
					</tr>
						<tr>
						<th style="width: 200px;">반품 신청일</th>
							<td>
							<select id="searchKey" name="searchKey" title="검색항목" class="select_option" style="width: 300px; height: 40px; font-size: 20px;">
									<option value="">검색조건</option>
									<option value="producNm">상품명</option>
									<option value="content">내용</option>
									<option value="createName">등록자명</option>
							</select>
							</td>
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
					</tr> -->
				
	</table>
	</form>
</div>
	<div class="admin_content_wrap" style=" width:100%; ">
		<div class="admin_content_subject" style="width: 80%; margin: auto;">
			<span>주문상세내역 - 주문번호나옴</span>
		</div>
		<div class="author_table_wrap" style="width: 80%; margin: auto;">
			<!-- 게시물 O -->
			<c:if test="${listCheck != 'empty' }">
				<table class="order_table">
					<colgroup>
						<col width="5%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="5%"> 
						<col width="10%"> 
						<col width="10%"> 
						<col width="10%"> 
						<col width="10%"> 
					</colgroup>
					<thead>
						<tr>
							<td class="th_column_1"><input type="checkbox" name="th_column_1" onclick='selectAll(this)'></td>
							<td class="th_column_2">상품이미지</td>
							<td class="th_column_3">주문번호</td>
							<td class="th_column_4">아이디</td>
							<td class="th_column_5">상품명</td>
							<td class="th_column_6">구매가격</td>
							<td class="th_column_7">구매수량</td>
							<td class="th_column_8">신청날짜</td>
							<td class="th_column_9">처리날짜</td>
							<td class="th_column_10">처리상태</td>
							<td class="th_column_11">관리자 서명</td>
						</tr>
					</thead>
					<tbody>
						<%-- <c:forEach items="${list}" var="list">
	                    		<tr>
	                    			<td><c:out value="${list.select}"></c:out> </td>
	                    			<td><c:out value="${list.images}"></c:out> </td>
	                    			<td><c:out value="${list.productname}"></c:out> </td>
	                    			<td><c:out value="${list.regularprice}"></c:out></td>
	                    			<td><c:out value="${list.saleprice}"></c:out></td>
	                    			<td><c:out value="${list.sellingprice}"></c:out></td>
	                    			<td><c:out value="${list.salesquantity}"></c:out></td>	                    			
	                    			<td><fmt:formatDate value="${list.orderDate}" pattern="yyyy-MM-dd"/></td>
	                    			<td><c:out value="${list.orderState}"/></td>
	             				</tr>
	                    		</c:forEach> --%>
						<tr>
							<td><input type="checkbox" name="th_column_1"></td>
							<td></td>
							<td>20230828k</td>
							<td>사용자1</td>
							<td>뚝배기</td>
							<td>12000</td>
							<td>1</td>
							<td>2023-01-01</td>
							<td>2023-01-02</td>
							<td>상품 출고</td>
							<td>admin</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="th_column_1"></td>
							<td></td>
							<td>20230828o</td>
							<td>사용자1</td>
							<td>뚝배기</td>
							<td>12000</td>
							<td>1</td>
							<td>2023-01-01</td>
							<td>2023-01-02</td>
							<td>상품 준비중</td>
							<td>admin</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="th_column_1"></td>
							<td></td>
							<td>20230828q</td>
							<td>사용자1</td>
							<td>뚝배기</td>
							<td>12000</td>
							<td>1</td>
							<td>2023-01-01</td>
							<td>2023-01-02</td>
							<td>상품 출고</td>
							<td>admin</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="th_column_1"></td>
							<td></td>
							<td>20230828w</td>
							<td>사용자1</td>
							<td>뚝배기</td>
							<td>12000</td>
							<td>1</td>
							<td>2023-01-01</td>
							<td>2023-01-02</td>
							<td>상품 준비중</td>
							<td>admin</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="th_column_1"></td>
							<td></td>
							<td>20230828e</td>
							<td>사용자1</td>
							<td>뚝배기</td>
							<td>12000</td>
							<td>1</td>
							<td>2023-01-01</td>
							<td>2023-01-02</td>
							<td>상품 준비중</td>
							<td>admin</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="th_column_1"></td>
							<td></td>
							<td>20230828y</td>
							<td>사용자1</td>
							<td>뚝배기</td>
							<td>12000</td>
							<td>1</td>
							<td>2023-01-01</td>
							<td>2023-01-02</td>
							<td>배송중</td>
							<td>admin</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="th_column_1"></td>
							<td></td>
							<td>20230828t</td>
							<td>사용자1</td>
							<td>뚝배기</td>
							<td>12000</td>
							<td>1</td>
							<td>2023-01-01</td>
							<td>2023-01-02</td>
							<td>배송중</td>
							<td>admin</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="th_column_1"></td>
							<td></td>
							<td>20230828r</td>
							<td>사용자1</td>
							<td>뚝배기</td>
							<td>12000</td>
							<td>1</td>
							<td>2023-01-01</td>
							<td>2023-01-02</td>
							<td>배송 완료</td>
							<td>admin</td>
						</tr>

					</tbody>
				</table>

			</c:if>

			<!-- 게시물 x -->
			<%-- 	<c:if test="${listCheck == 'empty'}">
                			<div class="table_empty">
                				등록된 작가가 없습니다.
                			</div>
                		</c:if> 	 --%>

		</div>
		<!-- 하단 버튼 -->
		<div style="width: 80%; margin: auto;">
			<span style="float: right; margin-top: 80px; ">
				<button type="button" value="삭제" style="width: 250px; height: 60px; font-size: 25px; background-color: #505BBD; color: white; border: none;">확인</button>
			</span> 
			<span style="float: right; margin-top: 80px; margin-right: 100px;">
				<button type="button" value="삭제" style="width: 250px; height: 60px; font-size: 25px; background-color: #505BBD; color: white; border: none;" onclick="location.href='/order_list.do'">목록</button>
			</span> 
			<span style="float: right; margin-top: 80px; margin-right: 100px;">
				<select id="searchKey" name="searchKey" title="검색항목" class="select_option" style="width: 300px; height: 60px; font-size: 20px; text-align: center;">
					<option value="">===== 상태 선택 =====</option>
					<option value="producNm">상품 준비중</option>
					<option value="producNm2">상품 출고</option>
					<option value="content">배송중</option>
					<option value="createName">배송 완료</option>
				</select>
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