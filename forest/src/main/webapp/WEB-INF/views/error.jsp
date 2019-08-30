<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.errorimg{
		margin-top: 50px;
		width: 200px;
		height: 200px;
	}
	.error{
		text-align: center;
	}
</style>
</head>
<body>

<div class="error">
	<div>
		<img class="errorimg" alt="에러이미지" src="resources/assets/images/error.png">
	</div>
	
	<c:choose>
		<c:when test="${kind eq Throwable }">
			<h1>Throwable 에러</h1>
		</c:when>
		<c:when test="${kind eq Exception }">
			<h1>Exception 에러</h1>
		</c:when>
		<c:when test="${kind eq 400 }">
			<h1>400</h1>
		</c:when>
		<c:when test="${kind eq 403 }">
			<h1>403</h1>
		</c:when>
		<c:when test="${kind eq 404 }">
			<h1>404</h1>
		</c:when>
		<c:when test="${kind eq 405 }">
			<h1>405</h1>
		</c:when>
		<c:when test="${kind eq 500 }">
			<h1>500</h1>
		</c:when>
		<c:when test="${kind eq 503 }">
			<h1>503</h1>
		</c:when>
		<c:otherwise>
			<h1>무슨 에러지?</h1>
		</c:otherwise>
	</c:choose>
	
	<div>
		<h2>요청하신 페이지를 찾을 수 없습니다.</h2>
	</div>
	<div>
		<p>일시적인 오류로 인해 해당 기능을 사용할 수 없습니다.</p>
		<p>잠시 후 다시 시도해 주십시오.</p>
	</div>
</div>
	
</body>
</html>