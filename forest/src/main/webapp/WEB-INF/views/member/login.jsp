<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
	<div class="culmn">
	<nav
			class="navbar navbar-light navbar-expand-lg  navbar-fixednavbar navbar-expand-lg  navbar-fixed white bootsnav on no-full">
			<!-- Start Top Search -->
			<div class="top-search">
				<div class="container">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-search"></i></span>
						<input type="text" class="form-control" placeholder="Search">
						<span class="input-group-addon close-search"><i
							class="fa fa-times"></i></span>
					</div>
				</div>
			</div>
			<!-- End Top Search -->
			<div class="container">
				<!-- Start Header Navigation -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggler" data-toggle="collapse"
						data-target="#navbar-menu">
						<span></span> <span></span> <span></span>
					</button>

					<a class="navbar-brand" href="main.do"><img
						src="resources/assets/images/logo2.jpg" class="logo logo-scrolled" alt="logo">
					</a>
				</div>
				<!-- End Header Navigation -->
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="navbar-menu">
					<ul class="nav navbar-nav navbar-right" data-in="fadeInDown"
						data-out="fadeOutUp">
						<li><button type="button" class="btn btn-link text-dark" onclick="location.href='#hello'">About us</button></li>
						<li><button type="button" class="btn btn-link text-dark" onclick="location.href='#about'">Map</button></li>
						<li><button type="button" class="btn btn-link text-dark" onclick="location.href='sponsor.do'">Sponsor</button></li>
						<li><button type="button" class="btn btn-link text-dark" onclick="location.href='#portfolio'">review</button></li>
						<li><button type="button" class="btn btn-link text-dark" onclick="location.href='#pricing'">Pricing</button></li>
						<li><button type="button" class="btn btn-link text-dark" onclick="location.href='#blog'">Blog</button></li>
						<li><button type="button" class="btn btn-link text-dark" onclick="location.href='#contact'">Contact</button></li>
						<li><button type="button" class="btn btn-link text-dark" onclick="location.href='ani_shelterList.do'">보호소</button></li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li>
						<sec:authorize access="isAnonymous()">
						<button type="button" class="btn btn-link text-dark"onclick="location.href='<c:url value='loginform.do'/>'">LOGIN</button>
						</sec:authorize>	
						</li>
						<li>
						<sec:authorize access="isAuthenticated()">
								<form:form action="${pageContext.request.contextPath}/logout" method="POST">
								<input type="submit" class="btn btn-link text-dark" value="LOGOUT" />
							</form:form>
						</sec:authorize>
						</li>
						<li><button type="button" class="btn btn-link text-dark" onclick="location.href='joinform.do'">JOIN</button></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- Start Side Menu -->
			<div class="side bg-light">
				<a href="#" class="close-side"><i class="fa fa-times"></i></a>
				<div class="widget">
					<h6 class="title">Custom Pages</h6>
					<ul class="link">
						<li><a href="#hello">About us</a></li>
						<li><a href="#about">Map</a></li>
						<li><a href="sponsor.do">Sponsor</a></li>
						<li><a href="#portfolio">review</a></li>
						<li><a href="#">Portfolio</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
				</div>
				<div class="widget">
					<h6 class="title">Additional Links</h6>
					<ul class="link">
						<li><a href="#">Retina Homepage</a></li>
						<li><a href="#">New Page Examples</a></li>
						<li><a href="#">Parallax Sections</a></li>
						<li><a href="#">Shortcode Central</a></li>
						<li><a href="#">Ultimate Font Collection</a></li>
					</ul>
				</div>
			</div>
			<!-- End Side Menu -->
		</nav>

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
					<label class="form-check-label"> <input
						class="form-check-input" type="checkbox"> Remember me
					</label>
				</div>
				<button type="submit" class="btn btn-success">Sponsor</button>
			</form:form>
		</div>
	</div>
</body>
</html>