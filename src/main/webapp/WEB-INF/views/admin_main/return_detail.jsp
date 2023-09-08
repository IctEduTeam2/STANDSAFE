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
	
				
	</table>
	</form>
</div>
	<div class="admin_content_wrap" style=" width:100%; ">
		<div class="admin_content_subject" style="width: 80%; margin: auto;">
			<div style="width: 98%; background-color: #1b5ac2; color: white;  margin: 30px 0;  padding-left: 2%; padding-top: 50px; padding-bottom: 50px; float: left; font-size: 32px;">반품상세내역 - 주문번호나옴</div>
		</div>
		<div class="author_table_wrap" style="width: 80%; margin: auto;">
			<!-- 게시물 O -->
			<c:if test="${listCheck != 'empty' }">
				<table class="order_table">
					<colgroup>
						<col width="5%"> 
						<col width="10%">
						<col width="15%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="5%"> 
						<col width="15%"> 
						<col width="10%"> 
						<col width="10%"> 
					</colgroup>
					<thead>
						<tr>
							<td class="th_column_1"><input type="checkbox" name="th_column_1" onclick='selectAll(this)'></td>
							<td class="th_column_2">주문번호</td>
							<td class="th_column_3">사유</td>
							<td class="th_column_4">배송비 부담여부</td>
							<td class="th_column_5">요청날짜</td>
							<td class="th_column_6">처리상태</td>
						</tr>
					</thead>
					<tbody>
						<tr>
								<td><input type="checkbox" name="th_column_1"></td>
								<td>${rvo2.PAY_NUM }</td>
								<td>${rvo2.PB_CONTENT }</td>
								<td>${rvo2.PB_DP }</td>
								<td>
								<fmt:parseDate value="${rvo2.PB_DATE}" var="regdate" pattern="yyyy-MM-dd HH:mm:ss" />
                                <fmt:formatDate value="${regdate}" pattern="yyyy-MM-dd" />
								</td>
								<td>${rvo2.PB_ST }</td>
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
			<span style="float: right; margin-top: 80px;">
				<button type="button" value="삭제" style="width: 250px; height: 60px; font-size: 25px; background-color: #505BBD; color: white; border: none;">확인</button>
			</span> 
			<span style="float: right; margin-top: 80px; margin-right: 100px;">
				<button type="button" value="삭제" style="width: 250px; height: 60px; font-size: 25px; background-color: #505BBD; color: white; border: none;" onclick="location.href='return_list.do'">목록</button>
			</span> 
			<span style="float: right; margin-top: 80px; margin-right: 100px;">
				<select id="searchKey" name="searchKey" title="검색항목" class="select_option" style="width: 300px; height: 60px; font-size: 20px; text-align: center;">
					<option value="">===== 상태 선택 =====</option>
					<option value="producNm">반품 접수 완료₩	</option>
					<option value="content">반품 회수 완료</option>
					<option value="createName">반품 완료</option>
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