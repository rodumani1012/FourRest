<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="../header.jsp"%>

	<div class="culmn">
		<br> <br> <br> <br> <br> <br>
		<div class="ima container text-center">
			<form class="image" action="memberInsert.do" id="form">
				<div class="form-group">
					<label for="text">ID : </label>
					<div class="row justify-content-center">
						<input type="text" class="form-control col-sm-3" id="id" title="n" name="id" readonly="readonly">
					</div>
					</div>
					<div class="form-group">
						<label for="pwd">Password : </label>
						<div class="row justify-content-center">
							<input type="password" class="form-control col-sm-3" id="pw" name="pw" title="n" name="pw">
						</div>
					</div>
					<div class="form-group">
						<div class="row justify-content-center">
							<input type="password" class="form-control col-sm-3" id="pwchk" name="pwchk"
								onkeyup="chkpw()" title="n">
						</div>
					</div>
					<div class="form-group">
						<label for="pwd">NAME : </label>
						<div class="row justify-content-center">
							<input type="password" class="form-control col-sm-3" id="pw" name="pw" title="n" name="pw">
						</div>
					</div>
					<div id="pwval">암호를 입력하세요</div>
					<div class="form-group">
						<label for="addr">Address : </label>
					</div>
					<div class="form-group">
						<div class="row justify-content-center">
							<input type="text" class="form-control col-sm-3" id="addr" onclick="javascript:addpop()"
								name="addr">
						</div>
					</div>
					<div class="form-group">
						<div class="row justify-content-center">
							<input type="text" class="form-control col-sm-3" name="zonecode" id="zonecode"
								readonly="readonly" title="n">
						</div>
					</div>
					<div class="form-group">
						<div class="row justify-content-center">
							<input type="text" class="form-control col-sm-3" id="addrDetail" placeholder="상세주소를 입력해주세요">
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="phone">Phone : </label>
					<div class="row justify-content-center">
						<select class="form-control col-1" name="phone1">
							<option>010</option>
							<option>011</option>
							<option>017</option>
						</select>&nbsp;_&nbsp;<input type="text" class="form-control col-1" id="phone-mid"
							name="phone2">&nbsp;_&nbsp; <input type="text" class="form-control col-1" id="phone-back"
							name="phone3">
					</div>
				</div>
				<div class="form-group">
					<label for="phone">Email : </label>
					<div class="row justify-content-center">
						<input type="text" class="form-control col-2" id="emailName" name="emailName">&nbsp;@ <select
							class="form-control col-2" id="emailForm" name="emailForm">
							<option>daum.net</option>
							<option>naver.com</option>
							<option>gmail.com</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="row justify-content-center">
						<input type="button" class="btn btn-light" value="메일전송" id="emailAuth"><br>
					</div>
				</div>
				<div class="form-group">
					<div class="row justify-content-center">
						<input type="text" class="form-control col-2" placeholder="인증번호" id="emailNum" name="emailNum"
							title="n">
					</div>
			</form>
		</div>
		</div>
</body>
</html>