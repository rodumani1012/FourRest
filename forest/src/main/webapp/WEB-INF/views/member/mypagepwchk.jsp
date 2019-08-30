<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Forest</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#form").submit(function(){
			var pwchk = $("#pwchk").val();
			if(pwchk==""||pwchk==null){
				alert("비밀번호를 입력해주세요")
			}
		})
	})

</script>
<body>

<%@ include file="../header.jsp"%>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<div class="container d-flex justify-content-center">

	<form class="form-inline row" id="form" action="pwChange.do">
		<input class="form-control col-lg-9 mb-2 mr-sm-2" type="password" name="pwchk" id="pwchk">
		<button type="submit" class="btn btn-warning mb-2 col-lg-9">비밀번호 확인</button>
	</form>


</div>