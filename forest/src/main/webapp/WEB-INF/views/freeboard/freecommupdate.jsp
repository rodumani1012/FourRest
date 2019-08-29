<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Forest</title>
</head>
<body>

	<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id" />
	</sec:authorize>

<form action="commupdateres.do" method="post">
	<table class="table table-bordered">
		<c:forEach items="${list }" var="dto">
			<tr>
				<td style="width: 150px; height: 100px;">${dto.comm_id }</td>
				<td style="width: 400px; height: 100px;">
					<textarea rows="10" cols="30" name="content">${dto.comm_content }</textarea>
				</td>
				<td style="width: 150px; height: 100px;">${dto.comm_date }</td>
				<td style="width: 60px; height: 100px;">
				<input type="submit" value="수정 완료"/>
				</td>
			</tr>
		</c:forEach>
	</table>>
</form>

</body>
</html>