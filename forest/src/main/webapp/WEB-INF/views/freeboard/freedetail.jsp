<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
	
<div class="container form-horizontal table-responsive">
	<form>
		<br><br><br><br><br><br>
		<table class="table table-bordered">	
			<tr>
				<th>글번호</th>
				<td>${dto.free_seq }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><fmt:formatDate value="${dto.free_date }" pattern="yyyy-MM-dd HH:MM"/></td>
			</tr>
			<tr>
				<th>ID</th>
				<td>${dto.id }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${dto.title }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${dto.content }</td>
			</tr>
	
		</table>
	
		<c:if test="${user_id == dto.id }">
			<button class="btn btn btn-light" type="button" onclick="location.href='freeupdate.do?free_seq=${dto.free_seq}'">수정하기</button> 
			<button class="btn btn btn-light" type="button" onclick="location.href='freedelete.do?free_seq=${dto.free_seq}'">삭제하기</button>
		</c:if>
	</form>
	
	<br/><br/><br/>
	
		<table class="table table-bordered">
			<%@ include file="freecomment.jsp"%>
		</table>


	
	
	
</div>
</body>
</html>