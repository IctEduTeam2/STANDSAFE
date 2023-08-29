<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/basis.css" />
<link rel="stylesheet" href="resources/css/admin_notice.css" />
<style>

#btn2{background:#1b5ac2}
.menu{margin-bottom: 50px}

</style>
</head>
<body>
<jsp:include page="../admin_main/header.jsp"></jsp:include>
		
		<!-- 게시판 관리 텍스트 추가 -->
    	<h3>게시판 관리</h3>
    	
<jsp:include page="header.jsp"></jsp:include>
		
		<!--실시간 현황  -->
		<div class="search_wrap">
		<div style="float: left; margin-left: 205px; margin-top: 5%; margin-right: 20px; border: 1px solid black; width: 20%; height: 400px;">
		<p style="margin-top: 130px;">
		<h1 style="text-align: center; font-size: 18px;">전체 Q&A 게시글 : 75개</h1></p>
		<br>
		<h1 style="text-align: center; font-size: 18px;">등록한 Q&A 게시글 : 75개</h1></p>
		<br>
		<p><h1 style="text-align: center; font-size: 18px;">삭제한 게시글 : 0개</h1></p>
		</div>
		
		<!-- 검색 영역 -->
		
		<form id="searchForm" action="/admin/orderList" method="get">
			<div
				style="float: left; margin-top: 5%; border: 1px solid black; width: 60%; height: 400px;">
				<div>
					<dl style="margin-top: 40px;">
						<dt></dt>
						<dd>
							<p>
								<span> <span style="font-family: '맑은 고딕'; font-size: 16px; float: left; margin-left: 50px;">검색어 &nbsp</span>
								<select id="searchKey" name="searchKey" title="검색항목선택" class="select_option" style="margin-left: 55px; width: 300px; height: 50px; font-size: 20px;">
										<option value="">제목</option>
										<option value="title">제목</option>
										<option value="title2">제목1</option>
										<option value="title3">제목2</option>
								</select>	 
								</span>
								<span style="margin-left: 10px;"> <input type="text"id="fromDate" name="condition.fromDate" title="검색어 입력" value="" maxlength="10" style="width: 240px; height: 50px;">
								</span>&nbsp&nbsp&nbsp&nbsp 
							</p>
						</dd>
					 </dl>
					<dl style="margin-top: 60px;">
						<dt></dt>
						<dd>
							<p>
								<span style="font-family: '맑은 고딕'; font-size: 16px; margin-left: 50px; float: left;">기간검색</span> 
								<span> 
									<select id="searchKey" name="searchKey" title="작성일 선택" class="select_option" style="margin-left: 50px; width: 300px; height: 50px; font-size: 20px;">
										<option value="">작성일</option>
										<option value="dateCreated">작성일1</option>
										<option value="dateCreated2">작성일2</option>
										<option value="dateCreated3">작성일3</option>
								</select>
								</span> 
								<span style="margin-left: 10px;"> 
								<!-- 달력 -->
								<input type="date" id="start" name="trip-start" style="height: 40px; width: 300px;" />
								</span>
								<span> 
								<input type="date" id="close" name="trip-start" style="height: 40px; width: 300px;" />
								</span>
								
							</p>
						</dd>
					</dl>
					<div>
						<span style="float: right; margin-top: 50px; margin-left: 15px; margin-right : 30px;">
								<input type="button" alt="삭제게시물" value="삭제게시물"
								style="width: 150px; height: 50px; font-size: 16px; border-radius: 10px; background-color: #505BBD; color: white; border: none;">
						</span>
						<span style="float: right; margin-top: 50px; margin-left: 15px;">
								<input type="button" alt="전체기간" value="전체기간"
								style="width: 150px; height: 50px; font-size: 16px; border-radius: 10px; background-color: #505BBD; color: white; border: none;">
						</span>
						<span style="float: right; margin-top: 50px; margin-left: 15px;">
								<input type="button" alt="일주일" value="일주일"
								style="width: 150px; height: 50px; font-size: 16px; border-radius: 10px; background-color: #505BBD; color: white; border: none;">
						</span>
						<span style="float: right; margin-top: 50px; margin-left: 15px;">
								<input type="button" alt="오늘" value="오늘"
								style="width: 150px; height: 50px; font-size: 16px; border-radius: 10px; background-color: #505BBD; color: white; border: none;">
						</span>
					</div>
					<dl>
					<dt>
						<div>
							<span style="float: right; margin-top: 130px; margin-right: -659px;">
								<input type="button" alt="초기화" value="초기화"
								style="width: 150px; height: 50px; font-size: 16px; border-radius: 10px; background-color: #505BBD; color: white; border: none;">
							</span> 
							<span style="float: right; margin-top: 130px; margin-right: -494px;">
								<input type="button" alt="검색" value="검색"
								style="width: 150px; height: 50px; font-size: 16px; border-radius: 10px; background-color: #505BBD; color: white; border: none;" onclick="location.href='/'">
							</span>
						</div>
					</dt>
				</dl>
			</div>
		</div>
	</form>
	</div>
	<!-- 수평선 추가 -->
	<div style="clear: both; margin-top: 700px; margin-left: 100px; margin-right: 100px;">
    	<hr style="border-top: 1px solid black;">
	</div>
	<div class="table_wrap" style="clear: both; margin-right: 35px;">
    <table class="table_a" style="width: 84%">
    <colgroup>
			<col width="5%">
			<col width="5%">
			<col width="10%">
			<col width="15%">
			<col width="10%">
			<col width="5%">
			<col width="5%">
			<col width="10%">
			<col width="10%">
	</colgroup>
	<thead>
		<tr>
			<td class="column_1">선택</td>
			<td class="column_2">NO.</td>
			<td class="column_3">게시물 제목</td>
			<td class="column_4">내용</td>
			<td class="column_5">파일 이름</td>
			<td class="column_6">삭제</td>
			<td class="column_7">조회수</td>
			<td class="column_8">작성일</td>
			<td class="column_9">수정일</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="column_1"></td>
			<td>1</td>
			<td>안녕하세요</td>
			<td>@@@@@@</td>
			<td>zxcv</td>
			<td><button class="delete-button">삭제</button></td> <!-- 삭제 버튼 추가 --></td>
			<td>20</td>
			<td>2023-08-01</td>
			<td>2023-08-26</td>
		</tr>
		
		
	</thead>
    </table>
	</div>
		<!-- 하단 버튼 -->
		<div>
			<span style="float: right; margin-top: 25px; margin-right: 180px;">
				<button type="button" alt="상품Q&A" value="상품Q&A"
				style="width: 150px; height: 50px; font-size: 16px; border-radius: 10px; background-color: #505BBD; color: white; border: none;" onclick="location.href='/ad_allqa.do'">상품Q&A❐</button>
			</span>
		</div>
		<!-- 수평선 추가1 -->
		<div style="clear: both; margin-top: 100px; margin-left: 100px; margin-right: 100px; margin-bottom: 100px;">
    	<hr style="border-top: 1px solid black;">
		</div>
		
		<!-- 하단 페이지 버튼. -->
		<div class="bottom-button-container">
   		<button type="button" alt="이전" value="이전">이전</button>
    		<button type="button" alt="페이지1" value="페이지1">1</button>
    		<button type="button" alt="페이지2" value="페이지2">2</button>
    		<button type="button" alt="페이지3" value="페이지3">3</button>
    		<button type="button" alt="다음" value="다음">다음</button>
		</div>
		
		<!-- 수평선 추가2 -->
		<div style="clear: both; margin-top: 150px; margin-left: 100px; margin-right: 100px; margin-bottom: 100px;">
    	<hr style="border-top: 1px solid black;">
		</div>
<jsp:include page="../admin_main/footer.jsp"></jsp:include>
</body>
</html>