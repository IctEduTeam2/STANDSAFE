<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	color: white;
	background-color: navy;
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
}

select, input[type="text"] {
	height: 28px; /* 원하는 크기로 조정하세요 */
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
	function getDeactivatedAdmins() {
		window.location.href = 'adminManagement.do';
	}
</script>
</head>
<body onload="InitializeStaticMenu();">
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
				<div class="box1">관리자 총 인원: ${countAdmins}명</div>
				<div class="box2">
					<div class="search-keyword">
						검색어: <select>
							<option value="id">아이디</option>
							<option value="name">이름</option>
							<option value="nick">별명</option>
							<option value="email">이메일</option>
							<option value="birth">생일</option>
							<option value="phone">전화번호</option>
							<option value="addr">주소</option>
						</select> <input type="text" placeholder="검색어 입력">
						<button class="btn navy">검색</button>
						<button class="btn gray">검색 초기화</button>
					</div>
					<div class="search-period" style="visibility: hidden;">
						기간 검색: <select>
							<option value="joinDate">가입일</option>
						</select> <input type="date" placeholder="시작일"> <input type="date"
							placeholder="종료일"> (1달 범위로 검색 가능)
					</div>

					<div>
						<!-- <button class="btn light-blue">오늘</button>
						<button class="btn light-blue">일주일</button>
						<button class="btn light-blue">전체기간</button> -->
						<button class="btn light-blue" onclick="getDeactivatedAdmins()">삭제된
							관리자 검색</button>
					</div>
					<br>
				</div>
			</div>
			<table>
				<thead>
					<tr>
						<th class="column_1">check box</th>
						<th class="column_2">관리자 아이디</th>
						<th class="column_3">이름</th>
						<th class="column_4">별명</th>
						<th class="column_5">이메일 주소</th>
						<th class="column_6">생일</th>
						<th class="column_7">전화번호</th>
						<th class="column_8">주소</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="admin" items="${adminList}">
						<c:choose>
							<c:when test="${admin.ADMIN_ST == 0}">
								<!-- 삭제된 관리자 표시 -->
								<tr class="deleted-admin">
									<td>${admin.ADMIN_ID}(Deleted)</td>
									<td>${admin.ADMIN_NAME}(Deleted)</td>
									<td>${admin.ADMIN_NICK}(Deleted)</td>
									<td>${admin.ADMIN_MAIL}(Deleted)</td>
									<td>${admin.ADMIN_BIRTH}(Deleted)</td>
									<td>${admin.ADMIN_PHONE}(Deleted)</td>
									<td>${admin.ADMIN_ADDR}(Deleted)</td>
								</tr>
							</c:when>
							<c:otherwise>
							<tr onclick="viewAdminInfo('${admin.ADMIN_NUM}')">
								<td><input type="checkbox" class="adminCheckbox"
									value="${admin.ADMIN_NUM}" onclick="event.stopPropagation();"></td>
								<td>${admin.ADMIN_ID}</td>
								<td>${admin.ADMIN_NAME}</td>
								<td>${admin.ADMIN_NICK}</td>
								<td>${admin.ADMIN_MAIL}</td>
								<td>${admin.ADMIN_BIRTH}</td>
								<td>${admin.ADMIN_PHONE}</td>
								<td>${admin.ADMIN_ADDR}</td>
							</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
			</table>
			<div class="dawn-btn">
				<button class="btn"
					onclick="window.location.href='registmanager.do'">관리자 등록</button>
				<button class="btn" onclick="deleteSelectedAdmins()">선택한
					관리자 삭제</button>
				<button class="btn" onclick="window.location.href='emaillist.do'">메일보내기</button>
			</div>
		</section>
		<jsp:include page="../../Semantic/footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript">
		function viewAdminInfo(ADMIN_NUM) {
			window.location.href = '/infoManager.do?ADMIN_NUM=' + ADMIN_NUM;
		}
	</script>
	<script type="text/javascript">
		// 관리자 삭제 기능을 위한 함수를 정의합니다.
		function deleteSelectedAdmins() {
			// 선택된 관리자의 ID들을 저장할 배열을 초기화합니다.
			var selectedAdmins = [];

			// 체크박스 중에서 체크된 것들만 선택합니다.
			var checkboxes = document
					.querySelectorAll('.adminCheckbox:checked');

			// 체크된 체크박스 각각에 대하여
			checkboxes.forEach(function(checkbox) {
				selectedAdmins.push(parseInt(checkbox.value, 10)); // 문자열을 정수로 변환
			});

			// 체크된 체크박스가 없을 경우
			if (selectedAdmins.length === 0) {
				// 사용자에게 알림을 표시합니다.
				alert('삭제할 관리자를 선택하세요.');
				return; // 함수 실행을 중단합니다.
			}

			// 사용자에게 선택한 관리자를 삭제할 것인지 확인합니다.
			var confirmDelete = confirm('선택한 관리자를 삭제하시겠습니까?');
			if (confirmDelete) {
				// 사용자가 확인을 눌렀을 경우

				// XMLHttpRequest 객체를 생성하여 서버와 통신합니다.
				var xhr = new XMLHttpRequest();
				xhr.open('POST', '/deletemanager.do', true); // POST 방식으로 '/deletemanager.do' 주소에 요청을 보냅니다.
				xhr.setRequestHeader('Content-Type',
						'application/x-www-form-urlencoded'); // 요청 헤더를 설정합니다.

				// 서버로부터 응답이 오면 실행될 콜백 함수를 정의합니다.
				xhr.onload = function() {
					// 응답의 상태 코드가 200 (성공)일 경우
					if (this.status == 200) {
						// 사용자에게 알림을 표시하고
						alert('선택한 관리자가 삭제되었습니다.');
						location.reload(); // 페이지를 새로고침하여 변경된 내용을 반영합니다.
					}
				};

				// 서버에 전송할 데이터를 정의합니다.
				// 'adminIDs' 라는 키로 선택된 관리자 ID들을 쉼표로 구분하여 문자열로 변환합니다.
				var data = 'adminIDs=' + selectedAdmins.join(',');
				xhr.send(data); // 데이터를 서버에 전송합니다.
			}
		}
	</script>
</body>
</html>