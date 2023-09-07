<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Error Page</title>
</head>
<body>
	 <h1>무언가 문제가 생겼습니다!</h1>
    <p>에러 코드: <%= exception.getClass().getName() %></p>
    <p>에러메세지: <%= exception.getMessage() %></p>
    <p>스택 추적:</p>
    <pre><%= exception.getStackTrace() %></pre>
</body>
</html>