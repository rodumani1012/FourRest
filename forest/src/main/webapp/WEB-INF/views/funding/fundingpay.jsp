<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="kakaopay.do">
	<table border="1">
		<tr>
			<th>펀딩 제목</th>
			<td>${dto.funtitle }</td>
		</tr>
		<tr>
			<th>후원할 금액 입력</th>
			<td><input type="text" name="funmoney"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="후원하기"/>
				<input type="button" value="돌아가기" onclick="location.href='fundingdetail.do'">
			</td>
		</tr>
	</table>
	</form>

</body>
</html>