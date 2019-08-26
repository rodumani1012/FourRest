<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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

	<form action="calinsertres.do" method="post">
		<table border="1">
			<tr>
				<th>봉사 제목</th>
				<td><input type="text" name="caltitle"></td>
			</tr>
			<tr>
				<th>봉사 모집 기간</th>
				<td><input type="text" name="calrecdate"></td>
			</tr>
			<tr>
				<th>봉사 활동 기간</th>
				<td><input type="text" name="calvolundate"></td>
			</tr>
			<tr>
				<th>봉사 내용</th>
				<td><textarea rows="10" cols="60" name="calcontent"></textarea></td>
			</tr>
			<tr>
				<th>모집 인원</th>
				<td><input type="text" name="calrecpeo"></td>
			</tr>
			<input type="hidden" name="calid" value=${user_id }>
			<tr>
				<td colspan="2">
				<input type="submit" value="봉사등록">
				<input type="button" value="취소" onclick="location.href='calendar.do'"></td>
			</tr>
		</table>
	</form>
</body>
</html>