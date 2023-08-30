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
<head>
<style>
.header-style {
	background-color: navy;
	color: white;
}

#bbs table {
	width: 800px;
	margin: 0 auto;
	margin-top: 20px;
	border: 1px solid black;
	border-collapse: collapse;
	font-size: 14px;
}

#bbs table caption {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 10px;
}

#bbs table th, #bbs table td {
	text-align: center;
	border: 1px solid black;
	padding: 4px 10px;
}
.writebtn {
	background-color: blue;
	margin: auto;
	color: white;
	padding: 5px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-bottom: 3px;
}
.no {
	width: 15%
}

.subject {
	width: 30%
}

.writer {
	width: 20%
}

.reg {
	width: 20%
}

.hit {
	width: 15%
}

.title {
	background: navy;
	color: white;
}

.odd {
	background: silver
}

.write-button {
	text-align: right;
	margin-top: 10px;
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
</style>

</head>
<link rel="stylesheet" href="resources/css/slide.css" />
<link rel="stylesheet" href="resources/css/basis.css" />


</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../header.jsp"></jsp:include>
		<section id="contents">
			<div id="bbs" align="center">
				<table summary="메일 목록">
					<caption>메일 전송 목록</caption>
					<thead>
						<tr class="title">
							<th class="no">번호</th>
							<th class="subject">제목</th>
							<th class="writer">글쓴이(관리자이름)</th>
							<th class="reg">날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty bbs_list}">
								<tr>
									<td colspan="4"><h2>자료가 존재하지 않습니다.</h2></td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="k" items="${bbs_list}" varStatus="vs">
									<tr>
										<td>${paging.totalRecord - ((paging.nowPage-1)*paging.numPerPage + vs.index)}</td>
										<c:choose>
											<c:when test="${k.status == 1 }">
												<td style="color: gray">삭제된 게시물 입니다.</td>
											</c:when>
											<c:otherwise>
												<td><a
													href="/bbs_onelist.do?b_idx=${k.b_idx}&cPage=${paging.nowPage}">${k.subject}</a></td>
											</c:otherwise>
										</c:choose>
										<td>${k.writer }</td>
										<td>${k.write_date.substring(0,10)}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4">
								<ol class="paging">
									<!-- 이전 버튼 -->
									<c:choose>
										<c:when test="${paging.beginBlock <= paging.pagePerBlock }">
											<li class="disable">이전으로</li>
										</c:when>
										<c:otherwise>
											<li><a
												href="/bbs_list.do?cPage=${paging.beginBlock-paging.pagePerBlock }">이전으로</a></li>
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
											<li><a href="/bbs_list.do?cPage=${k}">${k}</a></li>
										</c:if>
									</c:forEach>

									<!-- 이후 버튼 -->
									<c:choose>
										<c:when test="${paging.endBlock >= paging.totalPage }">
											<li class="disable">다음으로</li>
										</c:when>
										<c:otherwise>
											<li><a
												href="/bbs_list.do?cPage=${paging.beginBlock+paging.pagePerBlock }">다음으로</a></li>
										</c:otherwise>
									</c:choose>
									<div class="write-button">
										<input class="writebtn" type="button" value="메일쓰기" onclick="window.location.href='emailForm.do'">
									</div>
								</ol>
							</td>

						</tr>
					</tfoot>
				</table>
			</div>
		</section>
		<jsp:include page="../../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>
