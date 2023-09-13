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
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<div style="text-align: center; padding-bottom: 20px;" >
		<h1 id="result">검색결과</h1> 
		</div>
	 <div class="custom-search"> 
        <!-- 검색 영역 -->
        <form  method="post" action="/bbs_search.do">
            <div class="search-input" >
            	<label for="searchKey">게시판</label>
	                <select class="searchKey" name="bbs_type" title="게시판선택">
	                    <option value="전체">전체게시판</option>
	                    <option value="공지사항">공지사항</option>
	                    <option value="이벤트">이벤트</option>
	                    <option value="이용안내">이용안내FAQ</option>
	                    <option value="상품Q&A">상품Q&A</option>
	                    <option value="리뷰">리뷰</option>
	                </select>
              <label for="searchKey" style="padding-left: 30px;">항목</label>
	                <select class="searchKey" name="s_type" title="검색항목선택">
	                    <option value="제목">제목</option>
	                    <option value="작성자">작성자</option>
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
							 	<th id="th1">번호</th><th id="th4">유형</th><th id="th2">제목</th><th id="th3">작성자</th><th id="th6">날짜</th>
							 </tr>
						</thead>
						<tbody class="mb_table">	
							<c:choose>
								<c:when test="${empty s_result4}">
									<tr>
										<td colspan="6"><p>검색결과가 존재하지 않습니다.</p></td>
									</tr>
								</c:when>
								<c:otherwise>
								<c:set var="index" value="${s_result4.size()}" />
									<c:forEach var="k" items="${s_result4}" varStatus="vs">
										<tr>
											<td>${index}</td>
											<td>${k.BOARD_TYPE}</td>
											
												    <td>
												      <a href="/bbs_qa_onelist.do?BOARD_NUM=${k.BOARD_NUM}&cPage=1">
												        ${k.BOARD_LOCK == 1 ? '[비밀] ' : ''}${k.BOARD_SUBJECT}
												      </a></td>
											
											<!--onelist 갈때 cPage 필요하다. 같이보내자. -->
											<td>${k.BOARD_WRITER}</td>
											<%-- <td>${k.BOARD_DATE.substring(0,10)}</td> --%>
											<c:choose>
											    <c:when test="${not empty k.BOARD_UPDATE}">
											      <!-- BOARD_UPDATE가 값이 있는 경우 -->
											      <td>${k.BOARD_UPDATE.substring(0,10)} [수정됨]				      
											      </td>
											    </c:when>
											    <c:otherwise>											  
											     <td> ${k.BOARD_DATE.substring(0, 10)}</td>
											    </c:otherwise>
											  </c:choose>
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