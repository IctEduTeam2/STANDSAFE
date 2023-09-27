<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.io.StringReader"%>
<%@ page import="javax.xml.parsers.DocumentBuilder"%>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@ page import="org.w3c.dom.Document"%>
<%@ page import="org.w3c.dom.Element"%>
<%@ page import="org.w3c.dom.Node"%>
<%@ page import="org.w3c.dom.NodeList"%>
<%@ page import="org.xml.sax.InputSource"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>STANDSAFE</title>
<!-- <meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" /> -->
<!-- Link Swiper's CSS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/slide.css" />
<link rel="stylesheet" href="resources/css/basis.css" />
<style type="text/css">
.menu{margin-bottom: 50px;}

#small_news{ background-color: black; color: yellow;}



.top_btn{
	margin-top:20px;
	width: 130px;
    height: 50px;
    font-size: 16px;
    background-color: gray;
    color: white;
    border: none;
	padding: 10px 20px;
  	cursor: pointer;
 	 transition: background-color 0.3s, color 0.3s;
}

.top_btn:hover {
  background-color: #1b5ac2;
  color: white;
}

.top_btn:active {
  background-color: #1b5ac2;
   color: white;
}
#hr1{
	width: 100%;
	border:0px;
	height: 4px;
	background: gray;
	margin-top: 50px;
}
#hr2{
	width: 100%;
	border:0px;
	height: 4px;
	background: black;
	margin-top: 30px;
}

.top_tab {
	margin-top: 20px;
	border: 1px solid black;
	padding: 10px;

	text-align: left;
		
}
#date{
	margin-left: 30px;
	width: 130px;
	height: 50px;
}
.top_date{
	margin-top: 20px;
	float: right;
	margin-bottom: 30px;
}

.table{
	text-align : center;
	width: 100%;
	height:auto;
	border-top: 1px solid #444;
	border-collapse: collpas;
	margin-left: auto;
    margin-right: auto;

}

.table td{
	border-bottom: 1px dashed #444;
	padding : 10px;
	height: 30px;
}


.h_table th{
	border-bottom: 1px solid #444;
	padding : 10px;
}
.b_table td{
	border-bottom: 1px dashed #444;
	padding : 10px;
	height: 30px;
}

.map_btn{
	width: 50px;
	height: 100%;
	border: 0px;
	background: #1b5ac2;
	outline: none;
	color: #ffffff;
}
.s_btn{
	height: 50px;
	background-color: #1b5ac2;
	color: #ffffff;
	border: 0px;
	width: 60px;
	
	}
/* paging */
table tfoot ol.paging {
	list-style: none;
}

table tfoot ol.paging li {
	float: left;
	margin-right: 8px;
}

table tfoot ol.paging li a {
	display: block;
	padding: 3px 7px;
	border: 1px solid #00B3DC;
	color: #2f313e;
	font-weight: bold;
}

table tfoot ol.paging li a:hover {
	background: #00B3DC;
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
	border: 1px solid #ff4aa5;
	background: #ff4aa5;
	color: white;
	font-weight: bold;
}
</style>
</style>

</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents">
		<div class="top_header">
			<h1>■ 재난 정보</h1>
			<br>
			<p id="small_news">한줄뉴스처럼 재난문자 뜨게할것(?)</p>
		</div>
		
			<div class="top_btns" >
			<button onclick="location.href='/jaenan_fire.do'" class="top_btn">화재</button>
			<button onclick="location.href='/jaenan_jijinlive.do'" class="top_btn" style="background-color: #1b5ac2">지진</button>
			<button onclick="location.href='/jaenan_rainlive.do'" class="top_btn" >강수</button>
		</div>
		<hr id="hr1">
		
		<div class="top_tab">
			<a href="/jaenan_jijinlive.do">실시간 지진상황 </a> |
			<a href="/jaenan_jijin.do" style="color: #1b5ac2; font-weight: bold;">국내지진 규모 4.0이상 기록</a> 
		</div>
	<div class="top_date">
			<p style="display: inline-block;">날짜별 조회</p>
			<input type="date" id="date" name="date" >
			<input type="button" value="검색" class="s_btn"/>
		</div>
		
		<hr id="hr2">
		<table class="table">				
						<thead class="h_table">
							 <tr>
							 	<th id="th1">연도</th><th id="th2">날짜</th><th id="th3">발생규모</th><th id="th4">지역</th>
							 </tr>
						</thead>
<tbody class="b_table">
                    <%
                        String apiData = (String) request.getAttribute("apiData");
                    
                        if (apiData != null && !apiData.isEmpty()) {
                            try {
                                DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                                DocumentBuilder builder = factory.newDocumentBuilder();
                                Document doc = builder.parse(new InputSource(new StringReader(apiData)));
                                NodeList nList = doc.getElementsByTagName("row");
                                
                                for (int temp = 0; temp < nList.getLength(); temp++) {
                                    Node nNode = nList.item(temp);
                                    if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                                        Element eElement = (Element) nNode;
                                        
                                        String wrttimeid = eElement.getElementsByTagName("wrttimeid").item(0).getTextContent();
                                        String date_occu = eElement.getElementsByTagName("date_occu").item(0).getTextContent();
                                        String scale = eElement.getElementsByTagName("scale").item(0).getTextContent();
                                        String epic = eElement.getElementsByTagName("epic").item(0).getTextContent();
                                      

                                        //xml테이블
                                        out.println("<tr>");
                                        out.println("<td>" + wrttimeid + "</td>");
                                        out.println("<td>" + date_occu + "</td>");
                                        out.println("<td>" + scale + "</td>");
                                        out.println("<td>" + epic + "</td>");
                                        out.println("</tr>");
                                    }
                                }
                            } catch (Exception e) {
                                out.println("Error while parsing XML: " + e.getMessage());
                            }
                        } else {
                            out.println("No API data available.");
                        }
                    %>
                </tbody>
                <tfoot>
					<tr>
						<td colspan="4">
							<ol class="paging">
								<!-- 이전 버튼 -->
								<c:choose>
									<c:when test="${paging.beginBlock <= paging.pagePerBlock }">
										<li class="disable">이전으로</li>
									</c:when>
									<c:otherwise>
										<li><a
											href="/jaenan_jijin.do?cPage=${paging.beginBlock-paging.pagePerBlock }">이전으로</a></li>
									</c:otherwise>
								</c:choose>

								<!-- 페이지번호들 -->
								<c:forEach begin="${paging.beginBlock }"
									end="${paging.endBlock }" step="1" var="k">
									<!--  현재 페이지는 링크 X, 나머지 페이지는 해당 페이지로 이동하게 링크 처리 -->
									<c:if test="${ k == paging.nowPage}">
										<li class="now">${k}</li>
									</c:if>
									<c:if test="${ k != paging.nowPage}">
										<li><a href="/jaenan_jijin.do?cPage=${k}">${k}</a></li>
									</c:if>
								</c:forEach>

								<!-- 이후 버튼 -->
								<c:choose>
									<c:when test="${paging.endBlock >= paging.totalPage }">
										<li class="disable">다음으로</li>
									</c:when>
									<c:otherwise>
										<li><a
											href="/jaenan_jijin.do?cPage=${paging.beginBlock+paging.pagePerBlock }">다음으로</a></li>
									</c:otherwise>
								</c:choose>
							</ol>
						</td>
					</tr>
				</tfoot>
            </table>
        </section>
        <jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
        <script src="resources/js/quick.js"></script>
        <jsp:include page="../Semantic/footer.jsp"></jsp:include>
    </div>
</body>
</html>