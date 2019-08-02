<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>회원가입</h1>
	<form action="insertres.do" method="post">
		<table border="1">
			<tr>
				<th>펀딩 제목</th>
				<td><input type="text" name="funtitle"></td>
			</tr>
			<tr>
				<th>목표모금액</th>
				<td><input type="text" name="goalmoney"></td>
			</tr>
			<tr>
				<th>기간</th>
				<td><input type="text" name="fundate"></td>
			</tr>
			<tr>
				<th>펀딩 내용</th>
				<td><textarea rows="10" cols="60" name="fun_content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="펀딩등록">
				<input type="button" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>