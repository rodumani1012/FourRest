<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id" />
	</sec:authorize>


<form action="commentinsert.do" method="post">
	<table class="table table-bordered">
		<tr>
			Comment
			<input type="hidden" name="free_seq" value="${dto.free_seq }"/>
			<input type="hidden" name="user_id" value="${user_id }"/>
			<td><textarea rows="10" cols="30" name="content" style="width: 650px; height: 100px;">내용을 입력하세요.</textarea></td>
			<td colspan="2">
				<button class="btn btn btn-light" type="submit" value="작성" >작성</button>
			</td>
		</tr>
	</table>
</form>

<form>
	<table class="table table-bordered">
		<c:forEach items="${list }" var="dto">
			<tr>
				<td style="width: 150px; height: 100px;">${dto.comm_id }</td>
				<td style="width: 400px; height: 100px;">${dto.comm_content }</td>
				<td style="width: 150px; height: 100px;">${dto.comm_date }</td>
				<td style="width: 60px; height: 100px;">
				<c:if test="${user_id ==  dto.comm_id}">
					<input class="btn btn btn-light" type="button" value="삭제" onclick="location.href='commdelete.do?comm_seq=${dto.comm_seq }&free_seq=${dto.comm_freeseq }'"/>
				</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>>
</form>

</body>
</html>