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
	var checkbox = document.getElementById("ordchk");
	var frm = document.getElementById("frm");
		if (checkbox.checked) {
			document.getElementById("take_st").value = document.getElementById("searchKey").value;
			document.getElementById("payOkNum").value = document.getElementById("pay_oknum").value;
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
			
			<div style="width: 98%; background-color: #1b5ac2; color: white;  margin: 30px 0;  padding-left: 2%; padding-top: 50px; padding-bottom: 50px; float: left; font-size: 32px;">주문상세내역 - 주문번호나옴</div>
		</div>
		
		</div>
		<div class="author_table_wrap" style="width: 80%; margin: auto;">
			<!-- 게시물 O -->
			<c:if test="${listCheck != 'empty' }">
			<form id="frm" name="frm" method="post" action="/order_update.do">
			<input type ="hidden" id="pay_num" name="pay_num" value="${ovo.PAY_NUM}"/>
			<input type="hidden" id="take_st" name="take_st" value="${ovo.TAKE_ST }" />
			<input type="hidden" id="payOkNum" name="payOkNum" value="${ovo.PAY_OKNUM }" />
				<table class="order_table">
					<colgroup>
						<col width="5%">
						<col width="15%">
						<col width="10%">
						<col width="15%">
						<col width="15%">
						<col width="15%">
						<col width="10%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<td class="th_column_1"><input type="checkbox" name="ordchk" id="ordchk" onclick='selectAll(this)'></td>
							<td class="th_column_2">주문 번호</td>
							<td class="th_column_3">결제 타입</td>
							<td class="th_column_4">승인 날짜</td>
							<td class="th_column_5">결제 상태</td>
							<td class="th_column_6">처리 상태</td>
							
						</tr>
					</thead>
					<tbody>
							<c:forEach items="${list}" var="ovo">
	                    		<tr>
	                    			<td><input type="checkbox" name="ordchk" id="ordchk" onclick='selectAll(this)'> </td>
	                    			<td>${ovo.PAY_OKNUM}
	                    				<input type="hidden" id="pay_oknum" name="pay_oknum" value="${ovo.PAY_OKNUM}" /></td>
	                    			<td>
	                    			<c:choose>
	                    					<c:when test="${ovo.PAY_TYPE == '0' }">온라인</c:when>
	                    					<c:when test="${ovo.PAY_TYPE == '1' }">포인트</c:when>
	                    					<c:otherwise>${ovo.PAY_TYPE}</c:otherwise>
	                    			</c:choose>
	                    			</td>
	                    			<td>
	                    			<fmt:parseDate value="${ovo.PAY_OK}" var="regdate" pattern="yyyy-MM-dd HH:mm:ss" />
                                	<fmt:formatDate value="${regdate}" pattern="yyyy-MM-dd" /></td>
	                    			<td>
	                    			<c:choose>
	                    					<c:when test="${ovo.PAY_ST == '0' }">결제 완료</c:when>
	                    					<c:when test="${ovo.PAY_ST == '1' }">결제 취소</c:when>
	                    					<c:otherwise>${ovo.PAY_ST}</c:otherwise>
	                    			</c:choose>
	                    			</td>
	                    			<td>
	                    				<c:choose>
	                    					<c:when test="${ovo.TAKE_ST == '0' }">배송 준비 중</c:when>
	                    					<c:when test="${ovo.TAKE_ST == '1' }">배송 중 </c:when>
	                    					<c:when test="${ovo.TAKE_ST == '2' }">배송 완료</c:when>
	                    					<c:when test="${ovo.TAKE_ST == '3' }">구매 확정</c:when> 
	                    					<c:otherwise>${ovo.TAKE_ST}</c:otherwise>
	                    				</c:choose>
	                    			</td>
	             				</tr>
	                    	</c:forEach>
					</tbody>
				</table>
				</form>
				</c:if>


		</div>
		<!-- 하단 버튼 -->
		<div style="width: 80%; margin: auto;">
			<span style="float: right; margin-top: 80px; ">
				<button type="button" value="삭제" style="width: 250px; height: 60px; font-size: 25px; background-color: #505BBD; color: white; border: none;" onclick="st_update()">확인</button>
			</span> 
			<span style="float: right; margin-top: 80px; margin-right: 100px;">
				<button type="button" value="삭제" style="width: 250px; height: 60px; font-size: 25px; background-color: #505BBD; color: white; border: none;" onclick="location.href='/order_list.do'">목록</button>
			</span> 
			<span style="float: right; margin-top: 80px; margin-right: 100px;">
				<select id="searchKey" name="searchKey" title="검색항목" class="select_option" style="width: 300px; height: 60px; font-size: 20px; text-align: center;">
					<option value="">===== 상태 선택 =====</option>
					<option value="0">배송 준비 중</option>
					<option value="1">배송 중</option>
					<option value="2">배송 완료</option>
					<option value="3">구매 확정</option>
				</select>
			</span>
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