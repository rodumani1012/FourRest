<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Forest</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
	function addpop() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.getElementById("addr").value = data.address;
				document.getElementById("zonecode").value = data.zonecode;
				document.getElementsByName("zonecode")[0].title = "y";
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
				// 예제를 참고하여 다양한 활용법을 확인해 보세요.
			}
		}).open();
	}
	function email() {
		var emailName = $("#emailName").val();
		var emailForm = $("#emailForm").val();
		return 'emailName=' + emailName + '&emailForm=' + emailForm
	}
	$(function () {

		$("#emailAuth").click(function () {
			if (emailName != null) {
				$.ajax({
					url: "mailSend.do?" + email(),
					method: 'post',
					datatype: 'text',
					success: function (msg) {
						var email = msg.email
						if (email == true) {
							alert("메일 전송 완료 했습니다.")
						}

					},
					error: function () {
						alert('통신실패')
					}
				})
			}
		})
	})
</script>

</head>
<body>


<%@ include file="../header.jsp"%>
<br><br><br><br><br>
<div class="container text-center">
	<form action="memberInsert.do" id="form">
	
		<input type="hidden" class="text" name="id" value="${id }" />
		<input type="hidden" class="text" name="pw" value="${name }" />
		<label for="text">NAME : </label>
		<div class="row justify-content-center">
			<input type="text" class="form-control col-sm-3" id="name" title="n"
				name="name">
		</div>
		<div class="form-group">
			<label for="addr">Address : </label>
		</div>
		<div class="form-group">
			<div class="row justify-content-center">
				<input type="text" class="form-control col-sm-3" id="addr"
					onclick="javascript:addpop()" name="addr">
			</div>
		</div>
		<div class="form-group">
			<div class="row justify-content-center">
				<input type="text" class="form-control col-sm-3" name="zonecode"
					id="zonecode" readonly="readonly" title="n">
			</div>
		</div>
		<div class="form-group">
			<div class="row justify-content-center">
				<input type="text" class="form-control col-sm-3" id="addrDetail"
					placeholder="상세주소를 입력해주세요">
			</div>
		</div>
		<div class="form-group">
			<label for="phone">Phone : </label>
			<div class="row justify-content-center">
				<select class="form-control col-1" name="phone1">
					<option>010</option>
					<option>011</option>
					<option>017</option>
				</select>&nbsp;_&nbsp;<input type="text" class="form-control col-1"
					id="phone-mid" name="phone2">&nbsp;_&nbsp; <input
					type="text" class="form-control col-1" id="phone-back"
					name="phone3">
			</div>
		</div>
		<div class="form-group">
			<label for="phone">Email : </label>
			<div class="row justify-content-center">
				<input type="text" class="form-control col-2" id="emailName"
					name="emailName">&nbsp;@ <select class="form-control col-2"
					id="emailForm" name="emailForm">
					<option>daum.net</option>
					<option>naver.com</option>
					<option>gmail.com</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<div class="row justify-content-center">
				<input type="button" class="btn btn-light" value="메일전송"
					id="emailAuth"><br>
			</div>
		</div>
		<div class="form-group">
			<div class="row justify-content-center">
				<input type="text" class="form-control col-2" placeholder="인증번호"
					id="emailNum" name="emailNum" title="n">
			</div>
		</div>
		<button type="submit" class="btn btn-success btn-lg">가입하기</button>

	</form>
</div>	
<script type="text/javascript">
		function emailNum() {
			var emailNum = documnet.getElementsByName('emailNum')[0].value;
			return 'email=' + emailNum
		}
		$(function () {
			$("#form").submit(function () {
				var name = document.getElementsByName("name")[0].title;
				var addr = document.getElementsByName("zonecode")[0].title;
				var phone = document.getElementsByName("phone3")[0].value;
				var email = document.getElementsByName("emailNum")[0].value;
				if (addr == "n") {
					alert("주소를 입력해주세요.")
					document.getElementsByName("addr")[0].focus();
					return false;
				} else if (phone == null || phone == "") {
					alert("핸드폰 번호를 입력 하세요.")
					document.getElementsByName("phone2")[0].focus();
					return false;
				} else if (email == null || email == "") {
					alert("인증번호를 입력하세요.")
					document.getElementsByName("emailNum")[0].focus();
					return false;
				} else if(name ==null || email ==""){
					alert("이름을 입력하세요.")
					document.getElementsByName("name")[0].focus();
					return false;
				} else if (recaptcha == null || recaptcha ==""){
					alert("자동방지 봇을 확인 하세요")
					return false;
				} else {

				}

			})
		})
	</script>

</body>
</html>