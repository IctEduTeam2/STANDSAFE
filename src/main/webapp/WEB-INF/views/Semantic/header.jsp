<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		var loginChk = "${loginChk}";
		if(loginChk == "fail"){
			alert("비밀번호틀림");
			return ;
		}else if(loginChk == "ok"){
			$("#loggedOut").css("display","none");    // 감추기
			$("#loggedIn").css("display","block"); // 나타내기	
		}
	});
</script>
</head>
<body>
	<header id="header">
		<div id="top_gnb">
			<div id="loggedOut">
			<a class="top_gnb_a" href="/loginform.do">로그인</a> <a class="top_gnb_a" href="/registerform.do">회원가입</a>
			<a class="top_gnb_a" href="/orderlistform.do">주문조회</a> <a class="top_gnb_a" href="/basketform.do?client_num=19">장바구니</a>
			<a class="top_gnb_a" href="/mypageform.do">마이페이지</a> <a href="/wishlistform.do"
				class="top_gnb_last_a">관심상품</a>
			</div>
			<div id="loggedIn" style="display: none;">
			<a class="top_gnb_a">${uVO.NICKNAME }님(P:${pVO.POINT_REM })</a> <a class="top_gnb_a" href="/logoutGo.do">로그아웃</a>
			<a class="top_gnb_a" href="/orderlistform.do?client_num=19"">주문조회</a> <a class="top_gnb_a" href="/basketform.do">장바구니</a>
			<a class="top_gnb_a" href="/mypageform.do">마이페이지</a> <a href="/wishlistform.do?client_num=19"
				class="top_gnb_last_a">관심상품</a>
			</div>
				
		</div>
		<div style="background-color: white;">
			<a href="/"><img id="logo" src="resources/images/logo.png"></a>
		</div>
		<div id="nav">
			<ul class="menu">
				<li><a href="#">소방/안전</a>
					<ul class="submenu">
						<li><a href="/productsform.do">소화기</a></li>
						<li><a href="#">화재감지|대피</a></li>
					</ul></li>
				<li><a href="#">재난/응급/긴급</a>
					<ul class="submenu">
						<li><a href="#">구급함|제세동기</a></li>
						<li><a href="#">재난 안전용품</a></li>
						<li><a href="#">방역 안점용품</a></li>
					</ul></li>
				<li><a href="#">일상/기타</a>
					<ul class="submenu">
						<li><a href="#">마스크</a></li>
						<li><a href="#">위생장갑</a></li>
						<li><a href="#">통조림|비상식량</a></li>
					</ul></li>
				<li><a href="#">공지사항</a>
                    <ul class="submenu">
                        <li><a href="/bbs_notice_go.do">공지사항</a></li>
                        <li><a href="/bbs_event_go.do">이벤트</a></li>
                        <li><a href="/bbs_faq_go.do">이용안내FAQ</a></li>
                        <li><a href="/bbs_qa_go.do">상품Q&A</a></li>
                        <li><a href="/bbs_review_go.do">Review</a></li>
                        <li><a href="/bbs_report_go.do" style="color: red">신고하기</a></li>
                    </ul></li>
				<li><a href="#">재난정보</a>
					<ul class="submenu">
						<li><a href="/jaenan_fire.do">화재</a></li>
						<li><a href="/jaenan_jijinlive.do">지진</a></li>
						<li><a href="/jaenan_rainlive.do">강수</a></li>
					</ul></li>
			</ul>
		</div>
	</header>
</body>
</html>