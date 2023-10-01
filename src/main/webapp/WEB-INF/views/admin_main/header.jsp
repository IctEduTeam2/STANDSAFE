<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		console.log("loginChk is: ", loginChk);
		var loginChk = "${loginChk}";
		
		if (loginChk === "noUser") {
	        alert("존재하지 않는 아이디입니다.");
	        session.removeAttribute("loginChk");
	        session.abort();
	        return;
	        
		}else if(loginChk == "fail"){
			alert("비밀번호틀림");
			session.removeAttribute("loginChk");
			session.abort();
			return;
			
		}else if(loginChk == "ok"){
			$("#loggedOut").css("display","none");    // 감추기
			$("#loggedIn").css("display","block"); // 나타내기	
		}
	});
</script>
<style type="text/css">
.menu>li:hover .submenu {
	background-color: rgb(240, 240, 240);
	height: 350px; /*서브메뉴 li한개의 높이 50*5*/
	transition-duration: 1s;
}
</style>
</head>
<body>
	<header id="header">
		<div id="top_gnb">
				<% if (session.getAttribute("loginChk") != null && session.getAttribute("loginChk").equals("ok")) { %>
  	 		 <!-- 로그인 된 상태 -->
			<div id="loggedIn">
			<a class="top_gnb_a">${sessionScope.advo.ADMIN_NICK }님</a> <a class="top_gnb_a" href="/logoutGo.do">로그아웃</a>
			</div>
		<% } else { %>
			<div id="loggedOut">
			<a class="top_gnb_a" href="/adminlogin.do">로그인</a>
			</div>
		<% } %>
		</div>
		<div id="nav">
			<a href="/admin_logohome.do" style="margin-left: 8px;"><img id="logo"
				src="resources/images/admin_logo.png"></a>
			<ul class="menu">
				<li><a href="/userManagement.do">회원관리</a>
					<ul class="submenu">
						<li><a href="/userManagement.do">사용자 관리</a></li>
						<li><a href="/adminManagement.do">관리자 권한 관리</a></li>
					</ul></li>
				<li><a href="/product_list.do">상품관리</a>
					<ul class="submenu">
						<li><a href="/product_list.do">상품등록</a></li>
						<li><a href="/inventory_management.do">재고관리</a></li>
					</ul></li>
				<li><a href="/order_list.do">주문관리</a>
					<ul class="submenu">
						<li><a href="/order_list.do">주문내역조회</a></li>
						<li><a href="/return_list.do">반품관리</a></li>
						<li><a href="/exchange_list.do">교환관리</a></li>
					</ul></li>
				<li><a href="/admin_notice.do">게시판관리</a>
					<ul class="submenu">
						<li><a href="/admin_notice.do">공지사항</a></li>
						<li><a href="/admin_qa.do">상품Q&A</a></li>
						<li><a href="/admin_faq.do">이용안내FAQ</a></li>
						<li><a href="/admin_event.do">이벤트</a></li>
						<li><a href="/admin_reivew.do">리뷰</a></li>
						<li><a href="/admin_popslide.do">팝업/슬라이드 관리</a></li>
						<li><a href="/admin_report.do" style="color: red">신고센터</a></li>
					</ul></li>
				<li><a href="/statistics.do">피드백 및 재난</a>
					<ul class="submenu">
						<li><a href="/statistics.do">통계 관리</a></li>
						<!--  <li><a href="/jaenan_fire.do">화재</a></li>
						<li><a href="/jaenan_jijinlive.do">지진</a></li>
						<li><a href="/jaenan_rainlive.do">강수</a></li>-->
					</ul></li>
			</ul>
		</div>
	</header>
</body>
</html>