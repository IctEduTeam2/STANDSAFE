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
.content-row .conts {
    display: none;
    text-align: left;
    padding-left: 400px;
    font-size: 14px;
  }

.title {
  cursor: pointer; /* 링크인 제목에 마우스 커서를 손 모양으로 변경 */
}

</style> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	 $('.title').click(function() {
		    const toggleCell = $(this).closest('tr').next('.content-row').find('.conts');
		    
		    // 클릭한 행의 답변 상태 확인 후 처리
		    if (toggleCell.is(':visible')) {
		      toggleCell.hide(); // 이미 열려있는 경우 닫기
		    } else {
		      // 모든 답변 숨기기
		      $('.conts').hide();
		      toggleCell.show(); // 클릭한 행의 답변 열기
		    }
		  });
		});
</script>
<script type="text/javascript">
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
						<div id="bbs_sub"><h1>자주 묻는 질문 FAQ</h1></div>			
							<fieldset >
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
					<hr class="hr">
					<!-- 메인 테이블 -->
					<table class="m_table">				
						<thead class="mh_table">
							 <tr>
							 	<th id="th1">번호</th><th id="th4">분류</th><th id="th2">제목</th><th id="th3">작성자</th><th id="th5">조회수</th><th id="th6">날짜</th>
							 </tr>
						</thead>
						<tbody class="mb_table">		
							<tr>
								<td>2</td>
								<td>상담문의</td>
								<td><a class="title"> Q. 고객센터 운영시간이 어떻게 되나요?</a></td>
								<td>관리자</td>
								<td>89</td>
								<td>23.02.10</td>
							</tr>	
							<tr class="content-row">
								<td colspan="6" class="conts">A. 고객센터 운영시간은 평일 9시부터 6시까지입니다</td>
							</tr>
							<tr>
								<td>1</td>
								<td>배송문의</td>
								<td><a class="title">Q. 배송은 몇일 정도나 걸리나요?</a></td>
								<td>관리자</td>
								<td>1058</td>
								<td>23.02.10</td>							
							</tr>	
							<tr class="content-row">
								<td colspan="6" class="conts">A. 배송은 주문 후 3~5일 정도 소요됩니다.</td>
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