<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FOREST-LOGIN</title>
<!--Google Font link-->
<link rel="shortcut icon" href="">
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
<link rel="stylesheet" href="resources/assets/css/bootsnav.css">

<!--For Plugins external css-->
<!--<link rel="stylesheet" href="assets/css/plugins.css" />-->

<!--Theme custom css -->
<link rel="stylesheet" href="resources/assets/css/style.css">
<!--<link rel="stylesheet" href="assets/css/colors/maron.css">-->

<!--Theme Responsive css-->
<link rel="stylesheet" href="resources/assets/css/responsive.css" />

</head>
<body data-spy="scroll" data-target=".navbar-collapse">

<%@ include file="../header.jsp" %>

	<div class="culmn">


		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br>
		<div class="container text-center">
			<h1>[ THE FOREST ]</h1>
			<br>
			<h3>LOGIN</h3>
			<c:url value="/login" var="loginUrl" />
			<form:form name="f" action="${loginUrl}" method="POST">
				<c:if test="${param.error != null}">
					<p>아이디와 비밀번호가 잘못되었습니다.</p>
				</c:if>
				<div class="form-group">
					<label for="username">ID : </label>
					<div class="row justify-content-center">
						<input type="text" class="form-control col-sm-3" id="id" name="id">
					</div>
				</div>
				<div class="form-group">
					<label for="password">Password : </label>
					<div class="row justify-content-center">
						<input type="password" class="form-control col-sm-3" id="password"name="password">
					</div>
				</div>
				<div class="form-group form-check">
					<label class="form-check-label"> 
					<input class="form-check-input" type="checkbox"> Remember me
					</label>
				</div>
				<button type="submit" class="btn btn-success">LOGIN</button>
			</form:form>
			<div class="form-group">
				<label><a href="idpwfind.do" class="text-dark">아이디 비밀번호 찾기</a></label>
			</div>
		</div>
		
		
	</div>
</body>
</html>