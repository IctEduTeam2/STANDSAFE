<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="resources/css/basis.css" />
<link rel="stylesheet" href="resources/css/bbs.css" />
<style type="text/css">

label {
  line-height: 2rem;
  padding: 0.2em 0.4em;
}
fieldset {
  display: flex;
  justify-content: center;
  border: none;
  margin: 0;
  padding: 40px 20px;
}

#noti{color: red; font-size: 14px; text-align: center; margin-top: 30px}
</style> 
<script type="text/javascript">

	function bbs_go_report_writeform() {
		location.href="/bbs_report_writeform.do";
	}
	function search_go() {
		var searchText = document.getElementById("s_bar").value;
		alert(searchText);
		/* 이부분은 나중에 일처리해서 검색창화면으로 가게하기.  */
		
	}
</script>

</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents">
			<article>
						<div id="bbs_top" >		
						<div id="bbs_sub"><h1>신고합니다</h1>
						<p id="noti">신고게시물은 작성자 이름이 보호되며, 무분별한 욕설과 타인을향한 비판은 관리자에 의해 삭제됩니다</p>
						</div>			
							<fieldset >
								<label>
									<input type="radio" name="search" value="subject"  checked />
									<span>제목</span>					
								</label>
								<label>
									<input type="radio" name="search" value="content" " />
									<span>내용</span>					
								</label>
								<div id="search_bar">
									<input type="text" id="s_bar" placeholder="검색어입력">
									<button id="s_btn" onclick="search_go()">검색</button>			
								</div>				
							</fieldset>		
						</div>  <!--  제목및 버튼검색창의 끝 -->
					<div>
					<button class="btn" onclick="bbs_go_report_writeform()">글쓰기</button>		
					</div>		
					<hr class="hr">
					<!-- 메인 테이블 -->
					<table class="m_table">				
						<thead class="mh_table">
							 <tr>
							 	<th id="th1">번호</th><th id="th4">파일첨부</th><th id="th2">제목</th><th id="th3">작성자</th><th id="th6">날짜</th>
							 </tr>
						</thead>
						<tbody class="mb_table">		
							<tr>
								<td>2</td><td>있음</td><td><a href="/bbs_report_onelist.do">솜털애기 신고합니다 </a></td><td>***</td><td>23.02.10</td>
							</tr>	
							<tr>
								<td>1</td><td>없음</td><td><a href="">벨라루나 신고합니다.</a></td><td>***</td><td>22.01.10</td>
							</tr>	
								
						</tbody>
					</table>
					</article>
			</section>
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
</div>
</body>
</html>