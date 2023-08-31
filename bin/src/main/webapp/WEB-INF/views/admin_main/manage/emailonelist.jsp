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
<!-- Link Swiper's CSS -->
<head>
<style>
.header-style {
	background-color: navy;
	color: white;
}

#bbs table {
	    width:800px;
	    margin:0 auto;
	    margin-top:20px;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:14px;
	    min-height: 100px;
	    
	}
	
	#bbs table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	#bbs table th {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	#bbs table td {
	    text-align:left;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	.no {width:15%}
	.subject {width:30%}
	.writer {width:20%}
	.reg {width:20%}
	.hit {width:15%}
	.title{background:lightsteelblue}
	.odd {background:silver}
	
	fieldset {
	 width: 580px;
    }
    input{
    	padding: 10px;
    }
</style>

</head>
<link rel="stylesheet" href="resources/css/slide.css" />
<link rel="stylesheet" href="resources/css/basis.css" />


</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../../Semantic/header.jsp"></jsp:include>
		<section id="contents">
				<div id="bbs">
	<form method="post">
		<table summary="메일 쓰기">
			<caption>전송한 메일</caption>
			<tbody>
				<tr>
					<th class="header-style">제목</th>
					<td>${bvo.subject}</td>
				</tr>
				<tr>
					<th class="header-style">이름</th>
					<td>${bvo.writer}</td>
				</tr>
				<tr>
					<th class="header-style">내용</th>
					<td><pre>${bvo.content}</pre></td>
				</tr>
				<tr>
					<th class="header-style">첨부파일</th>
					<c:choose>
						<c:when test="${empty bvo.f_name}">
							<td><b>첨부 파일 없음</b></td>
						</c:when>
						<c:otherwise>
							<td><a href="/down.do?f_name=${bvo.f_name}"><img  src="resources/images/${bvo.f_name}" style="80px"></a></td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" value="${bvo.b_idx}" name="b_idx">
						<input type="hidden" value="${cPage}" name="cPage">
						<input type="button" value="삭제" onclick="delete_go(this.form)">
						<input type="button" value="목록" onclick="list_go(this.form)">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
		</section>
		<jsp:include page="../../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>
