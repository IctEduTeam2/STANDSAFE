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

<link rel="stylesheet" href="resources/css/slide.css" />
<link rel="stylesheet" href="resources/css/basis.css" />
<link rel="stylesheet" href="resources/css/admin_main.css" />

</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../admin_main/header.jsp"></jsp:include>
		<section id="contents">
		<!-- 여기에 컨텐츠 넣으시면 됩니다. -->
		<article>
				<div class="info-boxes">
					<div class="info-box graph">
						<h2>방문자 접속 그래프</h2>
						<!-- 그래프 표시 (예: Chart.js 또는 Google Charts 사용) -->
					</div>
					<div class="info-box summary">
						<h2>판매 요약</h2>
						<table border="1">
							<thead>
								<tr>
									<th>일자</th>
									<th>주문수</th>
									<th>매출액</th>
									<th>방문자</th>
									<th>가입</th>
									<th>문의</th>
									<th>후기</th>
								</tr>
							</thead>
							<tbody>
								<!-- 10개의 행을 추가 -->
								<%
								for (int i = 0; i < 10; i++) {
								%>
								<tr>
									<td id="dayCount<%=i%>">0</td>
									<td id="orderCount<%=i%>">0</td>
									<td id="revenue<%=i%>">0</td>
									<td id="visitorCount<%=i%>">0</td>
									<td id="signUpCount<%=i%>">0</td>
									<td id="inquiryCount<%=i%>">0</td>
									<td id="reviewCount<%=i%>">0</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</article>
			<article>
				<div class="new-posts">
					<h2>신규 작성글 확인</h2>
					<div class="post-filter">
						<label><input type="radio" name="postType" value="all"
							checked> 전체</label> <label><input type="radio"
							name="postType" value="qna"> Q&A</label> <label><input
							type="radio" name="postType" value="review"> 리뷰</label> <label><input
							type="radio" name="postType" value="report"> 신고</label>
					</div>
					<table class="post-table">
						<thead>
							<tr>
								<th>번호</th>
								<th>카테고리</th>
								<th>제목</th>
								<th>날짜</th>
							</tr>
						</thead>
						<tbody>
							<!-- 예시 게시글 -->
							<tr>
								<td>8</td>
								<td>Q&A</td>
								<td>질문 있습니다.</td>
								<td>2023-08-24</td>
							</tr>
							<tr>
								<td>7</td>
								<td>리뷰</td>
								<td>상품 리뷰입니다.</td>
								<td>2023-08-23</td>
							</tr>
							<tr>
								<td>6</td>
								<td>Q&A</td>
								<td>질문 있습니다.</td>
								<td>2023-08-23</td>
							</tr>
							<tr>
								<td>5</td>
								<td>리뷰</td>
								<td>상품 리뷰입니다.</td>
								<td>2023-08-22</td>
							</tr>
							<tr>
								<td>4</td>
								<td>Q&A</td>
								<td>질문 있습니다.</td>
								<td>2023-08-24</td>
							</tr>
							<tr>
								<td>3</td>
								<td>리뷰</td>
								<td>상품 리뷰입니다.</td>
								<td>2023-08-23</td>
							</tr>
							<tr>
								<td>2</td>
								<td>Q&A</td>
								<td>질문 있습니다.</td>
								<td>2023-08-23</td>
							</tr>
							<tr>
								<td>1</td>
								<td>리뷰</td>
								<td>상품 리뷰입니다.</td>
								<td>2023-08-22</td>
							</tr>
							<!-- ... -->
						</tbody>
					</table>
				</div>
			</article>
			<article>
            <div class="graph-boxes">
                <div class="box top-products">
                    <h3>상위 5 상품</h3>
                    <!-- 예제 상품 항목 -->
                    <div class="product-item">
                        <img src="resources/images/products/product1.jpg" alt="상품 이미지">
                        <div class="product-info">
                            <span class="product-name">상품 이름1</span>
                            <span class="product-revenue">₩매출액</span>
                        </div>
                    </div>
                    <div class="product-item">
                        <img src="resources/images/products/product1.jpg" alt="상품 이미지">
                        <div class="product-info">
                            <span class="product-name">상품 이름2</span>
                            <span class="product-revenue">₩매출액</span>
                        </div>
                    </div>
                    <div class="product-item">
                        <img src="resources/images/products/product1.jpg" alt="상품 이미지">
                        <div class="product-info">
                            <span class="product-name">상품 이름3</span>
                            <span class="product-revenue">₩매출액</span>
                        </div>
                    </div>
                    <div class="product-item">
                        <img src="resources/images/products/product1.jpg" alt="상품 이미지">
                        <div class="product-info">
                            <span class="product-name">상품 이름4</span>
                            <span class="product-revenue">₩매출액</span>
                        </div>
                    </div>
                    <div class="product-item">
                        <img src="resources/images/products/product1.jpg" alt="상품 이미지">
                        <div class="product-info">
                            <span class="product-name">상품 이름5</span>
                            <span class="product-revenue">₩매출액</span>
                        </div>
                    </div>
                </div>
                <div class="box product-graph">
                    <h3>상품별 매출 그래프</h3>
                    <!-- 그래프 코드. 예: Chart.js 또는 Google Charts 등을 사용 -->
                </div>
            </div>
        </article>
		</section>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>