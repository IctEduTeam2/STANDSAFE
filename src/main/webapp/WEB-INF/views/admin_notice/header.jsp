<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/x-icon" href="resources/images/favicon.png">
<style type="text/css">

.c_btn{
	width: 150px; 
	height: 50px; 
	font-size: 16px; 
	border-radius: 10px; 
	background-color: #B5B5B5;
	 color: white; 
	 border: none;
}

.c_btn {
  padding: 10px 20px;
  font-size: 16px;
  border: none;
  cursor: pointer;
  transition: background-color 0.3s, color 0.3s;
}

.c_btn:hover {
  background-color: #1b5ac2;
  color: white;
}

.c_btn:active {
  background-color: #1b5ac2;
   color: white;
}
</style>
</head>

<body>
<header id="header">
	
			<div style="text-align: left; margin-top: 100px; ">
    		<button type="button" class="c_btn" id="btn1" onclick="location.href='/admin_notice.do'">공지사항</button>
    		<button type="button" class="c_btn" id="btn2" onclick="location.href='/admin_qa.do'">상품Q&A</button>
    		<button type="button" class="c_btn" id="btn3" onclick="location.href='/admin_faq.do'">이용안내FAQ</button>
    		<button type="button" class="c_btn" id="btn4" onclick="location.href='/admin_event.do'">이벤트</button>
    		<button type="button" class="c_btn" id="btn5" onclick="location.href='/admin_reivew.do'">Review</button>
    		<button type="button" class="c_btn" id="btn6" onclick="location.href='/admin_report.do'">신고게시판</button>
    		<button type="button" class="c_btn" id="btn7" onclick="location.href='/admin_popslide.do'">팝업/슬라이드</button>
		</div>
			
		</header>
</body>
</html>