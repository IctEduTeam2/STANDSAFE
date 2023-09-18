<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>STANDSAFE</title>
<link rel="stylesheet" href="resources/css/summernote-lite.css">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<!-- Link Swiper's CSS -->
<head>
<style>
.header-style {
	background-color: navy;
	color: white;
}
</style>
<script type="text/javascript">
	function emaillist_go(form) {
		location.href = 'emaillist.do';
	}
</script>
</head>
<link rel="stylesheet" href="resources/css/slide.css" />
<link rel="stylesheet" href="resources/css/basis.css" />
<link rel="stylesheet" href="resources/css/mail.css" />

</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../header.jsp"></jsp:include>
		<section id="contents">
			<div id="bbs">
				<form method="post" encType="multipart/form-data">
					<table summary="메일 쓰기">
						<caption>메일쓰기</caption>
						<tbody>
							<tr>
								<th class="header-style">제목</th>
								<td><input type="text" name="subject" size="45" /></td>
							</tr>
							<tr>
								<th class="header-style">대상</th>
								<td>체크한 대상만</td>
							</tr>
							<tr>
								<th class="header-style">첨부파일</th>
								<td><input type="file" name="file" /></td>
							</tr>
							<tr>
								<td colspan="2"><textarea name="content" cols="50" rows="8"
										id="content"></textarea></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center;"><input
									type="button" value="보내기" onclick="sendData(this.form)" /> <input
									type="button" value="목록" onclick="emaillist_go(this.form)" /></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"
				crossorigin="anonymous"></script>
			<script src="resources/js/summernote-lite.js"></script>
			<script src="resources/js/lang/summernote-ko-KR.js"></script>
			<script type="text/javascript">
				$(function() {
					$('#content').summernote({
						lang : 'ko-KR',
						height : 300,
						focus : true,
						callbacks : {
							onImageUpload : function(files, editor) {
								for (var i = 0; i < files.length; i++) {
									sendImage(files[i], editor);
								}
							}
						}
					});
				});
				function sendImage(file, editor) {
					var frm = new FormData();
					frm.append("s_file", file);
					$.ajax({
						url : "/saveImg.do",
						data : frm,
						type : "post",
						contentType : false,
						processData : false,
						dataType : "json",
					}).done(
							function(data) {
								var path = data.path;
								var fname = data.fname;
								$("#content").summernote("editor.insertImage",
										path + "/" + fname);
							});
				}
			</script>

		</section>
		<jsp:include page="../../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>
