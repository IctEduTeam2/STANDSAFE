<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>STANDSAFE</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
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
			<!-- 여기에 컨텐츠 넣으시면 됩니다. -->
			<div>
				<button class="btn" onclick="adminRightsGo()">관리자 권한 관리</button>
				<button class="btn" onclick="userManageGo()">사용자 관리</button>
			</div>
			<div class="box-container">
				<div class="box1">사용자 총 인원: 100명</div>
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
						<button class="btn light-blue">탈퇴회원 검색</button>
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
						<th>check box</th>
						<th>회원 아이디</th>
						<th>이름</th>
						<th>이메일 주소</th>
						<th>이메일 수신 여부(N,Y)</th>
						<th>전화번호</th>
						<th>주소</th>
						<th>등급</th>
						<th>가입일</th>
					</tr>
				</thead>
				<tbody>
					<!-- 임시 데이터 추가 시작 -->
					<tr>
						<td><input type="checkbox"></td>
						<td>admin001</td>
						<td>홍길동</td>
						<td>hong001@email.com</td>
						<td>Y</td>
						<td>010-1234-5678</td>
						<td>서울시 강남구</td>
						<td>관리자</td>
						<td>2023-08-28</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>admin002</td>
						<td>이순신</td>
						<td>lee002@email.com</td>
						<td>Y</td>
						<td>010-8765-4321</td>
						<td>서울시 서초구</td>
						<td>일반</td>
						<td>2023-08-27</td>
					</tr>
					<!-- 임시 데이터 추가 끝 -->
					<c:forEach var="item" items="${items}">
						<tr>
							<td><input type="checkbox"></td>
							<td>${item}</td>
							<td>${item}</td>
							<td>${item}</td>
							<td>${item}</td>
							<td>${item}</td>
							<td>${item}</td>
							<td>${item}</td>
							<td>${item}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="dawn-btn">
				<button class="btn">회원 탈퇴</button>
				<button class="btn" onclick="window.location.href='emaillist.do'">메일보내기</button>
			</div>
		</section>
		<jsp:include page="../../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>