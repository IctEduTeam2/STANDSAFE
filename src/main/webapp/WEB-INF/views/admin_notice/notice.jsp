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
    document.getElementById('start1').value = year + '-' + month + '-' + day;
    document.getElementById('close1').value = year + '-' + month + '-' + day;

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
    document.getElementById('start1').value = oneWeekAgoYear + '-' + oneWeekAgoMonth + '-' + oneWeekAgoDay;
    document.getElementById('close1').value = year + '-' + month + '-' + day;
	}
    
//초기화 
function resetTableAndFields() {
    // 테이블 내용 지우기
    $("#bal").html("");
    
    // 검색 필드 초기화
    resetFields();
}

function resetFields() {
    document.getElementById('searchKey').value = "제목"; // 검색어 필드 초기화 
    document.getElementById('searchTitleSelect').value = "작성일"; // 검색어 필드 초기화 
    document.getElementById('start1').value = ""; // 'start' 필드 초기화
    document.getElementById('close1').value = ""; // 'close' 필드 초기화
}
function setStartField() {
    var startDate = document.getElementById('startDate').value;
    document.getElementById('start').value = startDate;
    return true; // 폼 제출을 진행하도록 true 반환
}

//검색버튼
$(document).ready(function() {
    $("button.searchbtn").click(function(e) {
        e.preventDefault(); // Prevent the form from being submitted

        $.ajax({
            url: '/adnotice_search.do',
            type: 'POST',
            data: $("#searchForm").serialize(),
            success: function(response) {
                $("#bal").html(response);
                
            },
            error: function(error) {
                alert("Error occurred");
            }
        });
    });
});

function searchDeletedNotices() {
    $.ajax({
        url: '/adnotice_deleted.do',
        type: 'GET',
        success: function(response) {
            $("#bal").html(response);
        },
        error: function(error) {
            alert("Error occurred");
        }
    });
}

// 문서가 준비되면 실행될 코드입니다.
$(document).ready(function() {
    // 여기에는 이미 작성한 기존의 JavaScript 코드가 있을 수 있습니다.
    
    // 새로 추가하는 부분: 삭제된 게시물만 보여주는 버튼에 대한 클릭 이벤트 핸들러
    $("input[value='삭제게시물']").click(function(e) {
        e.preventDefault();  // 폼 제출을 막습니다.
        searchDeletedNotices();  // 삭제된 게시물만 검색합니다.
    });
});

//테이블 삭제 버튼
$(document).ready(function() {
    $("#del_btn").click(function() { // 클릭 이벤트 핸들러 설정
        var selectedNotices = [];
        $("input[name='chk']:checked").each(function() { // 체크된 체크박스 찾기
            selectedNotices.push($(this).val()); // 선택된 NOTICE_NUM을 배열에 추가
        });

        // Ajax 요청을 보냅니다.
        $.ajax({
            type: "POST", // 또는 GET
            url: "/adnotice_deleted1.do", // 다른 컨트롤러의 URL을 여기에 입력
            data: { selectedNotices: selectedNotices }, // 선택된 NOTICE_NUM 값을 전송
            success: function(response) {
                // Ajax 요청이 성공했을 때 실행할 코드
                // 서버에서 반환한 응답(response)을 처리합니다.
                alert(response);
                location.reload();
            },
            error: function(error) {
                // Ajax 요청이 실패했을 때 실행할 코드
                console.error("Ajax request failed: " + error);
            }
        });
    });
});
//홈페이지 등록
$(document).ready(function() {
    $("#home_btn").click(function() { // 클릭 이벤트 핸들러 설정
        var selectedNotices = [];
        $("input[name='chk']:checked").each(function() { // 체크된 체크박스 찾기
            selectedNotices.push($(this).val()); // 선택된 NOTICE_NUM을 배열에 추가
        });

        // Ajax 요청을 보냅니다.
        $.ajax({
            type: "POST", // 또는 GET
            url: "/update_adnoticestatus.do", // 다른 컨트롤러의 URL을 여기에 입력
            data: { selectedNotices: selectedNotices }, // 선택된 NOTICE_NUM 값을 전송
            success: function(response) {
                // Ajax 요청이 성공했을 때 실행할 코드
                // 서버에서 반환한 응답(response)을 처리합니다.
                alert(response);
                location.reload();
            },
            error: function(error) {
                // Ajax 요청이 실패했을 때 실행할 코드
                console.error("Ajax request failed: " + error);
            }
        });
    });
});


</script>
</head>
<body>
	<jsp:include page="../admin_main/header.jsp"></jsp:include>

	<!-- 게시판 관리 텍스트 추가 -->
	<h3>게시판 관리</h3>

	<jsp:include page="header.jsp"></jsp:include>

	<!--실시간 게시글 현황  -->
	<div class="search_wrap">
		<div
			style="float: left; margin-left: 205px; margin-top: 5%; margin-right: 20px; border: 1px solid black; width: 20%; height: 400px;">
			<p style="margin-top: 130px;">
			<h1 style="text-align: center; font-size: 18px;">전체 공지사항 게시글 : ${totalNotices}개</h1>
			</p>
			<br>
			<h1 style="text-align: center; font-size: 18px;">등록한 공지사항 게시글 : ${registeredNotices}개</h1>
			</p>
			<br>
			<p>
			<h1 style="text-align: center; font-size: 18px;">삭제한 게시글 : ${deletedNotices}개</h1>
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
										</span> <select id="searchKey" name="searchKey" title="검색항목선택"
									class="select_option"
									style="margin-left: 50px; width: 300px; height: 50px; font-size: 20px;">
										<option value="제목">제목</option>
										<option value="작성자">작성자</option>
										<option value="내용">내용</option>
								</select>
								<!-- 검색어 입력창  -->
								</span> <span style="margin-left: 10px;"> <input type="text"
									id="fromDate" name="searchText" title="검색어 입력" 
									maxlength="10" style="width: 240px; height: 50px;">
								</span>
							</p>
						</dd>
					</dl>
					<dl style="margin-top: 60px;">
						<dt></dt>
						<dd>
							<p>
								<span
									style="font-family: '맑은 고딕'; font-size: 16px; margin-left: 50px; float: left;">기　간</span>
								<span>
								<select id="searchTitleSelect" name="searchTitle" title="작성일 선택" class="select_option" style="margin-left: 50px; width: 300px; height: 50px; font-size: 20px;">
    								<option value="기간">기간</option>
    								<option value="작성일">작성일</option>
    								<option value="수정일">수정일</option>
								</select>
								</span>
																
								 <span style="margin-left: 10px;">
								 <!-- 달력 --> 
								 <input
									type="date" id="start1" name="start1"
									style="height: 40px; width: 300px;" />
								</span>
								<span><input type="date" id="close1" name="close1"
									style="height: 40px; width: 300px;"/>
								</span>
							</p>
						</dd>
					</dl>

					<div>
						<span
							style="float: right; margin-top: 50px; margin-left: 15px; margin-right: 30px;">
							<input type="button" alt="삭제게시물" value="삭제게시물"
							style="width: 150px; height: 50px; font-size: 16px; border-radius: 10px; background-color: #505BBD; color: white; border: none;"
							onclick="searchDeletedNotices()"></span> 
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
								<span style="float: right; margin-top: 130px; margin-right: -495px;">
									<input type="button" alt="초기화" value="초기화"
									style="width: 150px; height: 50px; font-size: 16px; border-radius: 10px; background-color: #505BBD; color: white; border: none;"
									onclick="resetTableAndFields()"></span>
								 <span style="float: right; margin-top: 130px; margin-right: -328px;">
								 <input type="hidden" value="공지사항" name="mg_type">
									<button class="searchbtn" type="submit"
									style="width: 150px; height: 50px; font-size: 16px; border-radius: 10px; background-color: #505BBD; color: white; border: none;">검색</button>
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
				<col width="15%">
				<!--<col width="15%"> -->
				<col width="10%">
				<col width="5%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="5%">
			</colgroup>
			<thead>
				<tr>
					<td class="column_1">선택</td>
					<td class="column_2">NO.</td>
					<td class="column_3">게시물 제목</td>
					<!-- <td class="column_4">내용</td> -->
					<td class="column_5">파일 이름</td>
					<td class="column_6">조회수</td>
					<td class="column_7">작성일</td>
					<td class="column_8">수정일</td>
					<td class="column_9">작성자</td>
					<td class="column_10">등록상태</td>
				</tr>
			</thead>
			<tbody id="bal">
	
			</tbody>
	<!-- 페이지 번호 출력 부분 -->
<!-- <tfoot>
    <tr>
        <td colspan="9">
            <ol class="paging">
                <!-- 이전 버튼
                <c:if test="${paging.beginBlock > paging.pagePerBlock}">
                    <li><a href="/admin_notice.do?cPage=${paging.beginBlock-paging.pagePerBlock}">이전으로</a></li>
                </c:if>
                <c:if test="${paging.beginBlock <= paging.pagePerBlock}">
                    <li class="disable">이전으로</li>
                </c:if>
                
                <!-- 페이지 번호 출력
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
                
                <!-- 다음 버튼
                <c:if test="${paging.endBlock < paging.totalPage}">
                    <li><a href="/admin_notice.do?cPage=${paging.beginBlock+paging.pagePerBlock }">다음으로</a></li>
                </c:if>
                <c:if test="${paging.endBlock >= paging.totalPage }">
                    <li class="disable">다음으로</li>
                </c:if>
            </ol>
        </td>
    </tr>
</tfoot> -->
	</table>
	</div>
	<!-- 하단 버튼 -->
	<div>
		<span style="float: right; margin-top: 25px; margin-right: 50px;">
    		  <button type="button" alt="삭제" value="삭제"
                style="margin-right:100px; width: 150px; height: 50px; font-size: 16px; border-radius: 10px; background-color: #505BBD; color: white; border: none;"
                id="del_btn">삭제</button>
		</span>
		<span style="float: right; margin-top: 25px; margin-right: 50px;">
			<button type="button" alt="글쓰기" value="글쓰기"
				style="width: 150px; height: 50px; font-size: 16px; border-radius: 10px; background-color: #505BBD; color: white; border: none;"
				onclick="location.href='/ad_noticeform.do'">글쓰기</button>
		</span> 
		<span style="float: right; margin-top: 25px; margin-right: 50px;">
			<button type="button" alt="홈페이지 등록" value="홈페이지 등록"
                style=" width: 150px; height: 50px; font-size: 16px; border-radius: 10px; background-color: #505BBD; color: white; border: none;"
                id="home_btn">홈페이지 등록</button>
		</span>
	</div>

	<jsp:include page="../Semantic/footer.jsp"></jsp:include>
</body>
</html>