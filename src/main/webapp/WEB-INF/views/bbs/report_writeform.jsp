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
.note-editable {
  text-align: left;
}

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


#noti{color: red; font-size: 14px; text-align: left; padding-left: 30px}

</style> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	function save_go(f) {
		
		 if(f.REPORT_SUBJECT.value.trim().length<=0){
				alert("제목을 입력하세요")
				f.REPORT_SUBJECT.focus();
				return;
			}
		if(f.REPORT_CONTENT.value.trim().length<=0){
				alert("내용을 입력하세요")
				f.REPORT_CONTENT.focus();
				return;
			}

		f.action="/bbs_report_writeOk.do";
		f.submit();
	}
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
					<div id="bbs_sub"><h1>신고게시물 작성화면</h1></div>
					<p id="noti" style="text-align: center; padding-bottom: 30px;">신고 게시글은 한번 작성되면 수정 및 삭제가 안됩니다. 이점 주의하십시오.<p>
					<!-- 메인 내용 -->
					<form method="post" enctype="multipart/form-data" id="form">
					<!--db랑 연결시 name부분은 db와 동일하게.  -->
						<table class="m_table">
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">신고 유형</td>
									<td id="radio">
										<input type="radio" name="REPORT_TYPE" value="신고" checked />
										<span>신고</span>	
										<input type="radio" name="REPORT_TYPE" value="건의" />
										<span>건의</span>	
									</td>
							</tr>
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">작성자</td>
								<!--이건 로그인한 사람이 자동으로 뜨게하기.  -->
								<td><input type="text" name="REPORT_WRITER" size="20" autocomplete='off' value="${nick}" /></td>
							</tr>
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">제목</td>
								<td><input type="text" name="REPORT_SUBJECT" size="20" autocomplete='off' placeholder="'신고할닉네임' 신고합니다"/></td>
							</tr>
							
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font" width="200px">첨부파일</td>
								<td><input type="file" name="file" /></td>
							</tr>
							<tr align="center">
								<td bgcolor="#1b5ac2" class="w_font">비밀글여부</td>
								<td id="noti"><p>신고 게시글은 모두 비밀글 처리 됩니다. 무방비한 작성과 타인을 향한 욕설은 관리자에 의해 강제 삭제됩니다.<p></td>
							</tr>
							<tr align="center">
								<td colspan="2">
									<textarea rows="10" cols="60" name="REPORT_CONTENT" id="content"></textarea>
								</td>
							</tr>
							<tfoot>
								<tr align="center">
									<td colspan="2">
										<input type="button" value="작성" onclick="save_go(this.form)" class="in_btn"/>
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