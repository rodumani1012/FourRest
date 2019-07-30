<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="sumit kumar">
<title>admin-template</title>

<link rel="stylesheet" href="resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/assets/css/bootstrap.css">
<link href="resources/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<script src="https://use.fontawesome.com/07b0ce5d10.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<style type="text/css">
</style>
</head>
<%@ page import="java.util.*, java.text.*"%>

<%
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
	String today = formatter.format(new java.util.Date());
%>
<body>

	<!--=============================NAVIGATION =============================-->

	<!--top nav start=======-->
	<nav class="navbar navbar-inverse top-navbar" id="top-nav">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="" href="admin.do"><img align="left"
					src="resources/image/logowhite.png" alt="로곤디" width="103"
					height="49"></a> <a href="javascript:;" class="sidebar-toggle">
					<i class="fa fa-bars"></i>
				</a> <span class="close-btn" id="hide-btn"><i class="fa fa-times"
					aria-hidden="true"></i></span>
			</div>

			<ul class="social-icon pull-right list-inline">

				<li class="dropdown"><a class="messages-link dropdown-toggle"
					data-toggle="dropdown" href="#"><span
						class="glyphicon glyphicon-envelope"></span> <span class="number">4</span>
						<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Page 1-1</a></li>
						<li><a href="#">Page 1-2</a></li>
						<li><a href="#">Page 1-3</a></li>
					</ul></li>

				<li class="dropdown"><a class="alerts-link dropdown-toggle"
					data-toggle="dropdown" href="#"><span
						class="glyphicon glyphicon-bell"></span> <span class="number">6</span>
						<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Page 1-1</a></li>
						<li><a href="#">Page 1-2</a></li>
						<li><a href="#">Page 1-3</a></li>
					</ul></li>

				<li class="dropdown"><a class="tasks-link dropdown-toggle"
					data-toggle="dropdown" href="#"><span
						class="glyphicon glyphicon-th-list"></span> <span class="number">11</span>
						<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Page 1-1</a></li>
						<li><a href="#">Page 1-2</a></li>
						<li><a href="#">Page 1-3</a></li>
					</ul></li>

				<li class="dropdown"><a class="user-link dropdown-toggle"
					data-toggle="dropdown" href="#"><span
						class="glyphicon glyphicon-user"></span> <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Page 1-1</a></li>
						<li><a href="#">Page 1-2</a></li>
						<li><a href="#">Page 1-3</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
	<!--    top nav end===========-->

	<!-- begin SIDE NAV USER PANEL -->
	<div class="container-1" id="user-profil">
		<ul id="side" class="nav navbar-nav-1 side-nav">

			<li class="side-user">
				<p class="welcome">
					<i class="fa fa-key"></i> Logged in as
				</p>
				<p class="name tooltip-sidebar-logout">
					Sumit <span class="last-name">Kumar</span> <a href="#"><i
						class="fa fa-sign-out"></i></a>
				</p>
			</li>

			<li class="nav-search">
				<form class="navbar-form">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search">
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form>
			</li>


		</ul>
	</div>


	<div class="container-2">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-md-12">
					<div class="page-title">
						<h2>ADMIN BOARD<small>관리자페이지</small></h2>
						<ol class="breadcrumb">
			<!--				<li class="active">
							<a href="admincalboard">봉사일정관리<i class="fa fa-chevron-circle-right"></i></a>
							</li>
							<li class="pull-right">
								<div id="reportrange"class="btn btn-green btn-square date-picker">
									<i class="fa fa-calendar"></i><span class="date-range"><%=today.substring(0, 8)%></span><i class="fa fa-caret-down"></i>
								</div>
							</li>
			 -->
			 				<li class="active">
			 												<div id="reportrange"class="btn btn-green btn-square date-picker">
									<i class="fa fa-calendar"></i><span class="date-range">  <%=today.substring(0, 8) %></span><i class="fa fa-caret-down"></i>
								</div>
			 				</li>
			 				<li class="pull-right">
			 				<a href="admincal.do">봉사일정관리<i class="fa fa-chevron-circle-right"></i></a>
			 				</li>
			 
			 				
						</ol>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-2 col-sm-6">
					<div class="circle-tile">
						<a href="#">
							<div class="circle-tile-heading dark-blue">
								<i class="fa fa-users fa-fw fa-3x"></i>
							</div>
						</a>
						<div class="circle-tile-content dark-blue">
							<div class="circle-tile-description text-faded">회원목록</div>
							<div class="circle-tile-number text-faded">
								265 <span id="sparklineA"></span>
							</div>
							<a href="memlist.do" class="circle-tile-footer">More Info <i
								class="fa fa-chevron-circle-right"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-sm-6">
					<div class="circle-tile">
						<a href="#">
							<div class="circle-tile-heading green">
								<i class="fa fa-money fa-fw fa-3x"></i>
							</div>
						</a>
						<div class="circle-tile-content green">
							<div class="circle-tile-description text-faded">후원내역</div>
							<div class="circle-tile-number text-faded">$32,384</div>
							<a href="#" class="circle-tile-footer">More Info <i
								class="fa fa-chevron-circle-right"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-sm-6">
					<div class="circle-tile">
						<a href="#">
							<div class="circle-tile-heading orange">
								<i class="fa fa-bell fa-fw fa-3x"></i>
							</div>
						</a>
						<div class="circle-tile-content orange">
							<div class="circle-tile-description text-faded">공모게시판</div>
							<div class="circle-tile-number text-faded">9 New</div>
							<a href="#" class="circle-tile-footer">More Info <i
								class="fa fa-chevron-circle-right"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-sm-6">
					<div class="circle-tile">
						<a href="#">
							<div class="circle-tile-heading blue">
								<i class="fa fa-tasks fa-fw fa-3x"></i>
							</div>
						</a>
						<div class="circle-tile-content blue">
							<div class="circle-tile-description text-faded">자유게시판</div>
							<div class="circle-tile-number text-faded">
								10 <span id="sparklineB"></span>
							</div>
							<a href="#" class="circle-tile-footer">More Info <i
								class="fa fa-chevron-circle-right"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-sm-6">
					<div class="circle-tile">
						<a href="#">
							<div class="circle-tile-heading red">
								<i class="fa fa-tasks fa-fw fa-3x"></i>
							</div>
						</a>
						<div class="circle-tile-content red">
							<div class="circle-tile-description text-faded">멸종게시관리</div>
							<div class="circle-tile-number text-faded">
								24 <span id="sparklineC"></span>
							</div>
							<a href="#" class="circle-tile-footer">More Info <i
								class="fa fa-chevron-circle-right"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-sm-6">
					<div class="circle-tile">
						<a href="#">
							<div class="circle-tile-heading purple">
								<i class="fa fa-comments fa-fw fa-3x"></i>
							</div>
						</a>
						<div class="circle-tile-content purple">
							<div class="circle-tile-description text-faded">문의채팅방</div>
							<div class="circle-tile-number text-faded">
								96 <span id="sparklineD"></span>
							</div>
							<a href="#" class="circle-tile-footer">More Info <i
								class="fa fa-chevron-circle-right"></i></a>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- page-wrapper END-->
	</div>
	<!-- container-1 END-->


	<script src="resources/assets/js/vendor/jquery-1.11.2.min.js"></script>
	<script src="resources/assets/js/vendor/bootstrap.min.js"></script>


	<script type="text/javascript">
		$(document).ready(function() {
			$(".sidebar-toggle").click(function() {
				$(this).hide();

				$("#user-profil").show();

				$("#hide-btn").show();

				$(".container-2").css("width", "85%");

			});

			$("#hide-btn").click(function() {
				$(this).hide();

				$("#user-profil").hide();

				$(".sidebar-toggle").show();

				$(".container-2").css("width", "100%");

			});
		});
	</script>



</body>
</html>