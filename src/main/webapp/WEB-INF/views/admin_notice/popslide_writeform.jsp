<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
.note-btn-group{width: auto;}
.note-toolbar{width: auto;}

.m_table{width: 80%;}

label {
  line-height: 2rem;
  padding: 0.2em 0.4em;
}


[type="text"]{
	width: 325px;
	padding: 7px;
	margin-left : 30px;
	border: 1px solid #1b5ac2;
	outline: none;
	float: left;
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


</style> 

</head>
<body>
	<div id="mydiv"> 
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents">
			<article>
			
					<hr class="hr">
				<div id="bbs_sub"><h1>팝업 슬라이드 등록 </h1></div>
					<!-- 메인 내용 -->

					<form method="post" enctype="multipart/form-data" id="form">
					<!--db랑 연결시 name부분은 db와 동일하게.  -->
						<table class="m_table">
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">유형</td>
									<td id="radio">
										<input type="radio" name="search" value="subject" checked />
										<span>팝업</span>	
										<input type="radio" name="search" value="subject" checked />
										<span>슬라이드</span>
									</td>
									
							</tr>
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">제목</td>
								<td><input type="text" name="subject" size="20" autocomplete='off' /></td>
							</tr>
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font" width="200px">첨부파일</td>
								<td><input type="file" name="file" size="20" /></td>
							</tr>	
							
							<tfoot>
								<tr align="center">
									<td colspan="2">
										<input type="button" value="작성" onclick="location.href='/'" class="in_btn"/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="button" value="목록" onclick="location.href='/ad_popup.do'" class="in_btn"/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="reset" value="취소" class="in_btn" id="reset"/>
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