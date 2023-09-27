<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.ict.user.model.vo.UserVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>STANDSAFE</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Link Swiper's CSS -->

<style type="text/css">
.empty-text {
	text-align: center;
	font-weight: bold;
}

/* 체크박스 크기 2배로 확대 */
.userCheckbox {
	transform: scale(2);
}
/* paging */
table tfoot ol.paging {
	list-style: none;
}

table tfoot ol.paging li {
	float: left;
	margin-right: 8px;
}

table tfoot ol.paging li a {
	display: block;
	padding: 3px 7px;
	border: 1px solid #00B3DC;
	color: #2f313e;
	font-weight: bold;
}

table tfoot ol.paging li a:hover {
	background: #00B3DC;
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
	border: 1px solid #ff4aa5;
	background: #ff4aa5;
	color: white;
	font-weight: bold;
}

.btn {
	padding: 5px 10px;
	margin: 2px;
	color: white;
	background-color: navy;
}

.light-blue {
	background-color: lightblue;
	border: none;
	color: white;
}

.box1 {
	display: inline-flex; /* flex로 변경 */
	align-items: center; /* 세로 중앙 정렬 */
	justify-content: center; /* 가로 중앙 정렬 */
	border: 1px solid #ccc;
	margin: 5px;
	padding: 10px;
	min-height: 60px;
	text-align: center; /* 글자를 가로로 중앙 정렬 */
}

.box2 {
	display: inline-block;
	border: 1px solid #ccc;
	margin: 5px;
	padding: 10px;
	min-height: 60px;
}

.box-container {
	display: flex;
}

.box1:first-child {
	flex: 2; /* 첫 번째 박스는 4의 비율로 */
}

.box2:last-child {
	flex: 8; /* 두 번째 박스는 6의 비율로 */
}

.btn {
	padding: 5px 10px;
	margin: 2px;
}

.light-blue {
	background-color: lightblue;
	border: none;
	color: white;
}

.navy {
	background-color: navy;
	border: none;
	color: white;
}

.gray {
	background-color: gray;
	border: none;
	color: white;
}

.dawn-btn {
	text-align: right;
}
/* 테이블 기본 스타일 */
table {
	width: 100%;
	border-collapse: collapse; /* 셀 사이의 테두리를 합침 */
	margin: 25px 0;
	font-size: 18px;
	text-align: left;
}

/* 테이블 헤더 스타일 */
table thead th {
	background-color: #1b5ac2;
	color: white;
	padding: 10px;
	border: 1px solid #ddd;
}

/* 테이블 셀 스타일 */
table th, table td {
	padding: 12px 15px;
	border: 1px solid #ddd;
}

/* 테이블 row에 대한 호버 효과 */
table tbody tr:hover {
	background-color: #f5f5f5;
}

/* 짝수 번째 row의 배경색 */
table tbody tr:nth-child(even) {
	background-color: #f3f3f3;
	select
	,
	input[type="text"]
	{
	height
	:
	28px; /* 원하는 크기로 조정하세요 */
}

.deleted-admin {
	color: gray;
}

.empty-text {
	text-align: center;
	font-weight: bold;
}
</style>
<link rel="stylesheet" href="resources/css/slide.css" />
<link rel="stylesheet" href="resources/css/basis.css" />
<script type="text/javascript">
	function adminRightsGo() {
		window.location.href = 'adminManagement.do';
	}

	function userManageGo() {
		window.location.href = 'userManagement.do';
	}
	//삭제된 관리자 검색
	function getDeactivatedUsers() {
	    window.location.href = 'getDeactivatedUsers.do';
	}
</script>
</head>
<body>
	<div id="mydiv">
		<jsp:include page="../header.jsp"></jsp:include>
		<section id="contents">
			<!-- 상단 버튼 그룹 -->
			<div class="top-btn-group">
				<button class="btn" onclick="adminRightsGo()">관리자 권한 관리</button>
				<button class="btn" onclick="userManageGo()">사용자 관리</button>
			</div>
			<!-- 검색 박스 -->
			<div class="box-container">
				<!-- 사용자 인원 표시 -->
				<div class="box1">
					사용자 총 인원: ${totalActiveUsers}명<br> 탈퇴한 사용자 인원:
					${totalDeactivatedUsers}명
				</div>
				<div class="box2">
					<div class="search-keyword">
						<form action="/userManagement.do" method="GET">
							<div>
								<label for="category">검색어:</label> <select name="category"
									id="category">
									<option value="ID">아이디</option>
									<option value="m_NAME">이름</option>
									<option value="NICKNAME">별명</option>
									<option value="MAIL">이메일</option>
									<option value="BIRTH">생일</option>
									<option value="PHONE">전화번호</option>
									<option value="ADDR">주소</option>
								</select> <input type="text" name="keyword" placeholder="검색어 입력">
								<button type="submit" class="btn navy">검색</button>
								<button type="button" class="btn gray" onclick="resetSearch()">검색
									초기화</button>
							</div>
							<div>
								<label for="dateCategory">기간 검색:</label> <select
									name="dateCategory" id="dateCategory">
									<option value="IN_TIME">가입일</option>
									<option value="OUT_TIME">탈퇴일</option>
								</select> <input type="date" name="startDate" id="startDate"
									placeholder="YYYY-MM-DD"> <input type="date"
									name="endDate" id="endDate" placeholder="YYYY-MM-DD">

							</div>
						</form>
					</div>
					<br>
					<div>
						<button class="btn light-blue" onclick="setToday()">오늘</button>
						<button class="btn light-blue" onclick="setLastWeek()">지난주</button>
						<button class="btn light-blue" onclick="setAllTime()">1개월</button>
						<button class="btn light-blue" onclick="getDeactivatedUsers()">탈퇴회원
							검색</button>
					</div>
					<br>

				</div>
			</div>
			<table>
				<thead>
					<tr>
						<th class="column_1">check box</th>
						<th class="column_2">회원 아이디</th>
						<th class="column_3">이름</th>
						<th class="column_4">별명</th>
						<th class="column_5">이메일 주소</th>
						<th class="column_6">이메일 수신 여부(N,Y)</th>
						<th class="column_7">생일</th>
						<th class="column_8">전화번호</th>
						<th class="column_9">주소</th>
						<th class="column_10">가입일</th>
						<th class="column_11">탈퇴일</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty userList}">
						<tr>
							<td colspan="11" class="empty-text">검색된 결과가 없습니다.</td>
							<!-- 'colspan'의 값을 테이블의 열 수에 맞게 조절해야 합니다. -->
						</tr>
					</c:if>

					<c:forEach var="user" items="${userList}">
						<c:choose>
							<c:when test="${user.OUT_ST == 0}">
								<!-- 삭제된 관리자 표시 -->
								<tr class="deleted-user">
									<td>-</td>
									<td>${user.ID}(Deleted)</td>
									<td>${user.NICKNAME}(Deleted)</td>
									<td>${user.m_NAME}(Deleted)</td>
									<td>${user.MAIL}(Deleted)</td>
									<td>${user.EMAIL_ST == 1 ? 'Y' : 'N'}(Deleted)</td>
									<td>${user.BIRTH}(Deleted)</td>
									<td>${user.PHONE}(Deleted)</td>
									<td>${user.ADDR}(Deleted)</td>
									<td>${user.IN_TIME}(Deleted)</td>
									<td>${user.OUT_TIME}(Deleted)</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr onclick="viewUserInfo('${user.CLIENT_NUM}')">
									<td><input type="checkbox" class="userCheckbox"
										value="${user.CLIENT_NUM}" onclick="event.stopPropagation();"></td>
									<td>${user.ID}</td>
									<td>${user.NICKNAME}</td>
									<td>${user.m_NAME}</td>
									<td>${user.MAIL}</td>
									<td>${user.EMAIL_ST == 1 ? 'Y' : 'N'}</td>
									<td>${user.BIRTH}</td>
									<td>${user.PHONE}</td>
									<td>${user.ADDR}</td>
									<td>${user.IN_TIME}</td>
									<td>${user.OUT_TIME}</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="11">
							<ol class="paging">
								<!-- 이전 버튼 -->
								<c:choose>
									<c:when test="${paging.beginBlock <= paging.pagePerBlock }">
										<li class="disable">이전으로</li>
									</c:when>
									<c:otherwise>
										<li><a
											href="/userManagement.do?cPage=${paging.beginBlock-paging.pagePerBlock }">이전으로</a></li>
									</c:otherwise>
								</c:choose>

								<!-- 페이지번호들 -->
								<c:forEach begin="${paging.beginBlock }"
									end="${paging.endBlock }" step="1" var="k">
									<!--  현재 페이지는 링크 X, 나머지 페이지는 해당 페이지로 이동하게 링크 처리 -->
									<c:if test="${ k == paging.nowPage}">
										<li class="now">${k}</li>
									</c:if>
									<c:if test="${ k != paging.nowPage}">
										<li><a href="/userManagement.do?cPage=${k}">${k}</a></li>
									</c:if>
								</c:forEach>

								<!-- 이후 버튼 -->
								<c:choose>
									<c:when test="${paging.endBlock >= paging.totalPage }">
										<li class="disable">다음으로</li>
									</c:when>
									<c:otherwise>
										<li><a
											href="/userManagement.do?cPage=${paging.beginBlock+paging.pagePerBlock }">다음으로</a></li>
									</c:otherwise>
								</c:choose>
							</ol>
							<div class="dawn-btn">
								<button class="btn" onclick="deleteSelectedUsers()">회원
									삭제</button>
								<!-- <button class="btn"
									onclick="window.location.href='emaillist.do'">메일보내기</button>-->
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
		</section>
		<jsp:include page="../../Semantic/footer.jsp"></jsp:include>
	</div>
	<script>
	function resetSearch() {
	    document.querySelector('input[name="keyword"]').value = '';
	    document.querySelector('input[name="startDate"]').value = '';
	    document.querySelector('input[name="endDate"]').value = '';
	    // 필요하다면 select 박스도 초기화할 수 있습니다.
	    document.querySelector('select[name="category"]').selectedIndex = 0;
	    document.querySelector('select[name="dateCategory"]').selectedIndex = 0;
	}

</script>
	<script type="text/javascript">
		function viewUserInfo(CLIENT_NUM) {
			window.location.href = '/info_user.do?CLIENT_NUM=' + CLIENT_NUM;
			
		}
	</script>
	<script type="text/javascript">
	document.querySelector('.btn.gray').addEventListener('click', function(event) {
	    event.preventDefault();  // 기본 이벤트 동작을 중지
	    window.location.href = 'userManagement.do';
	});
	</script>
	<script type="text/javascript">
    <%if (request.getAttribute("message") != null) {%>
        alert('<%=request.getAttribute("message")%>
		');
	<%}%>		
	</script>

	<script type="text/javascript">
		// 관리자 삭제 기능을 위한 함수를 정의합니다.
		function deleteSelectedUsers() {
			// 선택된 관리자의 ID들을 저장할 배열을 초기화합니다.
			var selectedUsers = [];

			// 체크박스 중에서 체크된 것들만 선택합니다.
			var checkboxes = document
					.querySelectorAll('.userCheckbox:checked');

			// 체크된 체크박스 각각에 대하여
			checkboxes.forEach(function(checkbox) {
				selectedUsers.push(parseInt(checkbox.value, 10)); // 문자열을 정수로 변환
			});

			// 체크된 체크박스가 없을 경우
			if (selectedUsers.length === 0) {
				// 사용자에게 알림을 표시합니다.
				alert('탈퇴시킬 유저를 선택하세요.');
				return; // 함수 실행을 중단합니다.
			}

			// 사용자에게 선택한 관리자를 삭제할 것인지 확인합니다.
			var confirmDelete = confirm('선택한 유저를 탈퇴시키시겠습니까?');
			if (confirmDelete) {
				// 사용자가 확인을 눌렀을 경우

				// XMLHttpRequest 객체를 생성하여 서버와 통신합니다.
				var xhr = new XMLHttpRequest();
				xhr.open('POST', '/deleteuser.do', true); // POST 방식으로 '/deletemanager.do' 주소에 요청을 보냅니다.
				xhr.setRequestHeader('Content-Type',
						'application/x-www-form-urlencoded'); // 요청 헤더를 설정합니다.

				// 서버로부터 응답이 오면 실행될 콜백 함수를 정의합니다.
				xhr.onload = function() {
					// 응답의 상태 코드가 200 (성공)일 경우
					if (this.status == 200) {
						// 사용자에게 알림을 표시하고
						alert('선택한 유저가 탈퇴되었습니다.');
						location.reload(); // 페이지를 새로고침하여 변경된 내용을 반영합니다.
					}
				};

				// 서버에 전송할 데이터를 정의합니다.
				// 'userIDs' 라는 키로 선택된 관리자 ID들을 쉼표로 구분하여 문자열로 변환합니다.
				var data = 'userIDs=' + selectedUsers.join(',');
				xhr.send(data); // 데이터를 서버에 전송합니다.
			}
		}
	</script>

	<script type="text/javascript">
// 함수를 전역 범위로 이동
function setToday() {
    const today = new Date();
    document.getElementById('startDate').value = today.toISOString().split('T')[0];
    document.getElementById('endDate').value = today.toISOString().split('T')[0];
}

function setLastWeek() {
    const today = new Date();
    const lastWeek = new Date(today.getFullYear(), today.getMonth(), today.getDate() - 7);
    document.getElementById('startDate').value = lastWeek.toISOString().split('T')[0];
    document.getElementById('endDate').value = today.toISOString().split('T')[0];
}

function setAllTime() {
    let today = new Date(); 
    let oneMonthAgo = new Date(today); 
    oneMonthAgo.setMonth(today.getMonth() - 1);

    let todayStr = today.toISOString().split('T')[0];
    let oneMonthAgoStr = oneMonthAgo.toISOString().split('T')[0];

    document.getElementById('startDate').value = oneMonthAgoStr;
    document.getElementById('endDate').value = todayStr;
}
</script>

</body>
</html>