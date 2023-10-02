<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STANDSAFE</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="resources/css/basis.css" />
<link rel="stylesheet" href="resources/css/bbs.css" />

<script type="text/javascript">
	function go_notice_list() {

		location.href="/bbs_notice_go.do?cPage=" + ${cPage};
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
							 	<th id="th1">��ȣ</th>
							 	<th id="th2">����</th>
							 	<th id="th3">�ۼ���</th>
							 	<th id="th5">��ȸ��</th>
							 	<th id="th6">��¥</th>
							 	<th id="th4">����÷��</th>
							 </tr>
						</thead>
						<tbody class="mb_table">		
							<tr>
								<td>${nvo.NOTICE_NUM}</td>
								
								<td>${nvo.NOTICE_SUBJECT}</td><td>${nvo.NOTICE_WRITER}</td>
								<td>${nvo.NOTICE_HIT}</td><td>${nvo.NOTICE_DATE.substring(0,10)}</td>
								<td>
								<c:choose>
									<c:when test="${empty nvo.NOTICE_FILE}">
										����
									</c:when>
									<c:otherwise>
										����
									</c:otherwise>
								</c:choose>				
								</td>
							</tr>						
						</tbody>
					</table>
					<div class=in_div_img>
							   <c:choose>
									<c:when test="${empty nvo.NOTICE_FILE}">
										${nvo.NOTICE_CONTENT}
									</c:when>
										<c:otherwise>
											<a href="">
											<img src="/resources/images/${nvo.NOTICE_FILE }" style="width: 80%"></a>
											<br>
											${nvo.NOTICE_CONTENT}
									</c:otherwise>
								</c:choose>	
								
					</div> 
					
					<div class="in_btn_div">
					<button class="in_btn" onclick="go_notice_list()">�������</button>
			
					</div>
			</section>
			
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>