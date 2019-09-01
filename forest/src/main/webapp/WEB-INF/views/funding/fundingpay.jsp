<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Forest</title>
</head>
<body>

	<%@ include file="../header.jsp"%>
	<br><br><br><br><br><br>	
<div class="container table-responsive d-flex justify-content-center">
	<br><br><br><br><br><br><br>
	<form action="kakaopay.do" method="get">
	<table class="table row">
		<tr>
			<th>후원 제목</th>
			<td><input class="col-sm-12 form-control" type="text" name="funtitle" value="${funtitle }" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>후원할 금액 입력</th>
			<td><input class="col-sm-12 form-control" type="text" name="funmoney"></td>
		</tr>
		<tr>
			<td colspan="2">
				<button class="btn btn btn-light" type="submit">후원하기</button>
				<button class="btn btn btn-light" type="button" onclick="location.href='fundingdetail.do'">돌아가기</button>
			</td>
		</tr>
	</table>
	</form>
</div>
</body>
</html>