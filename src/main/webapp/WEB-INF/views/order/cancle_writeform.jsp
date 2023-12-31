<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
.note-btn-group {
	width: auto;
}

.note-toolbar {
	width: auto;
}

.m_table {
	width: 80%;
}

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

[type="text"] {
	width: 325px;
	padding: 7px;
	margin-left: 30px;
	border: 1px solid #1b5ac2;
	outline: none;
	float: left;
}

#buyer_radio {
	color: black;
	text-align: left;
}

#seller_radio {
	color: black;
	text-align: left;
}

.in_btn {
	margin-top: 50px;
}

.m_table td {
	border-bottom: 1px dashed #444;
	padding-top: 10px;
	padding-bottom: 10px;
	height: 30px;
}

.w_font {
	padding: 0px;
}

.r_font {
	text-align: left;
	padding-left: 35px;
}
</style>
<script type="text/javascript">
	function save_go(f) {
		if(f.pb_title.value.trim()== null || f.pb_title.value.trim() == "") { 
			alert("제목을 입력해주세요.");
			f.pb_title.focus();
		return;
		} else if(f.pb_content.value.trim()== null || f.pb_content.value.trim() == "") { 
			alert("내용을 입력해주세요.");
			f.pb_content.focus();
			return;
		} else if(f.pb_content.value.trim().length < 10) { 
			alert("내용은 최소 10글자 이상 입력해주세요.");
			f.pb_content.focus();
			return;
		} else if(f.pb_content.value.trim().length > 50) { 
			alert("내용은 최대 50글자 입력가능합니다.");
			f.pb_content.focus();
			return;
		} else {
			f.action='/productcanclereturn.do?st=${st}';
			f.submit();
		}
	}
	
</script>
</head>
<body>
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents">
			<article>

				<hr class="hr">
				<div id="bbs_sub">
					<c:choose>
					<c:when test="${st==0 }">
					<h1>환불요청</h1>
					</c:when>
					<c:when test="${st==1 }">
					<h1>교환요청</h1>
					</c:when>
					
					</c:choose>
				</div>
				<!-- 메인 내용 -->

				<form method="post" enctype="multipart/form-data" id="form">
					<!--db랑 연결시 name부분은 db와 동일하게.  -->
					<input type="hidden" name="pay_oknum" value="${pay_oknum }" /> <input
						type="hidden" name="prod_num" value="${pvo.prod_num}" />
					<table class="m_table">
						<tr align="center">
							<td bgcolor="#1b5ac2" class="w_font">주문 정보</td>
							<td><p class="r_font">${pvo.prod_name }(주문번호:
									${pay_oknum })</p></td>
						</tr>
						<tr align="center">
							<td bgcolor="#1b5ac2" class="w_font">배송비 구매자 부담</td>
							<td id="buyer_radio"><input type="radio" name="pb_dp"
								value="단순 고객 변심" checked /> <span>단순 고객 변심</span> <input
								type="radio" name="pb_dp" value="주문 실수" /> <span>주문
									실수</span></td>
						</tr>
						<tr align="center">
							<td bgcolor="#1b5ac2" class="w_font">배송비 판매자 부담</td>
							<td id="seller_radio"><input type="radio" name="pb_dp"
								value="파손 또는 불량" /> <span>파손 또는 불량</span> <input type="radio"
								name="pb_dp" value="오배송 및 지연" /> <span>오배송 및 지연</span></td>
						</tr>
						<tr align="center">
							<td bgcolor="#1b5ac2" class="w_font">작성자</td>
							<!--이건 로그인한 사람이 자동으로 뜨게하기.  -->
							<td><p class="r_font">${uvo.m_NAME }</p>
								<input type="hidden" name="client_num" value="${id }" /></td>

						</tr>
						<tr align="center">
							<td bgcolor="#1b5ac2" class="w_font">제목</td>
							<td><input type="text" name="pb_title" size="20"
								autocomplete='off' /></td>
						</tr>

						<tr align="center">
							<td bgcolor="#1b5ac2" class="w_font" width="200px;">첨부파일</td>
							<td><input type="file" name="file" size="20" /></td>
						</tr>
						<tr align="center">
							<td colspan="2"><textarea rows="10" cols="60"
									name="pb_content" id="content"></textarea></td>
						</tr>
						<tfoot>
							<tr align="center">
								<td colspan="2"><input type="button" value="요청"
									onclick="save_go(this.form)" class="in_btn" />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="취소"
									class="in_btn" id="reset" /></td>
							</tr>
						</tfoot>
					</table>

				</form>
			</article>
		</section>

		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		crossorigin="anonymous"></script>
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