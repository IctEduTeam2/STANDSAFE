<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오용 로그인</title>

</head>
<body>
	<div>
		<header>
			<h1>개인 정보</h1><a>${nickName }</a><a>${email }</a><a>${birthday }</a>
		</header>
		<article>
			<c:choose>
				<c:when test="${emailMatches }">
					<!-- 서버의 이메일이 일치하는 경우 -->
					<a>${session..nickName }</a><a>${email }</a><a>${birthday }</a>
					<p>자동 로그인 되었습니다.</p>
				</c:when>
				<c:otherwise>
					<!-- 이메일이 일치하지 않는 경우 회원가입 -->
					<form>
						<a>${nickName }</a><a>${email }</a><a>${birthday }</a>
					</form>

				</c:otherwise>
			</c:choose>
		</article>
	</div>
</body>
</html>