<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../header.jsp"%>	
	<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id" />
	</sec:authorize>
<div class="container form-horizontal table-responsive">
	<form action="fundingpay.do" method="post">
	<br><br><br><br><br><br>
		<div class="form-group form-group-lg form-inline">
			<input class="form-control form-control-lg" type="text" name="funtitle" value="${dto.funtitle }" readonly="readonly" />
		 </div>	
	<table class="table table-bordered">	
		<tr>
			<th>글번호</th>
			<td>${dto.goalmoney }</td>
		</tr>
		<tr>
			<th>작성 시간</th>
			<td>${dto.fun_content }</td>
		</tr>
		<tr>
			<th>ID</th>
			<td>${dto.nowmoney }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.fundate }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${dto.participants }</td>
		</tr>

		<tr>
		</tr>
	</table>
	</form>
</div>
</body>
</html>