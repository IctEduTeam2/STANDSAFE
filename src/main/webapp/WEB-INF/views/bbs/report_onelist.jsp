<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STANDSAFE</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="resources/css/basis.css" /> 
<link rel="stylesheet" href="resources/css/summernote-lite.css">
<link rel="stylesheet" href="resources/css/bbs.css" />
<style type="text/css">

.m_table{width: 80%;}

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

#type { color: black; text-align: left; padding-left: 50px;}

.in_btn{  
	margin-top: 50px;
}


#chkbox_div {
    display: flex;
    lign-items: center;
    padding-left: 30px;
}

#chkbox_div input[type="checkbox"] {
     opacity: 0;
     cursor: pointer;
     width: 15px; /* 크기 설정 */
     height: 15px; /* 크기 설정 */
     margin-right: 10px;
}
#chkbox_div label {
   margin-right: 20px; /* 오른쪽 마진 추가 */
        }

/* 체크 표시 스타일 설정 */
#chkbox_div input[type="checkbox"] + label {
    position: relative;
    display: inline-block;
    width: 15px; /* 크기 설정 */
    height: 15px; /* 크기 설정 */
    border: 2px solid gray; /* 변경된 보더 색상 */
    border-radius: 3px;;
   
}

/* 체크된 상태의 스타일 설정 */
 #chkbox_div input[type="checkbox"]:checked + label::before {
    content: "\2714"; /* 두꺼운 체크 표시 Unicode */
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 16px; /* 표시 크기 설정 */
    color: #1b5ac2; /* 체크 색상 설정 */
    font-weight: bold; /* 글꼴 두껍게 설정 */
}
#noti{color: red; font-size: 14px; text-align: left; margin-left: 70px}

.mf_table td{
	border-bottom:none;
	padding : 10px;
	height: 30px;
}
</style> 
<script type="text/javascript">

	function list_go(f) {
		f.action="/bbs_report_go.do";
		f.submit();
	}

	
</script>
</head>
<body>
	<div id="mydiv"> 
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents">
			<article>
			
					<hr class="hr">
				<div id="bbs_sub"><h1>신고게시물 상세화면</h1></div>
				<p id="noti" style="text-align: center; padding-bottom: 30px;">신고 게시글은 한번 작성되면 수정 및 삭제가 안됩니다. 이점 주의하십시오.<p>
					<!-- 메인 내용 -->

					<form method="post" enctype="multipart/form-data" id="form">
					<!--db랑 연결시 name부분은 db와 동일하게.  -->
						<table class="m_table">
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">신고 유형</td>
									<td>
										<span>${repvo.REPORT_TYPE}</span>	
									</td>
							</tr>
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">작성자</td>
								<!--이건 로그인한 사람이 자동으로 뜨게하기.  -->
								<td>${repvo.REPORT_WRITER}</td>
							</tr>
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">제목</td>
								<td>${repvo.REPORT_SUBJECT}</td>
							</tr>
							
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font" width="200px;">첨부파일</td>
								<td>
									<c:choose>
										<c:when test="${empty repvo.REPORT_FILE}">
											<b>첨부 파일 없음</b>
										</c:when>
										<c:otherwise>
											<img src="/resources/upload/${repvo.REPORT_FILE }" style="width: 200px; height: auto;" />
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">비밀글여부</td>
								<td id="noti"><p>신고 게시글은 모두 비밀글 처리 됩니다. 무방비한 작성과 타인을 향한 욕설은 관리자에 의해 강제 삭제됩니다.<p></td>
							</tr>
							<tr align="center">
								<td colspan="2" style="height: 800px; border-bottom: none; ">
										${repvo.REPORT_CONTENT }		
								</td>
							</tr>
							<tfoot class="mf_table">
								<tr align="center">
									<td colspan="2">
										<input type="button" value="목록" onclick="list_go(this.form)" class="in_btn"/>
										<input type="hidden" value="${repvo.REPORT_NUM}" name="REPORT_NUM">
										<input type="hidden" value="${cPage}" name="cPage">
									</td>
								</tr>
							</tfoot>
						</table>
						
					</form>
			</article>
		</section>	
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
	
</body>
</html>