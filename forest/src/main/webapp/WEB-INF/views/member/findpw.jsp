<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	
	function writeEmail(){
		var select = $("#emailForm").val();
		if(select=="직접 입력"){
			$("#emailFormWrite").css('background','white');
			document.getElementById("emailFormWrite").value="";
			$("#emailFormWrite").attr("readonly",false);
		}else{
			document.getElementById("emailFormWrite").value=select;
		}
	}
	function email() {
		var id = $("#id").val();
		var emailName = $("#emailName").val();
		var emailForm = $("#emailFormWrite").val();
		return 'id='+id+'&emailName=' + emailName + '&emailForm=' + emailForm
	}
	
	$(function () {

		$("#emailAuth").click(function () {
			if (emailName != null) {
				$.ajax({
					url: "mailSendPw.do?" + email(),
					method: 'post',
					datatype: 'text',
					success: function (msg) {
						var email = msg.email
						if (email == true) {
							alert("메일 전송 완료 했습니다.")
						}else if(email==false){
							alert("메일 전송 실패!")
						}

					},
					error: function () {
						alert("아이디나 이메일을 확인하세요.")
					}
				})
			}
		})
	})
	

</script>
</head>
<body>

	<form action="findPwConfirm.do" id="idForm">
		<div class="form-group">
			<label for="text">ID : </label>
			<div class="row justify-content-center">
				<input type="text" class="form-control col-sm-3" id="id" title="n"
					name="id">
			</div>
		</div>
		<label for="phone">Email : </label>
		<div class="row justify-content-center">
			<input type="text" class="form-control col-2" id="emailName"
				name="emailName">&nbsp;@ <input type="text"
				class="form-control col-2" id="emailFormWrite" name="emailFormWrite"
				readonly="readonly" style="background: gray;"> <select
				class="form-control col-2" id="emailForm" name="emailForm"
				onclick="writeEmail()">
				<option>daum.net</option>
				<option>naver.com</option>
				<option>gmail.com</option>
				<option>직접 입력</option>
			</select>
		</div>
		<input type="button" class="btn btn-light" value="메일전송" id="emailAuth"><br>
		<div class="form-group">
			<label for="text">인증번호 : </label>
			<div class="row justify-content-center">
				<input type="text" class="form-control col-sm-3" id="number" title="n"
					name="number">
			</div>
		</div>
		<button type="submit" class="btn btn-success btn-lg">확인</button>
	</form>

</body>
</html>