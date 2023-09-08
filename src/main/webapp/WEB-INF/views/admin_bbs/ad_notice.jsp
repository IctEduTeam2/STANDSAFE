<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STANDSAFE</title>
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


</style> 
<script type="text/javascript">
	function search_go() {
		var searchText = document.getElementById("s_bar").value;
		alert(searchText);
		/* 이부분은 나중에 일처리해서 검색창화면으로 가게하기.  */
		
	}
	function adnotice_writeform() {
		location.href="/ad_noticeform.do";
		
	}
	function return3() {
		location.href="/return3.do";
		
	}
</script>
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="ad_header.jsp"></jsp:include>
		<section id="contents">
			<article>
						<div id="bbs_top" >		
						<div id="bbs_sub"><h1>공지사항</h1></div>			
							<fieldset>
								<label>
									<input type="radio" name="search" value="subject"  checked />
									<span>제목</span>					
								</label>
								<label>
									<input type="radio" name="search" value="content" />
									<span>내용</span>					
								</label>
								<div id="search_bar">
									<input type="text" id="s_bar" placeholder="검색어입력">
									<button id="s_btn" onclick="search_go()">검색</button>			
								</div>				
							</fieldset>		
						</div>  <!--  제목및 버튼검색창의 끝 -->	
					<div>
					<button class="btn" onclick="adnotice_writeform()">글쓰기</button>		
					<button class="btn" onclick="return3()">관리목록</button>		
					</div>	
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
								<td>1</td><td>있음</td><td><a href="/adnotice_onelist.do">개인정보 약관 변경 안내</a></td><td>관리자</td><td>1093</td><td>22.01.10</td>
							</tr>
						</tbody>
					</table>
					</article>
			</section>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
</div>
</body>
</html>