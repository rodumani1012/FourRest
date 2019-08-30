<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Forest</title>
</head>
<body>
<%@ include file="../header.jsp"%>
	<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id" />
	</sec:authorize>
	<br><br><br><br><br>
	<h1 class="text-center">후원등록하기</h1>
<div class="container d-flex justify-content-center">
	<form action="insertres.do" method="post">
		<table class="table row d-flex justify-content-center">
			<tr>
				<th>펀딩 제목</th>
				<td><input class="form-control col-md-5" type="text" name="funtitle"></td>
			</tr>
			<tr>
				<th>목표모금액</th>
				<td><input class="form-control col-md-9" type="text" name="goalmoney"></td>
			</tr>
			<tr>
				<th>기간</th>
				<td><input class="form-control col-md-9" type="text" name="fundate"></td>
			</tr>
			<tr>
				<th>펀딩 내용</th>
				<td><textarea class="form-control col-md-9" rows="10" cols="60" name="fun_content"></textarea></td>
			</tr>
		</table>
			<input type="hidden" name="fun_id" value=${user_id }>
			<input type="submit" value="펀딩등록">
			<input type="button" value="취소" onclick="location.href='main.do'">
	</form>
</div>	
</body>
</html>