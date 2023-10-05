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

<link rel="stylesheet" href="resources/css/basis.css" />
<link rel="stylesheet" href="resources/css/bbs.css" />
<style type="text/css">
.in_btn{margin-left: 30px;}
</style>
<script type="text/javascript">
	function go_adnotice_list() {
		location.href="/admin_notice.do"
		/* 여기부분은 나중에 수정해야함, 목록 페이징, 게시글번호 들고 다녀야함. */
	}
	function go_adnotice_update() {
		location.href="/adnotice_update.do?NOTICE_NUM=" + ${mvo.NOTICE_NUM};
		/* 여기부분은 나중에 수정해야함, 목록 페이징, 게시글번호 들고 다녀야함. */
	}
	function go_adnotice_delete() {
		location.href="/adnotice_delete.do?NOTICE_NUM=" + ${mvo.NOTICE_NUM};
		/* 여기부분은 나중에 수정해야함, 목록 페이징, 게시글번호 들고 다녀야함. */
	}
</script>
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="ad_header.jsp"></jsp:include>
		<section id="contents">
			<article>
					<hr class="hr">
					<table class="m_table">				
						<thead class="mh_table">
							 <tr>
							 	<th id="th1">번호</th><th id="th2">제목</th><th id="th3">작성자</th><th id="th5">조회수</th><th id="th6">날짜</th><th id="th4">파일첨부</th>
							 </tr>
						</thead>
						<tbody class="mb_table">	
							<tr>
								<td>${mvo.NOTICE_NUM}</td>
								
								<td>${mvo.NOTICE_SUBJECT}</td><td>${mvo.NOTICE_WRITER}</td>
								<td>${mvo.NOTICE_HIT}</td><td>${mvo.NOTICE_DATE.substring(0,10)}</td>
								<td>
								<c:choose>
									<c:when test="${empty mvo.NOTICE_FILE}">
										없음
									</c:when>
									<c:otherwise>
										있음
									</c:otherwise>
								</c:choose>				
								</td>
							</tr>						
						</tbody>
					</table>
					<div class=in_div_img>
							   <c:choose>
									<c:when test="${empty mvo.NOTICE_FILE}">
										${mvo.NOTICE_CONTENT}
									</c:when>
										<c:otherwise>
											<a href="">
											<img src="/resources/upload/${mvo.NOTICE_FILE }" style="width: 80%"></a>
											<br>
											${mvo.NOTICE_CONTENT}
									</c:otherwise>
								</c:choose>	
								
					</div> 
					<div class="in_btn_div">
					<button class="in_btn" onclick="go_adnotice_update()">수정</button>
					<button class="in_btn" onclick="go_adnotice_list()">목록</button>
					<button class="in_btn" onclick="go_adnotice_delete()">삭제</button>
					</div>
			</article>
		</section>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>