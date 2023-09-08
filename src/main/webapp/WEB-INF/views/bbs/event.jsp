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
/* paging */
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
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script> -->
<script type="text/javascript">
function search_go() {
	  var searchText = document.getElementById("s_bar").value;
	  var searchType = "";

	    if (document.getElementById("type_title").checked) {
	        searchType = "제목";
	    } else if (document.getElementById("type_content").checked) {
	        searchType = "내용";
	    } else if (document.getElementById("type_author").checked) {
	        searchType = "작성자";
	    }
	//alert(searchText+searchType);
	// AJAX 요청을 보냅니다.
    $.ajax({
        type: "POST", // 또는 "GET"을 사용할 수도 있습니다.
        url: "/bbs_ev_search.do", // 컨트롤러의 URL을 여기에 입력합니다.
        data: { searchText: searchText, searchType: searchType },
        success: function(data) {
        	
        	//console.log(data);
            // 서버에서 받은 응답을 처리합니다.
            // 예를 들어, 검색 결과를 화면에 표시하거나 다른 동작을 수행할 수 있습니다.
            // 컨트롤러에서 일처리해서 내용을 갖고왔다. 내용 라디오에 회원이라는 것을 치면 나온다. 
            // 여기서는 테이블에 붙여야한다. 
         /*  var table = "<table>";
            
            table += "<thead class='mh_table'><tr><th id='th1'>번호</th><th id='th4'>파일첨부</th><th id='th2'>제목</th><th id='th3'>작성자</th><th id='th5'>조회수</th><th id='th6'>날짜</th></tr></thead>";
            table += "<tbody>";
            
            //갖고온 배열 리스트 포문으로 돌리면서 있을때까지 뽑아내기
            for(var i =0, i<data.length; i++) {
            	var item = data[i];
            	table += "<tr>";
            	table += "<td>" + (i+1) + "</td>";
            	table += "<td>" + item.EVENT_FILE + "</td>";
            	table += "<td>" + item.EVENT_SUBJECT + "</td>";
            	table += "<td>" + item.EVENT_WRITER + "</td>";
            	table += "<td>" + item.EVENT_HIT+ "</td>";
            	table += "<td>" + item.EVENT_DATE + "</td>";
            
            }
            table += "</tbody>";
            table += "</table>";
            
		
            $("#result").append(table); */
        
        },
        error: function(error) {
            alert("검색(설정)이 잘못되어 불러올수없습니다.");
        }
    });
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
									<input type="radio" name="search" value="제목" id="type_title" checked />
									<span>제목</span>					
								</label>
								<label>
									<input type="radio" name="search" value="내용" id="type_content" />
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
											<td>
												<c:choose>
													<c:when test="${empty k.EVENT_FILE}">
														없음
													</c:when>
													<c:otherwise>
														있음
													</c:otherwise>
												</c:choose>				
											</td>
											<c:choose>
												<c:when test="${k.EVENT_ST ==2 }">
													<td style="color:gray;">삭제된 게시물입니다.</td>
												</c:when>
												<c:otherwise>
													<td><a href="/bbs_event_onelist.do?EVENT_NUM=${k.EVENT_NUM}&cPage=${paging.nowPage}">${k.EVENT_SUBJECT}</a></td>									
												</c:otherwise>
											</c:choose>
											<!--onelist 갈때 cPage 필요하다. 같이보내자. -->
											<td>${k.EVENT_WRITER}</td>
											<td>${k.EVENT_HIT}</td>
											<td>${k.EVENT_DATE.substring(0,10)}</td>
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
													<li><a href="/bbs_event_go.do?cPage=${paging.beginBlock-paging.pagePerBlock }">이전으로</a></li>
												</c:otherwise>
											</c:choose>	
											<c:forEach begin="${paging.beginBlock }" end="${paging.endBlock }" step="1" var="k">
												<c:if test="${k == paging.nowPage }">
													<!--현재페이지와 같으면  -->
													<li class="now">${k }</li>
												</c:if>
												<c:if test="${k != paging.nowPage }">
													<li><a href="/bbs_event_go.do?cPage=${k }"> ${k }</a></li>
												</c:if>
											</c:forEach>
															
											<!-- 이후버튼  -->	
											<c:choose>
												<c:when test="${paging.endBlock >= paging.totalPage }">
													<li class="disable">다음으로</li>
												</c:when>
												<c:otherwise>
													<li><a href="/bbs_event_go.do?cPage=${paging.beginBlock+paging.pagePerBlock }">다음으로</a></li>
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