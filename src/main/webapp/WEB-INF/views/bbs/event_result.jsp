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


    .custom-search {
        width: 800px;
        margin: 20px auto;
        background-color: white;
        padding: 50px;
        border-radius: 10px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-direction: column;
        align-items: flex-start;
    }

    label {
        display: inline;
        text-align: center;
    }

    .search-input select,
    .search-input input[type="text"] {
        margin-right: 10px;
    }

    .button-container {
        text-align: right; /* 오른쪽 정렬로 변경 */
        margin-top: 10px;
    }

    .button-container .search-button,
    .button-container .search-button-alt {
        width: 120px;
        height: 40px;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        color: white;
        cursor: pointer;
        margin: 5px;
    }

    .button-container .search-button {
        background-color: #505BBD;
    }

    .button-container .search-button-alt {
        background-color: #D3D3D3;
    }

    .search-input {
        display: flex;
        align-items: center;
        justify-content: flex-start; /* 왼쪽 정렬로 변경 */
    }

    .date-picker {
        margin-top: 10px;
    }
    #searchKey{
    margin-left: 50px; 
    height:50px; 
    width: 200px;
    font-size: 16px;
    padding: 0px;
    }
    #fromDate{
    height:50px; 
    width: 400px;
    font-size: 16px;
    padding: 0px;
    }
    #start{
    margin-left: 50px;
    height:50px; 
    width: 200px;
    font-size: 16px;
    padding: 0px;
    }
    #end{
     height:50px; 
    width: 200px;
    font-size: 16px;
    padding: 0px;
    }
    #h1{
    padding-top: 200px;
    }

</style> 
</head>
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		
		<div style="text-align: center; padding-bottom: 20px;" >

		 <h1 id="result">검색결과</h1> </div>
	 <div class="custom-search"> <!-- 클래스 추가 -->
        <!-- 검색 영역 -->
        <form id="searchForm" method="post">
            <div class="search-input" >
                <label for="searchKey">검색어</label>
	                <select id="searchKey" name="searchKey" title="검색항목선택">
	                    <option value="제목">제목</option>
	                    <option value="회원">회원 아이디</option>
	                    <option value="내용">내용</option>
	                </select>
               		 <input type="text" id="fromDate" name="word"  value=""  placeholder="검색어를 입력하세요">
           	</div>
		            <div class="date-picker">
		                <label for="searchDate">날　짜</label>
		                <input type="date" id="start" name="trip-start"> ~ 
		                <input type="date" id="end" name="trip-end">
		            </div>
		            <div class="button-container">
		                <input type="button" alt="전체기간" value="전체기간" class="search-button">
		                <input type="button" alt="일주일" value="일주일" class="search-button">
		                <input type="button" alt="오늘" value="오늘" class="search-button">
		                <br>
		                <input type="button" alt="초기화" value="초기화" class="search-button">
		                <input type="button" alt="검색" value="검색" class="search-button" onclick="location.href='/'">
		            </div>
   				 </form>
       		</div>
       </div>
        
        
		<div>
			<h3>■ (  ) 검색결과</h3>
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
							<c:choose>
								<c:when test="${empty s_result}">
									<tr>
										<td colspan="6"><p>자료가 존재하지 않습니다.</p></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="k" items="${s_result}" varStatus="vs">
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
													<li><a href="/bbs_ev_search.do?cPage=${paging.beginBlock-paging.pagePerBlock }">이전으로</a></li>
												</c:otherwise>
											</c:choose>	
											<c:forEach begin="${paging.beginBlock }" end="${paging.endBlock }" step="1" var="k">
												<c:if test="${k == paging.nowPage }">
													<!--현재페이지와 같으면  -->
													<li class="now">${k }</li>
												</c:if>
												<c:if test="${k != paging.nowPage }">
													<li><a href="/bbs_ev_search.do?cPage=${k }"> ${k }</a></li>
												</c:if>
											</c:forEach>
															
											<!-- 이후버튼  -->	
											<c:choose>
												<c:when test="${paging.endBlock >= paging.totalPage }">
													<li class="disable">다음으로</li>
												</c:when>
												<c:otherwise>
													<li><a href="/bbs_ev_search.do?cPage=${paging.beginBlock+paging.pagePerBlock }">다음으로</a></li>
												</c:otherwise>
											</c:choose>					
										</ol>
									</td>
								</tr>
						</tfoot>
					</table>
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
</div>
</body>
</html>