<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Forest</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#pwForm").submit(function(){
			alert("오니?")
			var pw =$("#newPw").val();
			var pwchk = $("#newPwChk").val();
			if(pw != pwchk){
				alert("동일한 비밀번호를 입력하세요.")
				return false;
			}else{
				
			}
		})
	})

</script>
</head>
<body>

	<h1>pw 변경</h1>
	
	<form action="pwChangeConfirm.do" id="pwForm">
		<table border="1">
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
				<td><input type="submit" value="수정완료"></td>
				<td><input type="button" value="취소" onclick="location.href='main.do'"></td>
			</tr>
			
		</table>
	</form>

</body>
</html>