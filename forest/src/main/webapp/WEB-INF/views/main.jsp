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
<link rel="icon" type="image/png" href="favicon.ico">
<link rel="shortcut icon" href="">

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
</style>


</head>

<body data-spy="scroll" data-target=".navbar-collapse">


	<!-- Preloader -->
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
	<!--End off Preloader -->
	<div class="culmn">
		<!--Home page style-->
		<!--Home page style-->
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
				<!-- Start Atribute Navigation -->
				<div class="attr-nav">
					<ul>
						<li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
						<li class="side-menu"><a href="#"><i class="fa fa-bars"></i></a></li>
					</ul>
				</div>
				<!-- End Atribute Navigation -->

				<!-- Start Header Navigation -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggler" data-toggle="collapse"
						data-target="#navbar-menu">
						<span></span> <span></span> <span></span>
					</button>

					<a class="navbar-brand" href="main"><img
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
						<li><button type="button" class="btn btn-link text-dark" onclick="location.href='ani_shelterList.do?pageNum=1&contentNum=10'">보호소</button></li>
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
			<div class="side">
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

		<!--Slide Show-->
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

				<!-- The slideshow -->
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

				<!-- Left and right controls -->
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a> <a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>

			</div>
		</div>

		<div class="container text-center">
			<img src="resources/assets/images/ss.png" alt="후원금 사용내역">
		</div>
		<div class="container text-center">
			<img src="resources/assets/images/fprojects/board.png" alt="게시판">
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
		<!--Portfolio Section-->
		<section id="portfolio" class="portfolio lightbg">
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
		<!-- scroll up-->
		<div class="scrollup">
			<a href="#"><i class="fa fa-chevron-up"></i></a>
		</div>

		<!-- End off scroll up -->
		<div class="main_maps text-center fix">
			<div class="overlay"></div>
			<div class="maps_text">
				<h3 class="text-white" onclick="showmap()">
					FIND US ON THE MAP <i class="fa fa-angle-down"></i>
				</h3>
				<div id="map_canvas" class="mapheight"></div>
			</div>
		</div>
	</div>
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
	</div>
	<!-- JS includes -->

	<script src="resources/assets/js/vendor/jquery-1.11.2.min.js"></script>
	<script src="resources/assets/js/vendor/popper.min.js"></script>
	<script src="resources/assets/js/vendor/bootstrap.min.js"></script>

	<script src="resources/assets/js/jquery.magnific-popup.js"></script>
	<script src="resources/assets/js/jquery.easing.1.3.js"></script>
	<script src="resources/assets/js/slick.min.js"></script>
	<script src="resources/assets/js/jquery.collapse.js"></script>
	<script src="resources/assets/js/bootsnav.js"></script>

	<script
		src="http://maps.google.com/maps/api/js?key=AIzaSyD_tAQD36pKp9v4at5AnpGbvBUsLCOSJx8"></script>
	<script src="resources/assets/js/gmaps.min.js"></script>
	<script src="resources/assets/js/plugins.js"></script>
	<script src="resources/assets/js/main.js"></script>

	<script type="text/javascript">
		function showmap() {
			var mapOptions = {
				zoom : 8,
				scrollwheel : false,
				center : new google.maps.LatLng(-34.397, 150.644),
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			var map = new google.maps.Map(
					document.getElementById('map_canvas'), mapOptions);
			$('.mapheight').css('height', '350');
			$('.maps_text h3').hide();
		}
	</script>

</body>

</html>
