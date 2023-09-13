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
</style>
</head>
<body>
	<body>
    <h1>상품 등록</h1>
    
    <form id="search-form">
        <label for="search-keyword">상품 검색:</label>
        <input type="text" id="search-keyword" name="search-keyword" placeholder="상품 이름을 입력하세요">
        <hr>
        <label for="date-filter">등록일 검색:</label>
        <input type="date" id="date-filter" name="date-filter">
        
        <button type="button" id="search-button">검색</button>
    </form>
    
    <div id="results">
        <!-- 검색 결과가 여기에 나타날 것입니다. -->
    </div>
    
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
    <script>
        // 검색 버튼 클릭 시 실행될 함수
        document.getElementById('search-button').addEventListener('click', function() {
            const keyword = document.getElementById('search-keyword').value;
            const date = document.getElementById('date-filter').value;
            
            // 여기에서 검색 및 결과 표시 로직을 구현합니다.
            // 이 예시에서는 결과를 단순히 results 엘리먼트에 텍스트로 표시합니다.
            const resultsElement = document.getElementById('results');
            resultsElement.innerHTML = `검색어: ${keyword}<br>등록일: ${date}`;
        });
    </script>
</body>
</html>