<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Forest</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function chkpw() {
		var pw = $("#pw").val();
		var pwchk = $("#pwchk").val();
		if (pw != pwchk) {
			document.getElementById("pwval").innerHTML = '동일한 암호를 입력하세요.'
		} else {
			document.getElementById("pwval").innerHTML = '동일한 암호 입니다.'
			document.getElementsByName("pwchk")[0].title = "y";
		}
	}
</script>

</head>
<body>
	<form action="changePw.do">
		<div class="form-group" id="form">
			<label for="pwd">Password : </label>
			<div class="row justify-content-center">
				<input type="password" class="form-control col-sm-3" id="pw"
					name="pw" title="n" name="pw">
			</div>
		</div>
		<div class="form-group">
			<div class="row justify-content-center">
				<input type="password" class="form-control col-sm-3" id="pwchk"
					name="pwchk" onkeyup="chkpw()" title="n">
			</div>
		</div>
		<div id="pwval">암호를 입력하세요</div>
		<button>확인</button>
	</form>
</body>
</html>