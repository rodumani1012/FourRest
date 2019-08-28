<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::Funding List</title>
<link rel="stylesheet" href="resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/assets/css/bootstrap.css">
<link href="resources/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<script src="https://use.fontawesome.com/07b0ce5d10.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

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
		<div class="col-md-6 table-responsive" style="overflow-y: scroll; margin: 5% ">
		<table class="table table-striped table-hover">
			<tr>
				<td>번호</td>
				<td>id</td>
				<td>펀딩제목</td>
				<td>목표금</td>
				<td>모인금액</td>
				<td>날짜</td>
				<td>참여인원</td>
				<td>펀딩내용</td>
				<td>notice</td>
				<td>후원삭제</td>
			</tr>
			<c:choose>
				<c:when test="${empty fundlist }">
					펀딩리스트없음
				</c:when>
				<c:otherwise>
					<c:forEach items="${fundlist }" var="fdto">
						<tr>
						<td>${fdto.fun_seq }</td>
						<td>${fdto.fun_id }</td>
						<td>${fdto.funtitle }</td>
						<td>${fdto.goalmoney }</td>
						<td>${fdto.nowmoney }</td>
						<td>${fdto.fundate }</td>
						<td>${fdto.participants }</td>
						<td>${fdto.fun_content }</td>
						<td>${fdto.notice }</td>
						<td><button class="btn btn btn-danger" type="button" onclick="location.href='admin_fundelete.do?id=${fdto.fun_id}&title=${fdto.funtitle }'">일정 삭제</button></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="9">
					<button class="btn btn btn-success" type="button" onclick="location.href='insert.do'">일정 등록하기</button>
				</td>
			</tr>
		</table>
		</div>
		<div class="col-md-4 table-responsive" style="overflow-y: scroll; margin-top: 5% ">
		<table class="table table-striped table-hover">
			<tr>
				<td>후원자</td>
				<td>펀딩제목</td>
				<td>후원금액</td>
				<td>환불하기</td>
			</tr>
			<c:choose>
				<c:when test="${empty paylist }">
					후원내역이없음
				</c:when>
				<c:otherwise>
					<c:forEach items="${paylist }" var="pdto">
						<tr>
						<td>${pdto.id }</td>
						<td>${pdto.funtitle }</td>
						<td>${pdto.funmoney}</td>
						<td><input class="btn btn-warning" type="button" onclick="#" value="환불"></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		</div>
	
	</div>
</body>
</html>