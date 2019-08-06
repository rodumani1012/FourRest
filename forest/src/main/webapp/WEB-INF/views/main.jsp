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
	 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

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
<script
	src="resources/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>

<style>
/* Make the image fully responsive */
.carousel-inner img {
	width: 100%;
	height: 100%;
}
.test{
	width: 800px;
	height: 800px;
}
.iframe-chat{
	width: 600px;
	height: 600px;
}
</style>
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
						<img src="resources/assets/images/background/1.jpg" alt="trash"
							style="height: 800px;">
					</div>
					<div class="carousel-item">
						<img src="resources/assets/images/background/2.jpg" alt="smoking"
							style="height: 800px;">
					</div>
					<div class="carousel-item">
						<img src="resources/assets/images/background/3.jpg" alt="animal"
							style="height: 800px;">
					</div>
					<div class="carousel-item">
						<img src="resources/assets/images/background/4.jpg" alt="animal"
							style="height: 800px;">
					</div>
					<div class="carousel-item">
						<img src="resources/assets/images/background/5.jpg" alt="animal"
							style="height: 800px;">
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
		<div id="chat_box">
		<ul id="#messages"></ul>
		</div>
		<div class="test">
			<div class="modal-top">
				<div id="modal-title">고객센터</div>
				<span></span>
			</div>
			<a href="#" class="button-modal-close" onclick="closeChat()">X</a>
<!-- 			<iframe class="iframe-chat" src="http://192.168.220.22:8880/"></iframe> -->
		</div>
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
		<!-- ㅅ크롤 업 -->
		<div class="scrollup">
			<a href="#"><i class="fa fa-chevron-up"></i></a>
		</div>
		<!-- End off scroll up -->
	</div>

	<!-- footer -->
	<footer id="footer" class="footer bg-black">
		<div class="container">
			<div class="row">
				<div class="main_footer text-center p-top-40 p-bottom-30">
					<p class="wow fadeInRight" data-wow-duration="1s">
						Made with <i class="fa fa-heart"></i> by <a target="_blank"
							href="https://bootstrapthemes.co">THE FOREST</a> 2019. All Rights
						Reserved
					</p>
				</div>
			</div>
		</div>
	</footer>
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