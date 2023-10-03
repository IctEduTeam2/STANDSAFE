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
<!-- Link Swiper's CSS -->

<link rel="stylesheet" href="resources/css/basis.css" />
<link rel="stylesheet" href="resources/css/bbs.css" />
<style type="text/css">
.m_table{width: 80%;}

label {
  line-height: 2rem;
  padding: 0.2em 0.4em;
}


#radio { color: black; text-align: left;}

.in_btn{  
	margin-top: 50px;
}

#chkbox_div {
    display: flex;
    lign-items: center;
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


#type { color: black; text-align: left; padding-left: 50px;}
#content{
	width: 100%;
	height:800px;
}
#noti{color: red; font-size: 14px; text-align: left; margin-left: 70px}

</style>
<script type="text/javascript">
	function go_adreport_list(f) {
		location.href="/admin_report.do"
		/* 여기부분은 나중에 수정해야함, 목록 페이징, 게시글번호 들고 다녀야함. */
	}
	function go_adreport_delete(f) {
		location.href="/adreport_delete.do?REPORT_NUM=" + ${rpvo.REPORT_NUM};
		/* 여기부분은 나중에 수정해야함, 목록 페이징, 게시글번호 들고 다녀야함. */
	}
	function bbs_go_adreport_reply(f) {
		location.href="/adreport_writeform.do?REPORT_NUM=" + ${rpvo.REPORT_NUM};
		
	} 
	//관리자 내용말고, 사용자가 쓴 글 눌렀을때는 , 답글버튼이 나와야함.
	//에이작스로 관리자 로그인시에는 답글버튼이 보이게하자.
</script>
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="ad_header.jsp"></jsp:include>
		<section id="contents">
			<article>
					<hr class="hr">
					<div id="bbs_sub"><h1>신고게시글 상세내용</h1></div>
					<form method="post" enctype="multipart/form-data" id="form">
					<!--db랑 연결시 name부분은 db와 동일하게.  -->
						<table class="m_table">
							<tbody>
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">신고 유형</td>
									<td id="type">
										<span>${rpvo.REPORT_TYPE}</span>	
									</td>
							</tr>
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">작성자</td>
								<!--이건 로그인한 사람이 자동으로 뜨게하기.  -->
								<td id="type">${rpvo.REPORT_WRITER}</td>
							</tr>
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">제목</td>
								<td id="type">${rpvo.REPORT_SUBJECT}</td>
							</tr>
							
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font" width="200px;">첨부파일</td>
								<td>
									<c:choose>
										<c:when test="${empty rpvo.REPORT_FILE}">
											<b>첨부 파일 없음</b>
										</c:when>
										<c:otherwise>
											<img src="/resources/upload/${rpvo.REPORT_FILE}" style="width: 200px; height: auto;" />
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr align="center">
                                <td bgcolor="#1b5ac2" class="w_font">비밀글여부</td>
                                <td id="noti"><p>신고 게시글은 모두 비밀글 처리 됩니다. 무방비한 작성과 타인을 향한 욕설은 관리자에 의해 강제 삭제됩니다.<p></td>
                            </tr>
							<tr align="center">
								<td colspan="2" style="height: 800px;">
									${rpvo.REPORT_CONTENT}
								</td>
							</tr>
							</tbody>
							<tfoot>
								<tr align="center">
									<td colspan="2">
										<input type="button" value="답글" onclick="bbs_go_adreport_reply(this.form)" class="in_btn"/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="button" value="목록" onclick="go_adreport_list(this.form)" class="in_btn"/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="button" value="삭제"  onclick="go_adreport_delete(this.form)" class="in_btn"/>
									</td>
								</tr>
							</tfoot>
						</table>
						
					</form>
			</article>
		</section>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>