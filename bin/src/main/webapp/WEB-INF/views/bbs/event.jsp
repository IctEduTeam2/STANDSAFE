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
</script>
</head>
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents">
			<article>
						<div id="bbs_top" >					
					<div id="bbs_sub"><h1>이벤트</h1></div>
							<fieldset >
								<label>
									<input type="radio" name="search" value="subject" checked />
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
								<td>2</td><td>있음</td><td><a href="/bbs_event_onelist.do">회원가입 이벤트 5000포인트 증정!</a></td><td>관리자</td><td>100</td><td>23.02.10</td>
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