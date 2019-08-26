<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway:400,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="resources/assets/css/slick.css">
<link rel="stylesheet" href="resources/assets/css/slick-theme.css">
<link rel="stylesheet" href="resources/assets/css/animate.css">
<link rel="stylesheet" href="resources/assets/css/fonticons.css">
<link rel="stylesheet" href="resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/assets/css/bootstrap.css">
<link rel="stylesheet" href="resources/assets/css/magnific-popup.css">
<link rel="stylesheet" href="resources/assets/css/bootsnav.css">

<link rel="stylesheet" href="resources/assets/css/style.css">

<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>


<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
<script src="dist/lang/summernote-ko-KR.js"></script>
<style type="text/css">
body {
	width: "100%";
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('.summernote').summernote({
			height : 400

		});
	});
</script>

</head>
<body>

	
	<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id" />
	</sec:authorize>
	
		<div class="container">

			<form:form action="freeinsertres.do" modelAttribute="FreeboardDto" method="post">
						<input type="hidden" name="id" value="${user_id }">
				<table class="d-flex justify-content-center">
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" style="width: 650px" /></td>
					</tr>
					<tr>
						<th></th>
						<td></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="30" class="summernote" name="content" style="width: 650px; height: 350px;"></textarea></td>
					</tr>
					<tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="등록" /> 
							<input type="button" value="작성 취소" onclick="location.href='freeboardlist.do'" />
						</td>
					</tr>
				</table>
			</form:form>
		</div>

</body>
</html>