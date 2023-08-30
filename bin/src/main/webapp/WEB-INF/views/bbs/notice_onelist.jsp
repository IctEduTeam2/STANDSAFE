<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>STANDSAFE</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="resources/css/basis.css" />
<link rel="stylesheet" href="resources/css/bbs.css" />

<script type="text/javascript">
	function go_notice_list() {
		location.href="/bbs_notice_go.do;"
		/* 여기부분은 나중에 수정해야함, 목록 페이징, 게시글번호 들고 다녀야함. */
	}
</script>
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents">
					<hr class="hr">
					<!-- 메인 테이블 -->
			
					<table class="m_table">				
						<thead class="mh_table">
							 <tr>
							 	<th id="th1">번호</th><th id="th4">파일첨부</th><th id="th2">제목</th><th id="th3">작성자</th><th id="th5">조회수</th><th id="th6">날짜</th>
							 </tr>
						</thead>
						<tbody class="mb_table">		
							<tr>
								<td>1</td><td>있음</td><td>추석 연휴 기간 세일 안내</td><td>관리자</td><td>1093</td><td>22.01.10</td>
							</tr>						
						</tbody>
					</table>
					<div class=in_div_img><img src="resources/images/bbs/notice_chusuk.jpg" class="in_img"></div>
					<div class="in_btn_div"><button class="in_btn" onclick="go_notice_list()">목록</button></div>
			</section>
			
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>