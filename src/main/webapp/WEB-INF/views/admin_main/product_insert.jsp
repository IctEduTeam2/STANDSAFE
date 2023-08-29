<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/basis.css" /> 
<style>
    /* 스타일링을 위한 CSS 코드 */
    body {
        font-family: Arial, sans-serif;
    }
    #search-form {
        margin: 20px;
    }
    #results {
        margin: 20px;
    }
    table {
	width: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
    margin-left: 20%; 
	}
 	th{
    border: 1px solid #444444;
    padding: 10px;
    width: 200px;
    background-color: #505BBD;
    color: white;
  	}
  	td {
    border: 1px solid #444444;
    padding: 10px;
    width: 300px;
  	}
  	input{
  	border: 0;
  	height: 30px;
  	width: 250px;
  	}
  	button{
  	width: 100px;
  	height: 40px;
  	font-size: 25px;
  	background-color: #505BBD;
  	color: white;
  	border: none;
  	}
</style>
</head>
<body>
	<div id="mydiv">
		<jsp:include page="../admin_main/header.jsp"></jsp:include>
	</div>	
		<section>
			<article style="width: 100%;">
				<div style="float: left; width: 100%; height: 300px;"><h1 style="text-align: center; font-size: 30px; margin-top: 150px;">상품등록 작성화면</h1></div>
			</article> 
		</section>
		<form action="">
				<table style="margin: auto; border: 1px solid;">
					<tr>
						<th>판매 상태</th>
						<td colspan="5"><span><input type="radio" name="ing" style="border: 0; height: 15px; width: 50px;">판매중</span>
						    <span><input type="radio" name="end" style="border: 0; height: 15px; width: 50px;">품절</span>
						</td>
					</tr>
					<tr>
						<th>상품명</th>
						<td colspan="5"><input type="text" name="name"></td>
					</tr>
					<tr>
						<th>정상가</th>
						<td><input type="text" name="regualr_price"></td>
						<th>할인</th>
						<td><input type="text" name="discount_price"></td>
						<th>판매가</th>
						<td><input type="text" name="sales_price"></td>	
					</tr>
					<tr>
						<th>판매 수량</th>
						<td colspan="5"><input type="text" name="salesq"></td>
					</tr>
					<tr>
						<th>재고 수량</th>
						<td colspan="5"><input type="text" name="invenq"></td>
					</tr>
					<tr>
						<th>등록일자</th>
						<td colspan="5"><input type="date" name="regdate"></td>
					</tr>
					<tr>
						<th>수정일자</th>
						<td colspan="5"><input type="date" name="moddate"></td>
					</tr>
					<tr>
						<th>이미지 등록</th>
						<td colspan="5"><input type="file" id="file_upload"></td> 
					</tr>
					<tr>
						<th>등록 유형</th>
						<td colspan="5"><span><input type="radio" name="ing" style="border: 0; height: 15px; width: 50px;">대표 이미지</span>
						    <span><input type="radio" name="end" style="border: 0; height: 15px; width: 50px;">개별 이미지</span>
						</td>
					</tr>
					
					
				</table>
			

	
    
    <!-- 하단 버튼 -->
		<div style="margin-bottom: 20%; margin-left: 40%;">
			<span style="float: left; margin-top: 80px; margin-right: 100px;">
				<button type="button" value="등록">등록</button>
			</span> <span style="float: left; margin-top: 80px; margin-right: 100px;">
				<button type="button" value="다시" onclick="location.href='/product_list.do'">목록</button>
			</span> <span style="float: left; margin-top: 80px; margin-right: 100px;">
				<button type="button" value="취소" style="background-color: #B5B5B5;">취소</button>
			</span>
		</div>
		</form>
		</div>
		
    
    
    
    <!-- footer -->
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
</body>
</html>