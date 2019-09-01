<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::Contest Management</title>
<link rel="stylesheet" href="resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/assets/css/bootstrap.css">
<link href="resources/assets/css/admin.css" rel="stylesheet" type="text/css">
<script src="https://use.fontawesome.com/07b0ce5d10.js"></script>
<link	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"	rel="stylesheet" id="bootstrap-css">
<script type="text/javascript"	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style type="text/css">
body {
	font-family: 'Open Sans', sans-serif;
	color: #353535;
}

.content h1 {
	text-align: center;
}

.content .content-footer p {
	color: #6d6d6d;
	font-size: 12px;
	text-align: center;
}

.content .content-footer p a {
	color: inherit;
	font-weight: bold;
}
.panel {
	border: 1px solid #ddd;
	background-color: #fcfcfc;
}

.panel .btn-group {
	margin: 15px 0 30px;
}

.panel .btn-group .btn {
	transition: background-color .3s ease;
}

.table-filter {
	background-color: #fff;
	border-bottom: 1px solid #eee;
}

.table-filter tbody tr:hover {
	cursor: pointer;
	background-color: #eee;
}

.table-filter tbody tr td {
	padding: 10px;
	vertical-align: middle;
	border-top-color: #eee;
}

.table-filter tbody tr.selected td {
	background-color: #eee;
}

.table-filter tr td:first-child {
	width: 38px;
}

.table-filter tr td:nth-child(2) {
	width: 35px;
}

.ckbox {
	position: relative;
}

.ckbox input[type="checkbox"] {
	opacity: 0;
}

.ckbox label {
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.ckbox label:before {
	content: '';
	top: 1px;
	left: 0;
	width: 18px;
	height: 18px;
	display: block;
	position: absolute;
	border-radius: 2px;
	border: 1px solid #bbb;
	background-color: #fff;
}

.ckbox input[type="checkbox"]:checked+label:before {
	border-color: #2BBCDE;
	background-color: #2BBCDE;
}

.ckbox input[type="checkbox"]:checked+label:after {
	top: 3px;
	left: 3.5px;
	content: '\e013';
	color: #fff;
	font-size: 11px;
	font-family: 'Glyphicons Halflings';
	position: absolute;
}

.table-filter .star {
	color: #ccc;
	text-align: center;
	display: block;
}

.table-filter .star.star-checked {
	color: #F0AD4E;
}

.table-filter .star:hover {
	color: #ccc;
}

.table-filter .star.star-checked:hover {
	color: #F0AD4E;
}

.table-filter .media-photo {
	width: 35px;
}

.table-filter .media-body {
	display: block;
}

.table-filter .media-meta {
	font-size: 11px;
	color: #999;
}

.table-filter .media .title {
	color: #2BBCDE;
	font-size: 14px;
	font-weight: bold;
	line-height: normal;
	margin: 0;
}

.table-filter .media .title span {
	font-size: .8em;
	margin-right: 20px;
}

.table-filter .media .title span.pagado {
	color: #5cb85c;
}

.table-filter .media .title span.pendiente {
	color: #f0ad4e;
}

.table-filter .media .title span.cancelado {
	color: #d9534f;
}

.table-filter .media .summary {
	font-size: 14px;
}
</style>
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
								<h2>&nbsp;Contest Management<small> 공모게시관리</small></h2>
							</li>
							<li style="margin-top: 10px; font-size: 20px; color: #34495e;">
								<i class="fa fa-calendar"></i>
							</li>
							<li>
							<audio controls="controls" autoplay="autoplay" loop="loop">
									<source src="resources/audio/mix.mp3" type="audio/mp3" />
								</audio>
							</li>
						</ol>
					</div>
				</div>
			</div>
	<div class="container" style="margin-left: 19%">
			<section class="content">
				<div class="col-md-10">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="pull-right">
								<div class="btn-group">
									<button type="button" class="btn btn-success btn-filter"
										data-target="pagado">진행중</button>
									<button type="button" class="btn btn-warning btn-filter"
										data-target="pendiente">오늘마감</button>
									<button type="button" class="btn btn-danger btn-filter"
										data-target="cancelado">종료</button>
									<button type="button" class="btn btn-default btn-filter"
										data-target="all">전체</button>
								</div>
							</div>
							<div class="table-container">
								<table class="table table-filter">
									<thead>
										<tr>
											<td></td>
											<th>공모번호</th>
											<th>공모제목</th>
											<th>공모일정</th>
											<th>현황</th>
										</tr>
									</thead>
									<c:choose>
										<c:when test="${empty conlist }">
											<tr>
												<td colspan="4">올려진 공모가 없습니다 !! 공모를 등록해주세요 !</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${conlist}" var="dto">
												<jsp:useBean id="now" class="java.util.Date"/>
												<fmt:formatDate value="${now }" pattern="yyyy-MM-dd" var="today"/>
												<fmt:formatDate value="${dto.startdate }" pattern="yyyy-MM-dd" var="start"/>
												<fmt:formatDate value="${dto.enddate }" pattern="yyyy-MM-dd" var="end"/>
												<c:choose>
													<c:when test="${today<end}">
												<tr data-status="pagado">
													<td>
													</td>
													<td>${dto.boardno}</td>
													<td><a href="conlistdetail.do?conlistno=${dto.boardno }">${dto.title }</a></td>
													<td>
													${start }~${end } <a style="color:#4cae4c; font-weight: bold; ">(진행중)</a>
													</td>
													<td>${dto.partnum }</td>
												</tr>													
													</c:when>
													<c:when test="${today==end }">
													<tr data-status="pendiente">
													<td>
													</td>
													<td>${dto.boardno}</td>
													<td><a href="conlistdetail.do?conlistno=${dto.boardno }">${dto.title }</a></td>
													<td>
													${start }~${end }<a style="color:#eea236; font-weight: bold;">(오늘마감)</a>
													<td>${dto.partnum }
													</td>
												</tr>							
													</c:when>
													<c:when test="${today>end}">
													<tr data-status="cancelado">
													<td>
													</td>
													<td>${dto.boardno}</td>
													<td><a href="conlistdetail.do?conlistno=${dto.boardno }">${dto.title }</a></td>
													<td>
													${start }~${end }<a style="color:#d43f3a; font-weight: bold;">(종료)</a>
													<td>${dto.partnum }</td>
												</tr>															
													</c:when>
												</c:choose>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</table>
							</div>
							<div class="pull-right">
								<div class="btn-group">
									<input type="button" class="btn btn-default" value="공모작성"
										onclick="location.href='admin_conlistwrite.do'">
								</div>
							</div>

						</div>
					</div>
				</div>
			</section>
		</div>

</body>
<script type="text/javascript">
	$(document).ready(function() {

		$('.star').on('click', function() {
			$(this).toggleClass('star-checked');
		});

		$('.ckbox label').on('click', function() {
			$(this).parents('tr').toggleClass('selected');
		});

		$('.btn-filter').on('click', function() {
			var $target = $(this).data('target');
			if ($target != 'all') {
				$('.table tr').css('display', 'none');
				$('.table tr[data-status="' + $target + '"]').fadeIn('slow');
			} else {
				$('.table tr').css('display', 'none').fadeIn('slow');
			}
		});

	});
</script> 
</html>