<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/basis.css" />
<link rel="stylesheet" href="/resources/css/admin_notice.css" />
<style>


#btn1 {
	background: #1b5ac2
}

.menu {
	margin-bottom: 50px
}

/* paging */

table tfoot ol.paging {
    list-style: none;
    text-align: center; /* 가운데 정렬을 위한 변경 */
}
table tfoot ol.paging li {
    display: inline-block; /* 가로 정렬을 위해 float 제거하고 inline-block으로 변경 */
    /* margin-right: 8px; */
}


table tfoot ol.paging li a {
    display: block;
    /* padding: 3px 7px; */
    border: 1px solid #6c98c2;
    color: #2f313e;
    /* font-weight: bold; */
}

table tfoot ol.paging li a:hover {
    background: #6c98c2;
    color: white;
    /* font-weight: bold; */
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
//기간검색-오늘 
function setTodayDate() {
    // 오늘 날짜를 구합니다.
    var today = new Date();
    var year = today.getFullYear();
    var month = (today.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 +1을 해줍니다.
    var day = today.getDate().toString().padStart(2, '0');

    // 오늘 날짜를 기간 검색 필드에 설정합니다.
    document.getElementById('start').value = year + '-' + month + '-' + day;
    document.getElementById('close').value = year + '-' + month + '-' + day;
	}
//기간검색-일주일 
function setOneWeekDate() {
    // 오늘 날짜를 구합니다.
    var today = new Date();
    var year = today.getFullYear();
    var month = (today.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 +1을 해줍니다.
    var day = today.getDate().toString().padStart(2, '0');

    // 일주일 전 날짜를 계산합니다.
    var oneWeekAgo = new Date(today);
    oneWeekAgo.setDate(today.getDate() - 7);
    var oneWeekAgoYear = oneWeekAgo.getFullYear();
    var oneWeekAgoMonth = (oneWeekAgo.getMonth() + 1).toString().padStart(2, '0');
    var oneWeekAgoDay = oneWeekAgo.getDate().toString().padStart(2, '0');

    // 오늘 날짜를 기간 검색 필드에 설정합니다.
    document.getElementById('start').value = oneWeekAgoYear + '-' + oneWeekAgoMonth + '-' + oneWeekAgoDay;
    document.getElementById('close').value = year + '-' + month + '-' + day;
	}
//기간검색-전체기간(수정해야함 )
function setAllDates() {
    // "전체기간" 버튼을 눌렀을 때, 모든 기간을 표시하도록 설정합니다.
    // 여기서는 작성일 열을 업데이트합니다.
    var rows = document.querySelectorAll(".table_a tbody tr"); // 모든 행을 가져옵니다.
    for (var i = 0; i < rows.length; i++) {
        var row = rows[i];
        var dateCell = row.cells[7]; // 작성일 열(0부터 시작)을 선택합니다.
        // 여기서 dateCell.textContent를 수정하여 작성일을 표시합니다.
        // 예를 들어 작성일이 서버에서 가져온 데이터로 있다고 가정합니다.
        var writtenDate = row.cells[7].textContent; //여기를 실제 작성일로 대체해야 합니다.
        dateCell.textContent = writtenDate; // 작성일을 업데이트합니다.
    }
    document.getElementById('searchTitle').value = "dateCreated1"; // 검색 제목을 '작성일'로 설정
    document.getElementById('startDate').value = ""; // 'start' 필드 초기화
    document.getElementById('close').value = ""; // 'close' 필드 초기화
}
    
    //초기화 
function resetFields() {
    document.getElementById('searchKey').value = ""; // 검색어 필드 초기화 
    document.getElementById('searchTitleSelect').value = ""; // 검색어 필드 초기화 
    document.getElementById('start').value = ""; // 'start' 필드 초기화
    document.getElementById('close').value = ""; // 'close' 필드 초기화
}
function setStartField() {
    var startDate = document.getElementById('startDate').value;
    document.getElementById('start').value = startDate;
    return true; // 폼 제출을 진행하도록 true 반환
}
    
	// 검색 버튼 
	


    //삭제된게시물 보기 
	





</script>
</head>
<body>
	<jsp:include page="../admin_main/header.jsp"></jsp:include>

	<!-- 게시판 관리 텍스트 추가 -->
	<h3>게시판 관리</h3>

	<jsp:include page="header.jsp"></jsp:include>

	<!--실시간 현황  -->
	<div class="search_wrap">
		<div
			style="float: left; margin-left: 205px; margin-top: 5%; margin-right: 20px; border: 1px solid black; width: 20%; height: 400px;">
			<p style="margin-top: 130px;">
			<h1 style="text-align: center; font-size: 18px;">전체 공지사항 게시글 :
				125개</h1>
			</p>
			<br>
			<h1 style="text-align: center; font-size: 18px;">등록한 공지사항 게시글 :
				125개</h1>
			</p>
			<br>
			<p>
			<h1 style="text-align: center; font-size: 18px;">삭제한 게시글 : 5개</h1>
			</p>
		</div>

		<!-- 검색 영역 -->

		<form id="searchForm" action="/adnotice_search.do" method="post" onsubmit="setStartField()">
			<div
				style="float: left; margin-top: 5%; border: 1px solid black; width: 60%; height: 400px;">
				<div>
					<dl style="margin-top: 40px;">
						<dt></dt>
						<dd>
							<p>
								<span> <span
									style="font-family: '맑은 고딕'; font-size: 16px; float: left; margin-left: 50px;">검색어
										&nbsp</span> <select id="searchKey" name="searchKey" title="검색항목선택"
									class="select_option"
									style="margin-left: 55px; width: 300px; height: 50px; font-size: 20px;">
										<option value="">제목</option>
										<option value="title">게시물 제목</option>
										<option value="title2">작성자</option>
										
								</select>
								<!-- 검색어 입력창  -->
								</span> <span style="margin-left: 10px;"> <input type="text"
									id="fromDate" name="searchText" title="검색어 입력" value=""
									maxlength="10" style="width: 240px; height: 50px;">
								</span>&nbsp&nbsp&nbsp&nbsp
							</p>
						</dd>
					</dl>
					<dl style="margin-top: 60px;">
						<dt></dt>
						<dd>
							<p>
								<span
									style="font-family: '맑은 고딕'; font-size: 16px; margin-left: 50px; float: left;">기간검색</span>
								<span>
								<select id="searchTitleSelect" name="searchTitle" title="작성일 선택" class="select_option" style="margin-left: 50px; width: 300px; height: 50px; font-size: 20px;">
    								<option value="">기간</option>
    								<option value="dateCreated1">작성일</option>
    								<option value="dateCreated2">수정일</option>
								</select>

								</span> <span style="margin-left: 10px;">
								 <!-- 달력 --> 
								 <input
									type="date" id="start" name="trip-start"
									style="height: 40px; width: 300px;" />
								</span> <span> <input type="date" id="close" name="trip-close"
									style="height: 40px; width: 300px;" />
								</span>
							</p>
						</dd>
					</dl>

					<div>
						<span
							style="float: right; margin-top: 50px; margin-left: 15px; margin-right: 30px;">
							<input type="button" alt="삭제게시물" value="삭제게시물"
							style="width: 150px; height: 50px; font-size: 16px; border-radius: 10px; background-color: #505BBD; color: white; border: none;"
							onclick="showDeletedNotices()"></span> 
							
						<span style="float: right; margin-top: 50px; margin-left: 15px;">
							<input type="button" alt="전체기간" value="전체기간"
							style="width: 150px; height: 50px; font-size: 16px; border-radius: 10px; background-color: #505BBD; color: white; border: none;"
							onclick="setAllDates()"></span> 
						<span style="float: right; margin-top: 50px; margin-left: 15px;">
							<input type="button" alt="일주일" value="일주일"
							style="width: 150px; height: 50px; font-size: 16px; border-radius: 10px; background-color: #505BBD; color: white; border: none;"
							onclick="setOneWeekDate()"></span> 
						<span style="float: right; margin-top: 50px; margin-left: 15px;">
							<input type="button" alt="오늘" value="오늘"
							style="width: 150px; height: 50px; font-size: 16px; border-radius: 10px; background-color: #505BBD; color: white; border: none;"
							onclick="setTodayDate()">
						</span>
					</div>
					<dl>
						<dt>
							<div>
								<span style="float: right; margin-top: 130px; margin-right: -659px;">
									<input type="button" alt="초기화" value="초기화"
									style="width: 150px; height: 50px; font-size: 16px; border-radius: 10px; background-color: #505BBD; color: white; border: none;"
									onclick="resetFields()"></span>
								 <span style="float: right; margin-top: 130px; margin-right: -494px;">
									<input type="button" alt="검색" value="검색"
									style="width: 150px; height: 50px; font-size: 16px; border-radius: 10px; background-color: #505BBD; color: white; border: none;"
									onclick="searchAll()">
								</span>
							</div>
						</dt>
					</dl>
				</div>
			</div>
		</form>
	</div>
	<!-- 수평선 추가 -->
	<div
		style="clear: both; margin-top: 700px; margin-left: 100px; margin-right: 100px;">
		<hr style="border-top: 1px solid black;">
	</div>

	<!--테이블  -->
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
					<td class="column_10">작성자</td>
					<td class="column_11">등록상태</td>
				</tr>
			</thead>

			<!--  테이블 내용  -->
			<tbody>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="11"><p>자료가 존재하지 않습니다.</p></td>
						</tr>
					</c:when>

					<c:otherwise>
						<c:forEach var="k" items="${list}" varStatus="vs">
    <c:choose>
        <c:when test="${k.NOTICE_ST == 2}">
            <!-- NOTICE_ST가 2인 데이터만 표시합니다. -->
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
                <td class="column_10">작성자</td>
                <td class="column_11">등록상태</td>
            </tr>
        </c:when>
        <c:otherwise>
            <tr>
                <td><input type="checkbox" name="chk" id="chkbox" />
                <label for="chkbox"></label>
                </td>
                <td>${paging.totalRecord -((paging.nowPage-1)*paging.numPerPage + vs.index)}</td>
                <td>${k.NOTICE_SUBJECT}</td>
                <td>${k.NOTICE_CONTENT}</td>
                <td>
                    <c:choose>
                        <c:when test="${empty k.NOTICE_FILE}">
                            없음
                        </c:when>
                        <c:otherwise>
                            있음
                        </c:otherwise>
                    </c:choose>
                </td>
                <!--onelist 갈때 cPage 필요하다. 같이보내자. -->
                <td><input type="button" value="삭제"></td>
                <td>${k.NOTICE_HIT}</td>
                <td>${k.NOTICE_DATE.substring(0,10)}</td>
                <td>${k.NOTICE_UPDATE.substring(0,10)}</td>
                <td>${k.NOTICE_WRITER}</td>
                <td>${k.NOTICE_ST}</td>
            </tr>
        </c:otherwise>
    </c:choose>
</c:forEach>

					</c:otherwise>
				</c:choose>
			</tbody>
	<!-- 페이지 번호 출력 부분 -->
<tfoot>
    <tr>
        <td colspan="10">
            <ol class="paging">
                <!-- 이전 버튼 -->
                <c:if test="${paging.beginBlock > paging.pagePerBlock}">
                    <li><a href="/admin_notice.do?cPage=${paging.beginBlock-paging.pagePerBlock}">이전으로</a></li>
                </c:if>
                <c:if test="${paging.beginBlock <= paging.pagePerBlock}">
                    <li class="disable">이전으로</li>
                </c:if>
                
                <!-- 페이지 번호 출력 -->
                <c:forEach begin="${paging.beginBlock }" end="${paging.endBlock }" step="1" var="k">
                    <c:choose>
                        <c:when test="${k == paging.nowPage }">
                            <li class="now">${k }</li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="/admin_notice.do?cPage=${k }"> ${k }</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                
                <!-- 다음 버튼 -->
                <c:if test="${paging.endBlock < paging.totalPage}">
                    <li><a href="/admin_notice.do?cPage=${paging.beginBlock+paging.pagePerBlock }">다음으로</a></li>
                </c:if>
                <c:if test="${paging.endBlock >= paging.totalPage }">
                    <li class="disable">다음으로</li>
                </c:if>
            </ol>
        </td>
    </tr>
</tfoot>
	
		</table>
	</div>
	<!-- 하단 버튼 -->
	<div>
		<span style="float: right; margin-top: 25px; margin-right: 170px;">
			<button type="button" alt="공지사항" value="공지사항"
				style="width: 150px; height: 50px; font-size: 16px; border-radius: 10px; background-color: #505BBD; color: white; border: none;"
				onclick="location.href='/ad_allnotice.do'">공지사항❐</button>
		</span> <span style="float: right; margin-top: 25px; margin-right: 50px;">
			<button type="button" alt="글쓰기" value="글쓰기"
				style="width: 150px; height: 50px; font-size: 16px; border-radius: 10px; background-color: #505BBD; color: white; border: none;"
				onclick="location.href='/ad_noticeform.do'">글쓰기</button>
		</span> <span style="float: right; margin-top: 25px; margin-right: 50px;">
			<button type="button" alt="홈페이지 등록" value="홈페이지 등록"
				style="width: 150px; height: 50px; font-size: 16px; border-radius: 10px; background-color: #505BBD; color: white; border: none;"
				onclick="location.href='/'">홈페이지 등록</button>
		</span>
	</div>


	<jsp:include page="../Semantic/footer.jsp"></jsp:include>
</body>
</html>