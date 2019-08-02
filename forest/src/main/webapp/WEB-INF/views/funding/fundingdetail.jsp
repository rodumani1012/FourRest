<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form>
	<table border="1">
		<tr>
			<th>펀딩 제목</th>
			<td>${dto.funtitle }</td>
		</tr>
		<tr>
			<th>목표 모금액</th>
			<td>${dto.goalmoney }</td>
		</tr>
		<tr>
			<th>현재 모금액</th>
			<td>${dto.nowmoney }</td>
		</tr>
		<tr>
			<th>기간</th>
			<td>${dto.fundate }</td>
		</tr>
		<tr>
			<th>현재 참여 인원</th>
			<td>${dto.participants }</td>
		</tr>
		<tr>
			<th>펀딩 내용</th>
			<td>${dto.fun_content }</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" id="후원하기" onclick="location.href='fundingpay.do'"/>
				<input type="button" value="돌아가기" onclick="location.href='funlist.do'">
			</td>
		</tr>
	</table>
	</form>

</body>
</html>