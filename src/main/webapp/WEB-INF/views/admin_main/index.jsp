<%@ page import="com.ict.statistics.model.vo.SalesSummaryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
/* 테이블 기본 스타일 */
table {
	width: 100%;
	border-collapse: collapse; /* 셀 사이의 테두리를 합침 */
	margin: 25px 0;
}

/* 테이블 헤더 스타일 */
table thead th {
	background-color: #1b5ac2;
	color: white;
	padding: 10px;
	border: 1px solid #ddd;
}

/* 테이블 셀 스타일 */
table th, table td {
	padding: 12px 15px;
	border: 1px solid #ddd;
}

/* 테이블 row에 대한 호버 효과 */
table tbody tr:hover {
	background-color: #f5f5f5;
}

/* 짝수 번째 row의 배경색 */
table tbody tr:nth-child(even) {
	background-color: #f3f3f3;
	select
	,
	input[type="text"]
	{
	height
	:
	28px; /* 원하는 크기로 조정하세요 */
}
</style>
<title>STANDSAFE</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Link Swiper's CSS -->

<link rel="stylesheet" href="resources/css/slide.css" />
<link rel="stylesheet" href="resources/css/basis.css" />
<link rel="stylesheet" href="resources/css/admin_main.css" />
</head>
<body onload="">
	<!-- InitializeStaticMenu(); -->
	<div id="mydiv">
		<jsp:include page="../admin_main/header.jsp"></jsp:include>
		<section id="contents">
			<!-- 여기에 컨텐츠 넣으시면 됩니다. -->
			<article>
				<div class="info-boxes">
					<div class="info-box graph">
						<h2>방문자 접속 그래프</h2>
						<canvas id="visitChart" width="200" height="100"></canvas>
						<script>
function formatDate(inputDate) {
    var options = { year: 'numeric', month: 'long', day: 'numeric', weekday: 'long' };
    var date = new Date(inputDate);
    var resultDate = date.toLocaleDateString('ko-KR', options);
    return resultDate.split(' ').slice(0, 3).join(' ');
}

$(document).ready(function(){
    $.ajax({
        url: "getWeeklyVisitData",
        type: "GET",
        dataType: "json",
        success: function(response){
            var ctx = document.getElementById('visitChart').getContext('2d');
            var visitChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: response.weeklyVisitData.map(data => formatDate(data.VISIT_DATE)),
                    datasets: [{
                        label: 'Daily Visits',
                        data: response.weeklyVisitData.map(data => data.VISIT_COUNT),
                        borderColor: 'rgba(75, 192, 192, 1)',
                        fill: false
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        },
        error: function(error){
            console.error("데이터 로딩 중 오류 발생: ", error);
        }
    });
});
</script>

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
							<tbody id="salesSummaryTbody">
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
						</tbody>
					</table>
				</div>
			</article>

			<article>
				<div class="graph-boxes">
					<div class="box top-products">
						<h3>상위 5 상품</h3>
						<div class="product-item"></div>
					</div>
					<div class="box product-graph">
						<h3>상품별 매출 그래프</h3>
						<canvas id="productCategorySalesChart" width="200" height="100"></canvas>
						<script type="text/javascript">
						function getLast7Days() {
						    const result = [];
						    for (let i = 6; i >= 0; i--){
						        const d = new Date();
						        d.setDate(d.getDate() - i);
						        result.push(formatDate(d));
						    }
						    return result;
						}

						function drawProductSalesChart(productCategorySales) {
						    const last7Days = getLast7Days();
						    
						    const category1Sales = last7Days.map(date => {
						        const item = productCategorySales.find(x => x.productCategory === 1 && formatDate(x.salesDate) === date);
						        return item ? item.dailyRevenue : 0;
						    });
						    
						    const category2Sales = last7Days.map(date => {
						        const item = productCategorySales.find(x => x.productCategory === 2 && formatDate(x.salesDate) === date);
						        return item ? item.dailyRevenue : 0;
						    });

						    const category3Sales = last7Days.map(date => {
						        const item = productCategorySales.find(x => x.productCategory === 3 && formatDate(x.salesDate) === date);
						        return item ? item.dailyRevenue : 0;
						    });
        

        const ctx = document.getElementById('productCategorySalesChart').getContext('2d');
        new Chart(ctx, {
            type: 'line',
            data: {
                labels: last7Days,
                datasets: [{
                    label: '소방/안전',
                    data: category1Sales,
                    borderColor: 'red',
                    fill: false
                }, {
                    label: '재난/응급/긴급',
                    data: category2Sales,
                    borderColor: 'green',
                    fill: false
                }, {
                    label: '일상/기타',
                    data: category3Sales,
                    borderColor: 'blue',
                    fill: false
                }]
            },
            options: {
                scales: {
                    x: {
                        beginAtZero: true
                    },
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }

    $(document).ready(function() {
        $.ajax({
            type: "GET",
            url: "/getProductCategorySales",
            success: function(response) {
                if (response && Array.isArray(response.productCategorySales)) {
                    drawProductSalesChart(response.productCategorySales);
                } else {
                    console.error("서버 응답이 배열이 아닙니다:", response);
                }
            },
            error: function(error) {
                console.log("Error fetching product category sales:", error);
            }
        });
    });
</script>

					</div>

				</div>
			</article>
		</section>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
		
	</div>
	<!-- 동적 데이터 로딩 스크립트 -->
	<script>
$(document).ready(function() {
	function formatDate(inputDate) {
	    var options = { year: 'numeric', month: 'long', day: 'numeric', weekday: 'long' };
	    var date = new Date(inputDate);
	    var resultDate = date.toLocaleDateString('ko-KR', options);
	    return resultDate.split(' ').slice(0, 3).join(' ');
	}

    $.ajax({
        url: 'salesSummaryData',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            var tbody = $('#salesSummaryTbody');
            $.each(data, function(index, salesSummary) {
                var formattedDate = formatDate(salesSummary.report_date);
                var row = '<tr>' +
                          '<td>' + formattedDate + '</td>' +
                          '<td style="text-align: right;">' + salesSummary.order_count + ' 건</td>' +
                          '<td style="text-align: right;">' + salesSummary.total_revenue.toLocaleString() + ' 원</td>' +
                          '<td style="text-align: right;">' + salesSummary.visitor_count + ' 명</td>' +
                          '<td style="text-align: right;">' + salesSummary.join_count + ' 명</td>' +
                          '<td style="text-align: right;">' + salesSummary.inquiry_count + ' 건</td>' +
                          '<td style="text-align: right;">' + salesSummary.review_count + ' 건</td>' +
                          '</tr>';
                tbody.append(row);
            });
        },
        error: function(err) {
            console.log('Error:', err);
        }
    });
});
</script>
	<script>
$(document).ready(function(){
    // 초기 로딩 시, 전체 데이터를 불러옵니다.
    loadData("all");

    // 라디오 버튼에 클릭 이벤트 리스너 추가
    $("input[name='postType']").click(function() {
        var selectedType = $(this).val();
        loadData(selectedType);
    });
});
function formatDate(inputDate) {
    // 주어진 날짜 문자열을 Date 객체로 변환
    var date = new Date(inputDate);
    
    // 원하는 형식으로 날짜를 변환
    var year = date.getFullYear();
    var month = date.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줌
    var day = date.getDate();
    
    return year + "년 " + month + "월 " + day + "일";
}

function loadData(postType) {
    var apiEndpoint = "/top10";

    $.ajax({
        url: "/top10?category=" + postType, // 여기를 수정합니다.
        type: "GET",
        dataType: "json",
        success: function(response){
            var tbody = $(".post-table tbody");
            tbody.empty(); // 기존 데이터 삭제

            $.each(response, function(index, post) {
            	var formattedDate = formatDate(post.DATE); // 날짜 변환
                var row = '<tr>' +
                          '<td>' + post.ID + '</td>' +
                          '<td>' + post.TYPE + '</td>' +
                          '<td>' + post.SUBJECT + '</td>' +
                          '<td>' + formattedDate + '</td>' +
                          '</tr>';
                tbody.append(row);
            });
        },
        error: function(error){
            console.error("데이터 로딩 중 오류 발생: ", error);
        }
    });
}
</script>
		<script>
$(document).ready(function() {
    loadTop5Products();
});
function loadTop5Products() {
    $.ajax({
        type: "GET",
        url: "/top5",
        dataType: "json",
        success: function(data) {
            $(".product-item").remove(); // 기존 상품 항목 제거
            data.forEach(function(product) {
            	console.log(product.PROD_IMG);
            	var productItem = '<div class="product-item">' +
            	'<img src="resources/images/products/' + product.PROD_IMG + '" alt="상품 이미지">'+
                '<div class="product-info">' +
                '<span class="product-name" style="font-size: 20px;">' + product.PROD_NAME + ' </span>'+
                '<br>'+
                '<span class="product-revenue" style="font-size: 20px;">' + product.REVENUE + '원</span>'+
                '</div></div>';
                $(".top-products").append(productItem);
            });
        },
        error: function(error) {
            console.log("Error fetching top 5 products:", error);
        }
    });
}
</script>
</body>
</html>