<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::Chatting Management</title>
<link rel="stylesheet" href="resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/assets/css/bootstrap.css">
<link href="resources/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"	rel="stylesheet" id="bootstrap-css">
<script type="text/javascript"	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'>
</head>
<body>
<!--top nav start=======-->
	<nav class="navbar navbar-inverse top-navbar" id="top-nav">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="" href="admin.do"><img align="left"
					src="resources/image/logowhite.png" alt="로곤디" width="103"
					height="49"></a>
			</div>
			<ul class="social-icon pull-right list-inline">
				<li class="dropdown"><a class="messages-link dropdown-toggle"
					href="#"><span class="glyphicon glyphicon-envelope"></span> </a></li>
				<li class="dropdown"><a class="alerts-link dropdown-toggle"
					href="#"><span class="glyphicon glyphicon-bell"></span> </a></li>
				<li class="dropdown"><a class="tasks-link dropdown-toggle"
					href="#"><span class="glyphicon glyphicon-th-list"></span> </a></li>
				<li class="dropdown"><a class="user-link dropdown-toggle"
					href="#"><span class="glyphicon glyphicon-user"></span></a></li>
			</ul>
		</div>
	</nav>
		<div class="row">
				<div class="col-md-12">
					<div class="page-title" style="padding: 8px 15px;">
						<ol class="breadcrumb">
							<li>
								<h2>&nbsp;Chatting Management<small> 채팅관리</small></h2>
							</li>
							<li style="margin-top: 10px; font-size: 20px; color: #34495e;">
								<i class="fa fa-calendar"></i>
							</li>
							<li class="pull-right"><audio controls="controls"
									autoplay="autoplay" loop="loop">
									<source src="resources/audio/mix.mp3" type="audio/mp3" />
								</audio>
							</li>
						</ol>
					</div>
				</div>
			</div>

				<div id="adminchat" class="container " style="width: 700px;height:700px; " >
					<iframe class="iframe-chat" src="http://192.168.10.158:8880/admin" style="width:100%;height: 100%;"></iframe>
				</div>
</body>
</html>