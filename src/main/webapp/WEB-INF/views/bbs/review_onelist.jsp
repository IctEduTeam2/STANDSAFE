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
	function update_go(f) {
		f.action="/bbs_review_update.do";
		f.submit();
	}
	function list_go(f) {
		f.action="/bbs_review_go.do";
		f.submit();
	}
	function delete_go(f) {
		f.action="/bbs_review_delete.do";
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
					<div id="bbs_sub"><h1>Review 상세화면</h1></div>
					<!-- 메인 내용 -->
					<form method="post" enctype="multipart/form-data" id="form">
					<!--db랑 연결시 name부분은 db와 동일하게.  -->
						<table class="m_table">
							<tbody>
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">리뷰 유형</td>
									<td id="type">
										<span>상품리뷰</span>	
									</td>
							</tr>
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">작성자</td>
								<!--이건 로그인한 사람이 자동으로 뜨게하기.  -->
								<td id="type">단호박</td>
							</tr>
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">제목</td>
								<td id="type">이 소화기 꼭 사세요!</td>
							</tr>
							
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font" width="200px;">첨부파일</td>
								<td id="type"><img src="resources/images/bbs/fire.PNG"  style="width: 200px; height: auto;"></td>
							</tr>
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">비밀글여부</td>
								<td>
									<div id="chkbox_div">
										<input type="checkbox" id="chkbox" checked disabled/>
										<label for="chkbox"></label>
										비밀글여부
									</div>
							</tr>
							<tr align="center">
							
								<td colspan="2" style="height: 800px">
									 요즘 가정에서도 소화기 필수입니다! 저번에 고기구워먹다가 집태울뻔했는데  , 다행히 소화기로 진압했어요 
									 소화기 배송도 빠르고, 너무 좋습니다!
								</td>
							</tr>
							</tbody>
							<tfoot>
								<tr align="center">
									<td colspan="2">
										<input type="button" value="수정" onclick="update_go(this.form)" class="in_btn"/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="button" value="목록" onclick="list_go(this.form)" class="in_btn"/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="button" value="삭제"  onclick="delete_go(this.form)" class="in_btn"/>
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