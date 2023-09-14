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
    background-color: #1b5ac2;
    color: white;
    
  }

.title {
  cursor: pointer; /* 링크인 제목에 마우스 커서를 손 모양으로 변경 */
}
table tfoot ol.paging {
    list-style: none;
    text-align: center; /* 가운데 정렬을 위한 변경 */
}
table tfoot ol.paging li {
    display: inline-block; /* 가로 정렬을 위해 float 제거하고 inline-block으로 변경 */
    margin-right: 8px;
}


table tfoot ol.paging li a {
	display: block;
	 padding: 3px 7px; 
	border: 1px solid #6c98c2;
	color: #2f313e;
	 font-weight: bold;
}

table tfoot ol.paging li a:hover {
	background: #6c98c2;
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
	border: 1px solid #1b5ac2;
	background: #1b5ac2;
	color: white;
	font-weight: bold;
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
	function wordchk() {
    var word = document.getElementById("s_bar").value; // 검색어 필드의 값 가져오기

    // 검색어가 비어 있으면 알림창 표시
    if (!word || word.trim() === "") {
        alert("검색어를 입력하세요.");
        return false; // 폼 제출을 취소합니다.
    }

    // 검색어가 입력되었으면 폼 제출을 허용
    return true;
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
						<form action="/bbs_faq_search.do" method="post"  onsubmit="return wordchk()">
							<fieldset>
							        <label>
							            <input type="radio" name="searchType" value="제목" id="type_title" checked />
							            <span>제목</span>
							        </label>
							        <label>
							            <input type="radio" name="searchType" value="내용" id="type_content" />
							            <span>내용</span>
							        </label>
							        <div id="search_bar">
							            <input type="text" id="s_bar" name="word" placeholder="검색어입력">
							            <input type="hidden" name="bbs_type" value="이용안내FAQ">
							            <button id="s_btn" type="submit">검색</button>
							        </div>
							    </fieldset>	
							</form>
						</div>  <!--  제목및 버튼검색창의 끝 -->	
					<hr class="hr">
					<!-- 메인 테이블 -->
					<table class="m_table">				
						<thead class="mh_table">
							 <tr>
							 	<th id="th1">번호</th><th id="th4">분류</th><th id="th2">제목</th><th id="th3">작성자</th><th id="th6">날짜</th>
							 </tr>
						</thead>
						
						<tbody class="mb_table">		
							<c:choose>
								<c:when test="${empty list}">
									<tr>
										<td colspan="6"><p>자료가 존재하지 않습니다.</p></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="k" items="${list}" varStatus="vs">
										<tr>
											<td>${paging.totalRecord -((paging.nowPage-1)*paging.numPerPage + vs.index) }</td>
											<td>${k.FA_TYPE}</td>
												<td>
													<a class="title">
													${k.FA_SUBJECT}</a>
												</td>																		 																															 												
												<td>${k.FA_WRITER}</td>
												<td>${k.FA_DATE.substring(0,10)}</td>
											</tr>
											<tr class="content-row">
												<td colspan="6" class="conts">
												<p style="margin-left: 50px;">${k.FA_ANSWER}</p>
												</td>
											</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
							<tfoot>
								<tr>
									<td colspan="6">
										<ol class="paging">
											<!-- 이전버튼 : 첫블럭이면 비활성화-->
											<c:choose>
												<c:when test="${paging.beginBlock <= paging.pagePerBlock }">
													<li class="disable">이전으로</li>
												</c:when>
												<c:otherwise>
													<li><a href="/bbs_faq_go.do?cPage=${paging.beginBlock-paging.pagePerBlock }">이전으로</a></li>
												</c:otherwise>
											</c:choose>	
											<c:forEach begin="${paging.beginBlock }" end="${paging.endBlock }" step="1" var="k">
												<c:if test="${k == paging.nowPage }">
													<!--현재페이지와 같으면  -->
													<li class="now">${k }</li>
												</c:if>
												<c:if test="${k != paging.nowPage }">
													<li><a href="/bbs_faq_go.do?cPage=${k }"> ${k }</a></li>
												</c:if>
											</c:forEach>
															
											<!-- 이후버튼  -->	
											<c:choose>
												<c:when test="${paging.endBlock >= paging.totalPage }">
													<li class="disable">다음으로</li>
												</c:when>
												<c:otherwise>
													<li><a href="/bbs_faq_go.do?cPage=${paging.beginBlock+paging.pagePerBlock }">다음으로</a></li>
												</c:otherwise>
											</c:choose>					
										</ol>
									</td>
								</tr>
						</tfoot>
					</table>
					</article>
			</section>
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
</div>
</body>
</html>