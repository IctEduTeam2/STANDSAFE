<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	color:white;
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
</script>

</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../header.jsp"></jsp:include>
		<section id="contents">
			<div>
				<button class="btn" onclick="adminRightsGo()">관리자 권한 관리</button>
				<button class="btn" onclick="userManageGo()">사용자 관리</button>
			</div>
			<div class="box-container">
				<div class="box1">관리자 총 인원: ${countAdmins}명</div>
				<div class="box2">
					<div>
						검색어: <select>
							<option value="id">아이디</option>
							<!-- 여기에 다른 검색 조건들을 추가하실 수 있습니다. -->
						</select> <input type="text" placeholder="검색어 입력">
					</div>
					<div>
						기간 검색: <select>
							<option value="joinDate">가입일</option>
							<!-- 여기에 다른 검색 조건들을 추가하실 수 있습니다. -->
						</select> <input type="date" placeholder="시작일"> <input type="date"
							placeholder="종료일"> (1달 범위로 검색 가능)
					</div>
					<div>
						<button class="btn light-blue">오늘</button>
						<button class="btn light-blue">일주일</button>
						<button class="btn light-blue">전체기간</button>
						<button class="btn light-blue">삭제된 관리자 검색</button>
					</div>
					<br>
					<div>
						<button class="btn navy">검색</button>
						<button class="btn gray">검색 초기화</button>
					</div>
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
						<tr onclick="viewAdminInfo('${admin.ADMIN_NUM}')">
							<td><input type="checkbox"></td>
							<td>${admin.ADMIN_ID}</td>
							<td>${admin.ADMIN_NAME}</td>
							<td>${admin.ADMIN_NICK}</td>
							<td>${admin.ADMIN_MAIL}</td>
							<td>${admin.ADMIN_BIRTH}</td>
							<td>${admin.ADMIN_PHONE}</td>
							<td>${admin.ADMIN_ADDR}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="dawn-btn">
				<button class="btn"
					onclick="window.location.href='registmanager.do'">관리자 등록</button>
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
</body>
</html>