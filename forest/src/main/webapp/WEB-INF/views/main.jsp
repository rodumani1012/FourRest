<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->

<!--Designerd by: http://bootstrapthemes.co-->

<head>
<meta charset="UTF-8">
<title>THE FOREST</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" href="resources/assets/images/favicon.ico?v=2"
	type="image/x-icon">
<link rel="shortcut icon" href="resources/assets/images/favicon.ico?v=2"
	type="image/x-icon">
<script type="text/javascript" src="resources/assets/js/main-style.js"></script>
</head>
<!-- ${requestScope['javax.servlet.forward.context_path']} -->
<body data-spy="scroll" data-target=".navbar-collapse">

	<!-- Preloader -->
	<%@ include file="./header.jsp"%>

	<!-- 시작시 빨간 화면 -->
	<div id="loading">
		<div id="loading-center">
			<div id="loading-center-absolute">
				<div class="object" id="object_one"></div>
				<div class="object" id="object_two"></div>
				<div class="object" id="object_three"></div>
				<div class="object" id="object_four"></div>
			</div>
		</div>
	</div>
	<!--End -->
	<div class="culmn">
		<!--Home page style-->
		<%@ include file="./header.jsp"%>
		<!-- 메인페이지  -->
		<!--슬라이드 쇼 -->
		<div class="container-fluid">
			<div id="demo" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ul class="carousel-indicators">
					<li data-target="#demo" data-slide-to="0" class="active"></li>
					<li data-target="#demo" data-slide-to="1"></li>
					<li data-target="#demo" data-slide-to="2"></li>
					<li data-target="#demo" data-slide-to="3"></li>
					<li data-target="#demo" data-slide-to="4"></li>
					<li data-target="#demo" data-slide-to="5"></li>
				</ul>
				<!-- 슬라이드 쇼 사진  -->
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="img-responsive"
							src="resources/assets/images/background/1.jpg" alt="animal"
							style="max-width: 100%; height: auto; display: block;">
					</div>
					<div class="carousel-item">
						<img class="img-responsive"
							src="resources/assets/images/background/2.jpg" alt="animal"
							style="max-width: 100%; height: auto; display: block;">
					</div>
					<div class="carousel-item">
						<img class="img-responsive"
							src="resources/assets/images/background/4.jpg" alt="animal"
							style="max-width: 100%; height: auto; display: block;">
					</div>
					<div class="carousel-item">
						<img class="img-responsive"
							src="resources/assets/images/background/3.jpg" alt="animal"
							style="max-width: 100%; height: auto; display: block;">
					</div>
					<div class="carousel-item">
						<img class="img-responsive"
							src="resources/assets/images/background/6.jpg" alt="animal"
							style="max-width: 100%; height: auto; display: block;">
					</div>
					<div class="carousel-item">
						<img class="img-responsive"
							src="resources/assets/images/background/5.jpg" alt="animal"
							style="max-width: 100%; height: auto; display: block;">
					</div>
				</div>
				<!-- 슬라이드 쇼 버튼 -->
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a> <a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>

			</div>
		</div>
		<!-- 슬라이드쇼 끝  -->
		<!-- 후원금은 어디에 사용 되나요? -->
		<div class="container text-center">
			<img src="resources/assets/images/ss.png" alt="후원금 사용내역">
		</div>
		<!-- 게스트board -->
		<div class="container text-center">
			<img src="resources/assets/images/fprojects/board.png"
				alt="게시판으로 이동!">
		</div>

		<!-- 후원 및 봉사 사진 넣는 부분 -->
		<div class="featured_slider">
			<div>
				<div class="featured_img">
					<img src="resources/assets/images/fprojects/wor1.jpeg" alt="" /> <a
						href="resources/assets/images/fprojects/wor1.jpeg"
						class="popup-img"></a>
				</div>
			</div>
			<div>
				<div class="featured_img">
					<img src="resources/assets/images/fprojects/wor2.jpeg" alt="" /> <a
						href="resources/assets/images/fprojects/wor2.jpeg"
						class="popup-img"></a>
				</div>
			</div>
			<div>
				<div class="featured_img">
					<img src="resources/assets/images/fprojects/wor3.jpeg" alt="" /> <a
						href="resources/assets/images/fprojects/wor3.jpeg"
						class="popup-img"></a>
				</div>
			</div>
			<div>
				<div class="featured_img">
					<img src="resources/assets/images/fprojects/wor1.jpeg" alt="" /> <a
						href="resources/assets/images/fprojects/wor1.jpeg"
						class="popup-img"></a>
				</div>
			</div>
			<div>
				<div class="featured_img">
					<img src="resources/assets/images/fprojects/wor2.jpeg" alt="" /> <a
						href="resources/assets/images/fprojects/wor2.jpeg"
						class="popup-img"></a>
				</div>
			</div>
		</div>
		<!-- End off Impress section-->
		<section class="portfolio lightbg">
			<div class="container">
				<div class="row">
					<div class="main_portfolio roomy-100">
						<div class="row">
							<div class="portfolio_content">
								<div class="col-md-8">
									<div class="row">
										<div class="col-md-12"></div>
										<div class="col-md-6 m-top-30"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--End off row -->
			</div>
			<!--End off container -->
		</section>
		<!-- 스크롤 업 -->
		<div class="scrollup">
			<a href="#"><i class="fa fa-chevron-up"></i></a>
		</div>
		<!-- End off scroll up -->
	</div>
	<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id" />
	<button class="botton" onclick="toggleChat()">
		<i class='fas fa-comment-dots'></i>
	</button>
	<div id="chat"
		style="display: none; position: fixed; bottom: 50PX; right: 86PX; z-index: 9999">
		<div id="chat_box">
			<ul id="#messages"></ul>
		</div>
		<div class="test">	
 			<iframe class="iframe-chat" src="http://192.168.10.158:8880?id=${user_id }" style="overflow-x: hidden"></iframe>
		</div>
	</div>
	</sec:authorize>


	<!-- footer -->
	<%@ include file="./footer.jsp"%>
	<!-- JS includes -->

	<script src="resources/assets/js/vendor/jquery-1.11.2.min.js"></script>
	<script src="resources/assets/js/vendor/popper.min.js"></script>
	<script src="resources/assets/js/vendor/bootstrap.min.js"></script>

	<script src="resources/assets/js/jquery.magnific-popup.js"></script>
	<script src="resources/assets/js/jquery.easing.1.3.js"></script>
	<script src="resources/assets/js/slick.min.js"></script>
	<script src="resources/assets/js/jquery.collapse.js"></script>
	<script src="resources/assets/js/bootsnav.js"></script>

	<script src="resources/assets/js/gmaps.min.js"></script>
	<script src="resources/assets/js/plugins.js"></script>
	<script src="resources/assets/js/main.js"></script>

</body>
</html>