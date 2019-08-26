<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
<link rel="stylesheet" href="assets/css/colors/maron.css">

<!--Theme Responsive css-->
<!--  <link rel="stylesheet" href="resources/assets/css/responsive.css" /> -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<%@ include file="./header.jsp" %>
	<br><br><br><br><br>
<div class="text-center justify-content-center">
				<pre>
				
				
				
	
				
				
				
				</pre>
				
				<h1>[ THE FOREST ]</h1>
				<br>
				<h3>GAME</h3>
				<p>☆우리나라 멸종 위기 동물들과 친해지기★</p>
				<p>사진 클릭시 해당 게임으로 이동합니다.</p>
	<div class="card  text-center mx-auto"style="width:900px;">
		<div class="card-body">
			<img class="img-fluid" src="resources/assets/images/content/quiz.jpg" width="200px" height="200px" onclick="location.href='quiz.do'">
			<img class="img-fluid" src="resources/assets/images/content/puzzle.jpg" width="200px" height="200px" onclick="location.href='puzzle.do'">
			<img class="img-fluid" src="resources/assets/images/content/crossword.png" width="200px" height="200px" onclick="location.href='crossword.do'">
			<img class="img-fluid" src="resources/assets/images/content/sorting.png" width="200px" height="200px" onclick="location.href='sortinggame.do'">	
		</div>
	</div>
					<pre>
				
				
				
				
				
				
				
				
				</pre>
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
</body>
</html>