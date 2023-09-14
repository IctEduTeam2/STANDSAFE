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


    .custom-search {
        width: 700px;
        margin: 20px auto;
        background-color: white;
        padding: 50px;
        border-radius: 10px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        height:250px;
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
    .searchKey{
    margin-left: 50px; 
    margin-right: 20px;
    height:50px; 
    width: 200px;
    font-size: 16px;
    padding: 0px;
    }
    #fromDate{
    height:45px; 
    width: 400px;
    font-size: 16px;
    padding: 0px;
    margin-top: 20px;
    margin-bottom: 20px;
    margin-left: 50px; 
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
<script>
    function select_op(selectElement) {
        var select_c = selectElement.value;
        var type = document.getElementsByName("s_type")[0];

        // 모든 s_type 옵션을 초기화
        type.innerHTML = "";

        // 선택한 bbs_type에 따라 적절한 s_type 옵션 추가
        if (select_c === "공지사항" || select_c === "이벤트" || select_c === "이용안내") {
        	type.options.add(new Option("제목", "제목"));
        	type.options.add(new Option("내용", "내용"));
        } else if (select_c === "상품Q&A" || select_c === "리뷰") {
        	type.options.add(new Option("제목", "제목"));
        	type.options.add(new Option("작성자", "작성자"));
        	type.options.add(new Option("내용", "내용"));
        }
    }
    
    
</script>
<script type="text/javascript">
var msg = "${msg}";
if (msg && msg !== "") {
    alert(msg);
}
</script>
<script type="text/javascript">
	function all(f) {
	f.action ="/bbs_all_search.do"
	f.submit();
}
	
</script>
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<div style="text-align: center; padding-bottom: 20px;" >
		<h1 id="result">${bbs_type} 검색결과</h1> 
		</div>
	 <div class="custom-search"> 
        <!-- 검색 영역 -->
        <form  method="post" action="/bbs_search.do">
            <div class="search-input" >
            	<label for="searchKey">게시판</label>
	                <select class="searchKey" name="bbs_type" title="게시판선택" onchange="select_op(this)">
	                    <option value="이벤트">이벤트</option>
	                    <option value="공지사항">공지사항</option>
	                    <option value="이용안내">이용안내FAQ</option>
	                    <option value="상품Q&A">상품Q&A</option>
	                    <option value="리뷰">리뷰</option>

	                </select>
              <label for="searchKey" style="padding-left: 30px;">항목</label>
	                <select class="searchKey" name="s_type" title="검색항목선택">
	                    <option value="제목">제목</option>
	                    <option value="내용">내용</option>
	                </select>
	          </div>   
            <div class="input-wrapper">
               		
            	<label>검색어</label>
               		 <input type="text" id="fromDate" name="word"  placeholder="검색어를 입력하세요">	
           		</div>
     
		            <div class="date-picker">
		                <label for="searchDate">날　짜</label>
		                <input type="date" id="start" name="start"> ~ 
		                <input type="date" id="end" name="end">
		            </div>
		            <div class="button-container">  
		              <button class="search-button" type="submit">검색</button>        
		                <br>
		                 
		            </div>
   				 </form>
       		</div>
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
								<c:when test="${empty s_result2}">
									<tr>
										<td colspan="6"><p>"${word }" 의 검색결과가 존재하지 않습니다.</p></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:set var="index" value="${s_result2.size()}" />
									<c:forEach var="k" items="${s_result2}" varStatus="vs">
										<tr>
											<td>${index}</td>
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
												<c:when test="${k.EVENT_ST ==1 }">
													<td><a href="/bbs_event_onelist.do?EVENT_NUM=${k.EVENT_NUM}&cPage=1">${k.EVENT_SUBJECT}</a></td>				
												</c:when>
											</c:choose>
											<!--onelist 갈때 cPage 필요하다. 같이보내자. -->
											<td>${k.EVENT_WRITER}</td>
											<td>${k.EVENT_HIT}</td>
											<td>${k.EVENT_DATE.substring(0,10)}</td>
										</tr>
										 <c:set var="index" value="${index - 1}" />
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>	
					</table>
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
</div>
</body>
</html>