<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		location.href="/ad_allnotice.do"
		/* 여기부분은 나중에 수정해야함, 목록 페이징, 게시글번호 들고 다녀야함. */
	}
	function go_adnotice_update() {
		location.href="/adnotice_update.do"
		/* 여기부분은 나중에 수정해야함, 목록 페이징, 게시글번호 들고 다녀야함. */
	}
	function go_adnotice_delete() {
		location.href="/adnotice_delete.do"
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
							 	<th id="th1">번호</th><th id="th4">파일첨부</th><th id="th2">제목</th><th id="th3">작성자</th><th id="th5">조회수</th><th id="th6">날짜</th>
							 </tr>
						</thead>
						<tbody class="mb_table">		
							<tr>
								<td>1</td><td>있음</td><td>추석 연휴 기간 세일 안내</td><td>관리자</td><td>1093</td><td>22.01.10</td>
							</tr>		
						</tbody>
					</table>
					<div class="in_div_img"><img src= "resources/images/bbs/notice_chusuk.jpg"  class="in_img"></div>
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