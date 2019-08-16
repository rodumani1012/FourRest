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
			$("#emailFormWrite").show();
		}
	}
	

</script>
</head>
<body>

	<form action="findIdConfirm.do">
			<div class="form-group">
				<label for="text">NAME : </label>
				<div class="row justify-content-center">
					<input type="text" class="form-control col-sm-3" id="name"
						title="n" name="name">
				</div>
			</div>
			<label for="phone">Email : </label>
			<div class="row justify-content-center">
				<input type="text" class="form-control col-2" id="emailName"
					name="emailName">&nbsp;@ 
					<input type="text" class="form-control col-2" id="emailFormWrite" name="emailFormWrite" style="display: none">
					<select class="form-control col-2" id="emailForm" name="emailForm" onclick="writeEmail()">
					<option>daum.net</option>
					<option>naver.com</option>
					<option>gmail.com</option>
					<option>직접 입력</option>
				</select>
			</div>
			<button type="submit" class="btn btn-success btn-lg">전송하기</button>
	</form>

</body>
</html>