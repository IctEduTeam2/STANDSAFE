<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STANDSAFE</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<!-- Link Swiper's CSS -->
<style type="text/css">
/* 테이블 기본 스타일 */
table {
    width: 100%;
    border-collapse: collapse; /* 셀 사이의 테두리를 합침 */
    margin: 25px 0;
    font-size: 18px;
    text-align: left;
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
}

</style>
<link rel="stylesheet" href="resources/css/slide.css" />
<link rel="stylesheet" href="resources/css/basis.css" />
<link rel="stylesheet" href="resources/css/admin_main.css" />

</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="header.jsp"></jsp:include>
		<section id="contents">
			<h1>▣ 매출요약</h1>
			<div class="info-boxes">
				<div class="info-box graph1">
					<h2>[품목별]</h2>
					<canvas id="salesChart1" width="400" height="200"></canvas>

					<script>
        fetch('/api/sales/data1')
        .then(response => response.json())
        .then(data => {
            const ctx = document.getElementById('salesChart'1).getContext('2d');
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: data.items,
                    datasets: [{
                        label: 'Sales',
                        data: data.values,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)'
                        ],
                        borderWidth: 1
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
        });
    </script>
				</div>
				<div class="info-box graph2">
					<h2>[종류별]</h2>
					<canvas id="salesChart2" width="400" height="200"></canvas>

					<script>
        fetch('/api/sales/data2')
        .then(response => response.json())
        .then(data => {
            const ctx = document.getElementById('salesChart2').getContext('2d');
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: data.items,
                    datasets: [{
                        label: 'Sales',
                        data: data.values,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)'
                        ],
                        borderWidth: 1
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
        });
    </script>
				</div>
			</div>
			<table>
				<thead>
					<tr>
						<th>품목별 요약</th>
						<th>목표</th>
						<th>전월매출</th>
						<th>당월매출</th>
						<th>목표달성율(%)</th>
						<th>전월대비증감율(%)</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${items}">
						<tr>
							<td>합계</td>
							<td>${item.target}</td>
							<td>${item.lastMonthSales}</td>
							<td>${item.thisMonthSales}</td>
							<td>${(item.thisMonthSales / item.target) * 100}</td>
							<td>${((item.thisMonthSales - item.lastMonthSales) / item.lastMonthSales) * 100}</td>
						</tr>
						<tr>
							<td>품목1 ${item.name}</td>
							<td>${item.target}</td>
							<td>${item.lastMonthSales}</td>
							<td>${item.thisMonthSales}</td>
							<td>${(item.thisMonthSales / item.target) * 100}</td>
							<td>${((item.thisMonthSales - item.lastMonthSales) / item.lastMonthSales) * 100}</td>
						</tr>
						<tr>
							<td>품목2 ${item.name}</td>
							<td>${item.target}</td>
							<td>${item.lastMonthSales}</td>
							<td>${item.thisMonthSales}</td>
							<td>${(item.thisMonthSales / item.target) * 100}</td>
							<td>${((item.thisMonthSales - item.lastMonthSales) / item.lastMonthSales) * 100}</td>
						</tr>
						<tr>
							<td>품목3 ${item.name}</td>
							<td>${item.target}</td>
							<td>${item.lastMonthSales}</td>
							<td>${item.thisMonthSales}</td>
							<td>${(item.thisMonthSales / item.target) * 100}</td>
							<td>${((item.thisMonthSales - item.lastMonthSales) / item.lastMonthSales) * 100}</td>
						</tr>
						<tr>
							<td>품목4 ${item.name}</td>
							<td>${item.target}</td>
							<td>${item.lastMonthSales}</td>
							<td>${item.thisMonthSales}</td>
							<td>${(item.thisMonthSales / item.target) * 100}</td>
							<td>${((item.thisMonthSales - item.lastMonthSales) / item.lastMonthSales) * 100}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
						<table>
				<thead>
					<tr>
						<th>제품별 요약</th>
						<th>목표</th>
						<th>전월매출</th>
						<th>당월매출</th>
						<th>목표달성율(%)</th>
						<th>전월대비증감율(%)</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${items}">
						<tr>
							<td>합계</td>
							<td>${item.target}</td>
							<td>${item.lastMonthSales}</td>
							<td>${item.thisMonthSales}</td>
							<td>${(item.thisMonthSales / item.target) * 100}</td>
							<td>${((item.thisMonthSales - item.lastMonthSales) / item.lastMonthSales) * 100}</td>
						</tr>
						<tr>
							<td>제품1 ${item.name}</td>
							<td>${item.target}</td>
							<td>${item.lastMonthSales}</td>
							<td>${item.thisMonthSales}</td>
							<td>${(item.thisMonthSales / item.target) * 100}</td>
							<td>${((item.thisMonthSales - item.lastMonthSales) / item.lastMonthSales) * 100}</td>
						</tr>
						<tr>
							<td>제품2 ${item.name}</td>
							<td>${item.target}</td>
							<td>${item.lastMonthSales}</td>
							<td>${item.thisMonthSales}</td>
							<td>${(item.thisMonthSales / item.target) * 100}</td>
							<td>${((item.thisMonthSales - item.lastMonthSales) / item.lastMonthSales) * 100}</td>
						</tr>
						<tr>
							<td>제품3 ${item.name}</td>
							<td>${item.target}</td>
							<td>${item.lastMonthSales}</td>
							<td>${item.thisMonthSales}</td>
							<td>${(item.thisMonthSales / item.target) * 100}</td>
							<td>${((item.thisMonthSales - item.lastMonthSales) / item.lastMonthSales) * 100}</td>
						</tr>
						<tr>
							<td>제품4 ${item.name}</td>
							<td>${item.target}</td>
							<td>${item.lastMonthSales}</td>
							<td>${item.thisMonthSales}</td>
							<td>${(item.thisMonthSales / item.target) * 100}</td>
							<td>${((item.thisMonthSales - item.lastMonthSales) / item.lastMonthSales) * 100}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>