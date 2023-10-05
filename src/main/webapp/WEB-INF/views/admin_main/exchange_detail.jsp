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
	
function st_update(){
	
	var checkbox = document.getElementById("exchk");
	if (checkbox.checked) {
		var frm = document.getElementById("frm");
		document.getElementById("pb_st").value = document.getElementById("searchKey").value;
		location.href="/exchange_update.do";
		document.getElementById('frm').submit();
	} else {
		alert("업데이트 할 상품을 선택해 주세요");
	}
}
</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="admin_content_wrap" style=" width:100%; ">
		<div class="admin_content_subject" style="width: 80%; margin: auto;">
		<div style="width: 98%; background-color: #1b5ac2; color: white;  margin: 30px 0;  padding-left: 2%; padding-top: 50px; padding-bottom: 50px; float: left; font-size: 32px;">교환상세내역 - 주문번호나옴</div>
			
		</div>
		<div class="author_table_wrap" style="width: 80%; margin: auto;">
			<!-- 게시물 O -->
			<c:if test="${listCheck != 'empty' }">
			<form id="frm" name="frm" method="post" action="/exchange_update.do">
			<input type ="hidden" id="pb_num" name="pb_num" value="${evo2.PB_NUM}"/>
			<input type="hidden" id="pb_st" name="pb_st" value="${evo2.PB_ST }" />
			<input type="hidden" id="payOkNum" name="payOkNum" value="${evo2.PAY_OKNUM }" />
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
							<td class="th_column_8">신청날짜</td>
							<td class="th_column_9">처리상태</td>
							<td class="th_column_11">관리자 서명</td>
						</tr>
					</thead>
					<tbody>
					
						<tr>
							<td><input type="checkbox" name="exchk" id="exchk"></td>
							<td><img src="resources/images/products/${evo2.getProductVO().getPROD_IMG()}" /></td>
							<td>${evo2.PAY_OKNUM}</td>
							<td>${evo2.CLIENT_NUM}</td>
							<td>${evo2.getProductVO().getPROD_NAME()}</td>
							<td>${evo2.getPAY_MONEY()}</td>
							<td>${evo2.PB_DATE}</td>
							<td>
								<c:choose>
									 <c:when test="${evo2.PB_ST == '0'}">교환 접수 중</c:when>
       								 <c:when test="${evo2.PB_ST == '1'}">교환 접수 완료</c:when>
       								 <c:when test="${evo2.PB_ST == '2'}">교환 회수 완료</c:when>
       								 <c:when test="${evo2.PB_ST == '3'}">교환 완료</c:when>
       								 <c:when test="${evo2.PB_ST == '4'}">반품 접수 중</c:when>
       								 <c:when test="${evo2.PB_ST == '5'}">반품 접수 완료</c:when>
       								 <c:when test="${evo2.PB_ST == '6'}">반품 회수 완료</c:when>
       								 <c:when test="${evo2.PB_ST == '7'}">반품 완료</c:when>
       								 <c:when test="${evo2.PB_ST == '8'}">상품 취소</c:when>
      								 <c:otherwise>${evo2.PB_ST}</c:otherwise>
   								 </c:choose>
							</td>
							<td>${evo2.CONFIRM_ID}</td>
						</tr>
					</tbody>
				</table>
				</form>
				</c:if>

		</div>
		<!-- 하단 버튼 -->
		<div style="width: 80%; margin: auto;">
			<span style="float: right; margin-top: 80px;">
				<button type="button" value="삭제" style="width: 250px; height: 60px; font-size: 25px; background-color: #505BBD; color: white; border: none;" onclick="st_update()">확인</button>
			</span> 
			<span style="float: right; margin-top: 80px; margin-right: 100px;">
				<button type="button" value="삭제" style="width: 250px; height: 60px; font-size: 25px; background-color: #505BBD; color: white; border: none;" onclick="location.href='/exchange_list.do'">목록</button>
			</span> 
			<span style="float: right; margin-top: 80px; margin-right: 100px;">
				<select id="searchKey" name="searchKey" title="검색항목" class="select_option" style="width: 300px; height: 60px; font-size: 20px; text-align: center;">
					<option value="">===== 상태 선택 =====</option>
					<option value="0">교환 접수 중</option>
					<option value="1">교환 접수 완료</option>
					<option value="2">교환 회수 완료</option>
					<option value="3">교환 완료</option>
					<option value="4">반품 접수 중</option>
					<option value="5">반품 접수 완료</option>
					<option value="6">반품 회수 완료</option>
					<option value="7">반품 완료</option>
					<option value="8">상품 취소</option>
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