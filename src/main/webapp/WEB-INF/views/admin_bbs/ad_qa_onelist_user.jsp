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


</style>
<script type="text/javascript">
	function go_adqa_list(f) {
		location.href="/admin_qa.do" /*목록*/
	}
	function go_adqa_delete(f) {
		location.href="/adqa_delete.do?BOARD_NUM=" + ${qvo.BOARD_NUM};
	}
	 function go_adqa_writeform(f) {
		location.href="/adqa_writeform.do?BOARD_NUM=" + ${qvo.BOARD_NUM};
		
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
					<div id="bbs_sub"><h1>상품Q&A 상세내용</h1></div>
					<form method="post" enctype="multipart/form-data" id="form">
					<!--db랑 연결시 name부분은 db와 동일하게.  -->
						<table class="m_table">
							<tbody>
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">문의 유형</td>
									<td id="type">
										<span>${qvo.BOARD_TYPE}</span>	
									</td>
							</tr>
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">작성자</td>
								<!--이건 로그인한 사람이 자동으로 뜨게하기.  -->
								<td id="type">${qvo.BOARD_WRITER}</td>
							</tr>
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">제목</td>
								<td id="type">${qvo.BOARD_SUBJECT}</td>
							</tr>
							
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font" width="200px;">첨부파일</td>
								<td>
									<c:choose>
										<c:when test="${empty qvo.BOARD_FILE}">
											<b>첨부 파일 없음</b>
										</c:when>
										<c:otherwise>
											<img src="/resources/upload/${qvo.BOARD_FILE }" style="width: 200px; height: auto;" />
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">비밀글여부</td>
								<td>
									<div id="chkbox_div">
									<c:choose>
										<c:when test="${qvo.BOARD_LOCK == 1}">
											<input type="checkbox" id="chkbox" checked disabled/>
											<label for="chkbox"></label>
										</c:when>
										<c:otherwise>
											<input type="checkbox" id="chkbox" disabled/>
											<label for="chkbox"></label>
										</c:otherwise>
									</c:choose>
										비밀글여부
									</div>
								</td>
							</tr>
							<tr align="center">
							
								<td colspan="2" style="height: 800px;">
									${qvo.BOARD_CONTENT}
								</td>
							</tr>
							</tbody>
							<tfoot>
								<tr align="center">
									<td colspan="2">
										<input type="button" value="답글" onclick="go_adqa_writeform(this.form)" class="in_btn"/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="button" value="목록" onclick="go_adqa_list(this.form)" class="in_btn"/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="button" value="삭제"  onclick="go_adqa_delete(this.form)" class="in_btn"/>
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