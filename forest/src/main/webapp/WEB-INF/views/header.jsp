<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--Google Font link-->
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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<link rel="stylesheet" href="resources/assets/css/slick.css">
<link rel="stylesheet" href="resources/assets/css/slick-theme.css">
<link rel="stylesheet" href="resources/assets/css/animate.css">
<link rel="stylesheet" href="resources/assets/css/fonticons.css">
<link rel="stylesheet" href="resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/assets/css/bootstrap.css">
<link rel="stylesheet" href="resources/assets/css/magnific-popup.css">
<link rel="stylesheet" href="resources/assets/css/bootsnav.css">

<!--For Plugins external css-->
<!--<link rel="stylesheet" href="assets/css/plugins.css" />-->

<!--Theme custom css -->
<link rel="stylesheet" href="resources/assets/css/style.css">
<!--<link rel="stylesheet" href="assets/css/colors/maron.css">-->

<!--Theme Responsive css-->
<link rel="stylesheet" href="resources/assets/css/responsive.css" />
<style type="text/css">
.dropdown:hover>.dropdown-menu {
	display: block;
	margin: 0;
}
</style>
</head>
<body>
	<nav
		class="navbar navbar-expand-lg  navbar-fixednavbar navbar-expand-lg  navbar-fixed white bootsnav on no-full">
		<div class="container">
			<!-- Start Header Navigation -->
			<div class="navbar-header">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbar-menu">
					<span></span> 
					<span></span> 
					<span></span>
				</button>
				<a class="navbar-brand" href="main.do"> <img
					src="resources/assets/images/logo2.jpg" class="logo logo-scrolled"
					alt="logo">
				</a>
			</div>
			<!-- End Header Navigation -->
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="navbar-menu">
				<ul class="navbar-nav navbar-right">
					<li><button type="button" class="btn btn-link text-dark"
							onclick="location.href='gotomap.do'">Map</button></li>
					<li><button type="button" class="btn btn-link text-dark"
							onclick="location.href='calendar.do'">Calendar</button></li>
					<li><button type="button" class="btn btn-link text-dark"
							onclick="location.href='chat.do'">문의하기</button></li>
					<li><button type="button" class="btn btn-link text-dark"
							onclick="location.href='admin.do'">관리자</button></li>
					<li><button type="button" class="btn btn-link text-dark"
							onclick="location.href='site.do'">sitelist</button></li>
					<li>
						<div class="dropdown">
							<button type="button"
								class="text-dark btn btn-link dropdown-toggle"
								data-toggle="dropdown">save</button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="funlist.do">후원하기</a> <a
									class="dropdown-item" href="ani_shelterList.do">보호소</a> <a
									class="dropdown-item" href="ani_endangeredList.do">멸종위기종</a> <a
									class="dropdown-item"
									href="ani_alien.do?board=animal_alien_disturb&txt_search=">외래생물</a>
								<a class="dropdown-item" href="trash.do">쓰레기</a>
							</div>
						</div>
					</li>
					<li>
						<div class="dropdown">
							<button type="button"
								class="text-dark btn btn-link dropdown-toggle"
								data-toggle="dropdown">board</button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="contest_main.do">공모게시판</a> <a
									class="dropdown-item" href="#portfolio">리뷰만들어야함</a>
							</div>
						</div>
					</li>
					<li>
						<div class="dropdown">
							<button type="button"
								class="text-dark btn btn-link dropdown-toggle"
								data-toggle="dropdown">content</button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="content.do">GAME</a> <a
									class="dropdown-item" href="youtube.do">YOUTUBE</a>
							</div>
						</div>
					</li>
					<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
					<li><sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal.username" var="user_id" />
							<input type="submit" class="btn btn-link text-dark"
								onclick="location.href='mypage.do'" value="${user_id }" />
						</sec:authorize> <sec:authorize access="isAnonymous()">
							<button type="button" class="btn btn-link text-dark"
								onclick="location.href='loginform.do'">LOGIN</button>
						</sec:authorize></li>
					<li><sec:authorize access="isAuthenticated()">
							<form:form action="${pageContext.request.contextPath}/logout"
								method="POST">
								<input type="submit" class="btn btn-link text-dark"
									value="LOGOUT" />
							</form:form>
						</sec:authorize></li>
					<li><sec:authorize access="isAnonymous()">
							<button type="button" class="btn btn-link text-dark"
								onclick="location.href='joinform.do'">JOIN</button>
						</sec:authorize></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
	</nav>
</body>
</html>