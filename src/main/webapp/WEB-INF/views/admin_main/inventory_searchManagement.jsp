<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script type="text/javascript">

function searchList(){
    location.href="/inventorySearchList.do";
    document.getElementById('searchForm').submit();
}

function selectAll(selectAll)  {
	  const checkboxes 
	     = document.querySelectorAll('input[type="checkbox"]');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}
</script>
<script>
function delete_ok() {
  // 체크된 항목을 배열로 저장
  const deleteProducts = [];
  const checkboxes = document.querySelectorAll('#chk');
  checkboxes.forEach(checkbox => {
    if (checkbox.checked) {
    	var prod_num = checkbox.nextElementSibling;
    	deleteProducts.push(prod_num.value);
    }
  });

  // 배열을 문자열로 변환하여 hidden input에 설정
  document.getElementById('deleteProducts').value = deleteProducts.join(',');

	  if (deleteProducts.length === 0) {
	        alert('삭제할 상품을 선택해주세요');
	      } else {
	        alert('선택한 상품을 삭제하였습니다.');
	        location.href="/productDelete.do";
	        document.getElementById('productForm').submit();
	      }
	  
  
  
  
  
}


</script>
</head>
<body>
	<jsp:include page="../admin_main/header.jsp"></jsp:include>
	<!--실시간 현황  -->
	<div style="width: 100%;">
		<table
			style="float: left; margin-left: 10%; margin-top: 10%; border: 1px solid black; width: 20%; height: 400px;">
			<tr>
					<th>전체 등록 상품:</th>
					<td><c:out value= "${totalCount}" /></td>
			</tr>
			<tr>
					<th>오늘 등록 상품:</th>
					<td><c:out value="${today_reg}" /></td>
			</tr>
			<!-- <tr>
				<th>전체 판매 상품:</th>
				<td>100개</td>
			</tr>
			<tr>
				<th>전체 반품 상품:</th>
				<td>100개</td>
			</tr> -->
		</table>
		<!-- 검색 영역 -->
		<!--  <div class="search_wrap"> -->
		<form id="searchForm" name="searchForm"
				action="/inventorySearchList.do" method="get">
				<input type="hidden" name="cPage" value="1" /> <input
					type="hidden" name="pageSize" value="10" />
			<table
				style="float: left; margin-left: 5%; margin-top: 10%; border: 1px solid black; width: 55%; height: 400px;">
				<tr>
					<th style="width: 200px;">상품명</th>
					<td colspan="3"><input type="text" id="searchText"
							name="searchText" value="${param.searchText}" title="상품명검색" style="width: 300px; height: 40px;">
					</td>
				</tr>
				<tr>
					<th style="width: 200px;">상품 등록일</th>
					<td><input type="date" id="stDate" name="stDate"
							value="${param.stDate}" style="height: 40px; width: 300px;"></td>
					<td><input type="date" id="endDate" name="endDate"
							value="${param.endDate}" style="height: 40px; width: 300px;"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td><input type="button" alt="검색" value="검색"
						style="width: 200px; height: 60px; font-size: 25px; border-radius: 10px; background-color: #505BBD; color: white; border: none; float: right;"
						onclick="searchList();" />
					</td>
					<td><input type="reset" alt="초기화" value="초기화"
						style="width: 200px; height: 60px; font-size: 25px; border-radius: 10px; background-color: #B5B5B5; color: white; border: none; float: right; margin-right: 20px;">
					</td>
				</tr>

			</table>
		</form>
	</div>

	<div class="admin_content_wrap" style="margin: auto; width: 100%;">
		<div style="width: 80%; margin: auto;">
			<div
				style="width: 98%; background-color: #1b5ac2; color: white; margin: 30px 0; padding-left: 2%; padding-top: 50px; padding-bottom: 50px; float: left; font-size: 32px;">재고
				목록</div>
		</div>
		<form id="productForm" name="productForm" method="post" action="/productDelete.do">
		<input type="hidden" id="deleteProducts" name="deleteProducts" />
		<div class="author_table_wrap" style="width: 80%; margin: auto;">

			
			<!-- 게시물 O -->
			<table class="order_table">
				<colgroup>
					<col width="5%">
					<col width="20%">
					<col width="15%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="15%">
					<col width="15%">
				</colgroup>
				<thead>

					<tr>
						<td class="th_column_1"><input type="checkbox"
							name="th_column_1" onclick='selectAll(this)'></td>
						<td class="th_column_2">상품이미지</td>
						<td class="th_column_3">상품명</td>
						<td class="th_column_4">정상가</td>
						<td class="th_column_5">판매가</td>
						<td class="th_column_6">재고</td>
						<td class="th_column_7">등록일</td>
						<td class="th_column_8">수정일</td>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${list}" var="ivo">
						<tr>
							<td><input type="checkbox" id="chk" name="chk" />
								<input type="hidden" id="prod_num" name="prod_num" value="${ivo.PROD_NUM }" />
							</td>
							<td><img src="resources/images/products/${ivo.PROD_IMG}" style="width: 200px; height:200px;"/></td>
							<td><a
								href="/inventory_updateform.do?prod_num=${ivo.PROD_NUM}">${ivo.PROD_NAME}</a></td>
							<td>${ivo.PROD_PRICE}</td>
							<td>${ivo.PROD_SALE}</td>
							<td>${ivo.PROD_AMOUNT}</td>
							<td><fmt:parseDate value="${ivo.PROD_REGDATE}" var="regdate"
									pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
									value="${regdate}" pattern="yyyy-MM-dd" /></td>
							<td><fmt:parseDate value="${ivo.PROD_MODIFYDATE}"
									var="modifydate" pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
									value="${modifydate}" pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>


				</tbody>
				<!-- 페이지 번호 출력 부분 -->
				<tfoot>
					<tr>
						<td colspan="20">
							<ol class="paging">
								<!-- 이전버튼 : 첫블럭이면 비활성화-->
								<c:choose>
									<c:when test="${paging.beginBlock <= paging.pagePerBlock}">
										<li class="disable">이전으로</li>
									</c:when>
									<c:otherwise>
										<li><a
											href="/inventorySearchList.do?cPage=${paging.beginBlock-paging.pagePerBlock}&pageSize=10&searchText=${param.searchText}&stDate=${param.stDate}&endDate=${param.endDate}">이전으로</a></li>
									</c:otherwise>
								</c:choose>

								<c:forEach begin="${paging.beginBlock}" end="${paging.endBlock}"
									step="1" var="k">
									<!-- 페이지 번호가 실제 총 페이지 수를 초과하는 경우 표시하지 않음 -->
									<c:if test="${k <= paging.totalPage}">
										<c:if test="${k == paging.nowPage}">
											<!-- 현재페이지와 같으면 -->
											<li class="now">${k}</li>
										</c:if>
										<c:if test="${k != paging.nowPage}">
											<li><a
												href="/inventorySearchList.do?cPage=${k}&pageSize=10&searchText=${param.searchText}&stDate=${param.stDate}&endDate=${param.endDate}">${k}</a></li>
										</c:if>
									</c:if>
								</c:forEach>

								<!-- 이후버튼 -->
								<c:choose>
									<c:when test="${paging.endBlock >= paging.totalPage}">
										<li class="disable">다음으로</li>
									</c:when>
									<c:otherwise>
										<li><a
											href="/inventorySearchList.do?cPage=${paging.beginBlock+paging.pagePerBlock}&pageSize=10&searchText=${param.searchText}&stDate=${param.stDate}&endDate=${param.endDate}">다음으로</a></li>
									</c:otherwise>
								</c:choose>
							</ol>
						</td>
					</tr>
				</tfoot> 
			</table>
		</div>
		</form>
		<!-- 하단 버튼 -->
		<div style="width: 80%; margin: auto;">
			<span style="float: right; margin-top: 80px;">
				<button type="button" value="삭제"
					style="width: 250px; height: 60px; font-size: 25px; background-color: #505BBD; color: white; border: none;" onclick="delete_ok()">삭제</button>
				<!-- 	</span> <span style="float: right; margin-top: 80px; margin-right: 100px;">
				<button type="button" value="수정"
				style="width: 250px; height: 60px; font-size: 25px; background-color: #505BBD; color: white; border: none;" onclick="location.href='/inventory_updateform.do'">수정</button>-->
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