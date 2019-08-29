<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THE FOREST:비밀번호변경</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#pwForm").submit(function() {
			alert("오니?")
			var pw = $("#newPw").val();
			var pwchk = $("#newPwChk").val();
			if (pw != pwchk) {
				alert("동일한 비밀번호를 입력하세요.")
				return false;
			} else {

			}
		})
	})
</script>
<style type="text/css">
.row {
	width: 1200px;
	margin: 0 auto;
}

.row table {
	width: 400px;
	margin: 0px 20px;
}

h1 {
	margin-bottom: 200px;
}
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<h1 class="text-center" style="margin-bottom: 200px;">pw 변경</h1>
	<div class="container">
		<div class="row justify-content-center">
			<form action="pwChangeConfirm.do" id="pwForm">
				<table class="table table-bordered col-sm-3">
					<tr>
						<td>현재 비밀번호</td>
						<td><input type="password" name="pw"></td>
					</tr>
					<tr>
						<td>변경할 비밀번호</td>
						<td><input type="password" name="newPw" id="newPw"></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" name="newPwChk" id="newPwChk"></td>
					</tr>
					<tr>
						<td><button class="btn btn-outline-dark" type="submit">수정완료</button></td>
						<td><button class="btn btn-outline-dark" type="button"
								onclick="location.href='main.do'">취소</button></td>
					</tr>

				</table>
			</form>
		</div>
	</div>
</body>
</html>