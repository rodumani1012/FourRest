<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>	
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
</head>

<body data-spy="scroll" data-target=".navbar-collapse">

<%@ include file="./header.jsp" %>

	<div class="culmn">
				<br> <br> <br> <br> <br> <br> <br>
		<div class="">
			<div class="container">
				<div class="card" style="width: 450px; margin: auto;">
					<div class="card-body">
						<div class="row justify-content-center">
							<div class="container text-center">
								<h2>후원신청</h2>
								<p>당신의 작은 관심이 지구를 살립니다.</p>
								<table class="table">
									<thead>
										<tr>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>후원방법</th>
											<td><select class="form-control col-sm-8">
													<option>후원방법선택</option>
													<option>정기후원</option>
													<option>일시후원</option>
											</select></td>
										</tr>
										<tr>
											<th>후원종류</th>
											<td><input class="form-control col-sm-8"
												id="disabledInput" type="text" placeholder="세계자연기금후원"
												disabled></td>
										</tr>
										<tr>
											<th>후원자명</th>
											<td><input type="text" class="form-control col-sm-8"
												id="sponsorname" placeholder="후원자명"></td>
										<tr>
											<th></th>
											<td>
												<button type="button" class="btn btn-success">후원하기</button>
											</td>
										</tr>		
									</tbody>
								</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
