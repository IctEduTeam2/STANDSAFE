<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>STANDSAFE</title>
<!-- <meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" /> -->
<!-- Link Swiper's CSS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.get('success') === 'true') {
        alert('사용자 업데이트를 성공했습니다.');
    }
});
</script>
<link rel="stylesheet" href="resources/css/slide.css" />
<link rel="stylesheet" href="resources/css/basis.css" />
<link rel="stylesheet" href="resources/css/userinfo.css" />

<script type="text/javascript">
	function UserInfoForm() {
		location.href = "/userinfoform.do";
	}

	function OrderGo() {
	    location.href = "/orderlistform.do?client_num=<%= session.getAttribute("client_num") %>";
	}

	
	function WishlistGo() {
		location.href = "/wishlist.do";
	}

	function BasketGo() {
		location.href = "/basket.do";
	}

	function PointGo() {
		location.href = "/pointRecords.do";
	}
	function MyBoardGo() {
		location.href = "/myboard.do";
	}

	function UserWithdrawal() {
	    if(confirm("정말로 탈퇴하시겠습니까?")) {
	        location.href = "/userWithdrawal.do";
	    }
	}
</script>
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents">
			<div class="mypage-header">
				<h1
					style="text-align: center; font-size: 30px; margin-bottom: 20px; margin-top: 100px;">마이
					페이지</h1>
				<br>
			</div>
			<div class="mypage-boxs">
				<button class="mypage-box" onclick="UserInfoForm()">
					<span class="mypage-text">회원정보</span> <span class="mypage-arrow">>></span>
				</button>
				<button class="mypage-box" onclick="OrderGo()">
					<span class="mypage-text">주문조회</span> <span class="mypage-arrow">>></span>
				</button>
				<button class="mypage-box" onclick="WishlistGo()">
					<span class="mypage-text">위시리스트</span> <span class="mypage-arrow">>></span>
				</button>
				<button class="mypage-box" onclick="BasketGo()">
					<span class="mypage-text">장바구니</span> <span class="mypage-arrow">>></span>
				</button>
				<button class="mypage-box" onclick="PointGo()">
					<span class="mypage-text">내 포인트</span> <span class="mypage-arrow">>></span>
				</button>
				<!-- <button class="mypage-box" onclick="MyBoardGo()">
					<span class="mypage-text">내 게시글 보기</span> <span
						class="mypage-arrow">>></span> -->
				</button>
				<button class="mypage-box" onclick="UserWithdrawal()">
					<span class="mypage-text">회원탈퇴</span> <span class="mypage-arrow">>></span>
				</button>
			</div>
		</section>

		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>