<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
.m_table{width: 30%; padding-top: 50px;}

.mb_table td{
	border-bottom: 1px dashed #444;
	padding : 10px;
	padding-bottom:30px;
	padding-top : 30px;
	height: 30px;
	text-align: center;
}
th {
    background-color: #1b5ac2;
    color: #ffffff;
}

#pwd{
	width: 100%;
    padding: 10px;
    box-sizing: border-box;
}
.d_btn{
	display: inline-block;
    padding: 10px 20px;
    background-color: #1b5ac2;
    color: #ffffff;
    border: none;
    cursor: pointer;
    width: 120px;
    height: 50px;
    text-align: center;
    line-height: 30px; /* 버튼 높이에 맞게 텍스트 세로 가운데 정렬 */
    margin: 10px;
}
#d_noti{
	color: red; 
	font-size: 14px; 
	text-align: center;
	padding-top: 30px;
	padding-bottom: 30px;

 }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var pwchk = "${pwchk}";
	if(pwchk == "fail") {
		alert("비밀번호틀립니다. 다시 입력하세요");
		$("#pwd").focus();
		return ;
	}
});
</script>
<script type="text/javascript">
function list_go(f) {
	f.action="/admin_report.do";
	f.submit();
}
function delete_ok(f){
	if(f.pwd.value.trim().length <=0){
		alert("비번을 입력해주세요");
		f.pwd.focus();
		event.preventDefault();
		return;  //비번입력을해야지만 넘어갈수있게함.
	}
	f.action="/admin_rep_del_ok.do";
	f.submit();
}
</script>
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="ad_header.jsp"></jsp:include>
		<section id="contents">
		<hr class="hr">
			<div id="bbs_sub"><h3>삭제화면</h3></div>
			<form method="post">
				<table class="m_table">				
						<thead class="mh_table">
							 <tr>
							 	<th>비밀번호확인</th>
							 </tr>
						</thead>
						<tbody class="mb_table">		
							<tr>
								<td>
									<input type="password" name="pwd" id="pwd" placeholder="삭제하시려면 비밀번호를 입력하세요">
								</td>
							</tr>								
						</tbody>
					</table>
					<div>
						<p id="d_noti">삭제시에는 되돌릴 수 없으며, 작성한 모든 글이 삭제됨을 알립니다.<br>
						   정말 삭제를 원할 시에만 삭제버튼을 눌러주세요 </p>
					</div>
					<div style="text-align: center;">
					<input type="hidden" name="REPORT_NUM" value="${REPORT_NUM}">
						<button class="d_btn" onclick="delete_ok(this.form)">삭제</button>
						<button class="d_btn" onclick="list_go(this.form)">목록</button>
					</div>
				</form>
		</section>

		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>
