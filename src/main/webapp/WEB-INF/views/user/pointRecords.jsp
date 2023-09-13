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
<link rel="stylesheet" href="resources/css/slide.css" />
<link rel="stylesheet" href="resources/css/basis.css" />
<style type="text/css">

#contents {
	flex-direction: column;
	justify-content: center;
	width: 600px;
	overflow-y: auto;
	border: 2px solid #ccc;
	padding: 40px;
	margin-top: 40px;
	float: none;
	margin: auto;
	box-shadow: 2px 2px 12px #aaa;
}

.record-box {
	margin-top: 20px;
	border: 1px solid #ddd;
	margin: 20px 0;
	padding: 10px;
	justify-content: space-between;
	align-items: center;
}
.record-box > .normal-text,
.record-box > .small-text {
    text-align: right;
}
.big-text {
	font-size: 24px;
	font-weight: bold;
}

.normal-text {
	font-size: 18px;
}

.small-text {
	font-size: 14px;
}
</style>
<script type="text/javascript">
	function MypageGo() {
		location.href = "/mypage.do";
	}
</script>
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
	</div>
	<div class="main-container">
		<div id="contents">
			<h1>내 포인트 조회</h1>
			<p>
				현재 포인트: <strong>${POINT_REM}</strong> 포인트
			</p>
			<c:forEach items="${pointRecords}" var="record">
				<div class="record-box">
					<c:if test="${record.POINT_USE != null && record.POINT_USE != 0}">
						<p class="big-text">-${record.POINT_USE}포인트</p>
						<p class="normal-text">${record.POINT_REM}포인트</p>
						<p class="small-text">${record.POINT_OUT}</p>
					</c:if>
					<c:if test="${record.POINT_SAVE != null && record.POINT_SAVE != 0}">
						<p class="big-text">+${record.POINT_SAVE}포인트</p>
						<p class="normal-text">${record.POINT_REM}포인트</p>
						<p class="small-text">${record.POINT_DATE}</p>
					</c:if>
				</div>
			</c:forEach>

		</div>
	</div>
</body>
</html>