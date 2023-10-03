<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

fieldset {
  display: flex;
  justify-content: center;
  border: none;
  margin: 0;
  padding: 40px 20px;
}
#text{

	padding-left:45px;
	float: none;
	text-align: left;
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	function updateOk_go(f) {
		var checkbox = document.getElementById("chkbox");
        // 체크박스가 체크되었을 때
        if (checkbox.checked) {
            // 값 1을 hidden 필드에 설정합니다.
            document.getElementById("secret_flag").value = "1";
        } else {
            // 체크가 해제되었을 때
            document.getElementById("secret_flag").value = "0";
        }	
        
      // 변경사항이 있는 경우 폼을 제출합니다.
	     f.action = "/bbs_review_updateOk.do"; // 수정완료 컨트롤러 주소로 변경
	     f.submit();
	     }


</script>

<script type="text/javascript">

	function list_go(f) {
		f.action="/bbs_review_go.do";
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
					<div id="bbs_sub"><h1>Review 수정화면</h1>

					</div>
					<!-- 메인 내용 -->
					<form method="post" enctype="multipart/form-data" id="form">
					<!--db랑 연결시 name부분은 db와 동일하게.  -->
						<table class="m_table">
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">리뷰 유형</td>
									<td id="radio">
										<input type="radio" name="RE_TYPE" value="상품리뷰" ${reviewvo.RE_TYPE eq '상품리뷰' ? 'checked' : ""} />
										<span>상품리뷰</span>	
										<input type="radio" name="RE_TYPE" value="칭찬합시다" ${reviewvo.RE_TYPE eq '칭찬합시다' ? 'checked' : ""}  />
										<span>칭찬합시다</span>	
									</td>
							</tr>
										<tr align="center">
													<td bgcolor="#1b5ac2" class="w_font">물품</td>
													<c:choose>
													<c:when test="${empty reviewvo.PROD_NAME}">
													<td><input type="text" name="PROD_NAME" size="20" autocomplete='off' value="[선택물품없음]" disabled/></td>
													</c:when>
													<c:otherwise>
													<td><input type="text" name="PROD_NAME" size="20" autocomplete='off' value="${reviewvo.PROD_NAME}" disabled/></td>
													</c:otherwise>
												</c:choose>
												</tr>
										<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">작성자</td>
								<!--이건 로그인한 사람이 자동으로 뜨게하기.  -->
								<td><input type="text" name="RE_WRITER" size="20" autocomplete='off' value="${reviewvo.RE_WRITER}" disabled/></td>
							</tr>
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">제목</td>
								<td><input type="text" name="RE_SUBJECT" size="20" autocomplete='off' value="${reviewvo.RE_SUBJECT }"/></td>
							</tr>
							
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font"  width="200px">첨부파일</td>
						
								  <c:choose>
									  	<c:when test="${empty reviewvo.RE_FILE}">
									  		<td><input type="file" name="file"><b>이전 파일 없음</b></td>
									  		<input type="hidden" name="old_f_name" value="">
									  	</c:when>
									  	<c:otherwise>
									  		<td><input type="file" name="file">이전 파일명(${reviewvo.RE_FILE })</td>
									  		<input type="hidden" name="old_f_name" value="${reviewvo.RE_FILE }">
									  	</c:otherwise>
								 </c:choose>
							
							</tr>
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">비밀글여부</td>
								<td>
									<div id="chkbox_div">
										<input type="checkbox" name="RE_LOCK" id="chkbox" ${reviewvo.RE_LOCK eq '1' ? 'checked' : ""}/>
										<label for="chkbox"></label>
										비밀글여부
									</div>
							</tr>
							<tr align="center">
							
								<td colspan="2">
									<textarea rows="10" cols="60" name="RE_CONTENT" id="content">
									${reviewvo.RE_CONTENT }
									</textarea>
								</td>
							</tr>
							<tfoot>
								<tr align="center">
									<td colspan="2">
										<input type="button" value="작성" onclick="updateOk_go(this.form)" class="in_btn"/>
										<input type="hidden" name="secret_flag" id="secret_flag" value="0" />
										<input type="hidden" name="PROD_NUM" value="${reviewvo.PROD_NUM}">
										<input type="hidden" name="RE_NUM" value="${reviewvo.RE_NUM}">
										<input type="hidden" name="RE_TYPE" value="${reviewvo.RE_TYPE}">
										<input type="hidden" name="cPage" value="${cPage}">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="button" value="목록" onclick="list_go(this.form)" class="in_btn"/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="reset" value="취소" class="in_btn" id="reset"/>
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
	
    	<script src="resources/js/summernote-lite.js"></script>
    	<script src="resources/js/lang/summernote-ko-KR.js"></script>
    	<script type="text/javascript">
    	$(function(){
    		$('#content').summernote({
    			lang : 'ko-KR',
    			height : 800,
    			focus : true,
    			callbacks : {
    				onImageUpload :  function(files, editor){
    					for (var i = 0; i < files.length; i++) {
							sendImage(files[i], editor);
						}
    				}
    			}
			});
    	});
    	function sendImage(file, editor) {
			var frm = new FormData();
			frm.append("s_file",file);
			$.ajax({
				url : "/saveImage.do",
				data : frm,
				type : "post",
				contentType : false,
				processData : false,
				dataType : "json",
			}).done(function(data) {
				var path = data.path;
				var fname = data.fname;
				$("#content").summernote("editor.insertImage",path+"/"+fname);
			});
			consloe.log("끝");
		}
    	
    	</script>
</body>
</html>