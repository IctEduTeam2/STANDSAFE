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
table td:nth-child(4) {
  text-align: left;
  padding-left: 70px;
}


/* 나머지 컬럼들을 가운데 정렬 */
table td:not(:nth-child(4)) {
  text-align: center;
}

</style> 
<script type="text/javascript">
	function search_go() {
		var searchText = document.getElementById("s_bar").value;
		alert(searchText);
		/* 이부분은 나중에 일처리해서 검색창화면으로 가게하기.  */
		
	}
	function return4() {
		location.href="/return4.do";
		/* 이부분은 나중에 일처리해서 검색창화면으로 가게하기.  */
		
	}

</script>
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="ad_header.jsp"></jsp:include>
		<section id="contents">
			<article>
						<div id="bbs_top" >		
						<div id="bbs_sub"><h1>상품 Q&A</h1></div>			
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
					
					<button class="btn" onclick="return4()">관리목록</button>		
					</div>
					<hr class="hr">
					<!-- 메인 테이블 -->
					<table class="m_table">				
						<thead class="mh_table">
							 
							 <tr>
							 	<th id="th1">번호</th><th id="th4">파일첨부</th><th id="th5">유형</th><th id="th2">제목</th><th id="th3">작성자</th><th id="th6">날짜</th>
							 </tr>
						</thead>
						<tbody class="mb_table">		
							<tr>
								<td>2</td><td><img src="resources/images/bbs/qa.PNG" class="f_img"></td><td>배송문의</td><td><a href="/adqa_onelist_user.do">상품이 찌그러졌어요..환불가능한가요?</a></td><td>일라오이</td><td>23.02.10</td>
							</tr>	
							<tr>
								<td>1</td><td><img src="" class="f_img"></td><td>기타문의</td><td><a href="/adqa_onelist.do">[RE] 관리자 답글입니다.</a></td><td>관리자</td><td>22.01.10</td>
							</tr>								
						</tbody>
					</table>
					</article>
			</section>

		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
</div>
</body>
</html>