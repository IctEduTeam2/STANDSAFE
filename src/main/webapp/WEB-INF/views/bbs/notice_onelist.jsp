<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>STANDSAFE</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="resources/css/basis.css" />
<link rel="stylesheet" href="resources/css/bbs.css" />

<script type="text/javascript">
	function go_notice_list() {
		location.href="/bbs_notice_go.do;"
		/* ����κ��� ���߿� �����ؾ���, ��� ����¡, �Խñ۹�ȣ ��� �ٳ����. */
	}
</script>
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents">
					<hr class="hr">
					<!-- ���� ���̺� -->
			
					<table class="m_table">				
						<thead class="mh_table">
							 <tr>
							 	<th id="th1">��ȣ</th><th id="th4">����÷��</th><th id="th2">����</th><th id="th3">�ۼ���</th><th id="th5">��ȸ��</th><th id="th6">��¥</th>
							 </tr>
						</thead>
						<tbody class="mb_table">		
							<tr>
								<td>1</td><td>����</td><td>�߼� ���� �Ⱓ ���� �ȳ�</td><td>������</td><td>1093</td><td>22.01.10</td>
							</tr>						
						</tbody>
					</table>
					<div class=in_div_img><img src="resources/images/bbs/notice_chusuk.jpg" class="in_img"></div>
					<div class="in_btn_div"><button class="in_btn" onclick="go_notice_list()">���</button></div>
			</section>
			
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>