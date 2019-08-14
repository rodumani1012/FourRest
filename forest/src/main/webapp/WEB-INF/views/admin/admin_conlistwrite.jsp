<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공모전작성</title>
<link href="resources/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<!-- date picker 3line -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<!-- <script -->
<!-- 	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> -->
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>


<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
<script src="dist/lang/summernote-ko-KR.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('.summernote').summernote({
			height : 400

		});
	});
</script>

<!-- datepicker -->
<script type="text/javascript">
$(function() {
    $( "#datepicker1,#datepicker2" ).datepicker({
    });
});
</script>
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
	<form:form action="admin_conlistwriteform.do" modelAttribute="ContestListDto" method="post" >
		<table>
				<tr height="80px">
				<td>분류</td>
				<td>
				<select name="sort" style="height: 23px">
						<option value="네이밍">네이밍공모</option>
						<option value="사진">사진공모</option>
						<option value="영상">영상공모</option>
						<option value="작문">작문공모</option>
				</select>
				공고기간
				<input type="text" id="datepicker1" name="startdate"  autocomplete="off"/>
					~<input type="text" id="datepicker2" name="enddate"autocomplete="off"/>	 
				</td>
			</tr>
			<tr height="80px">
				<td>제 목</td>
				<td><input type="text" name="title" style="width: 650px" /></td>
			</tr>
			<tr height="80px">
				<td>공모대상</td>
				<td><input type="text" name="forwho" style="width: 650px" /></td>	
			</tr>
			<tr height="80px">
				<td>상금</td>
				<td><input type="text" name="prize" style="width: 650px" /></td>
			</tr>
			<tr>
				<td>설명</td>
				<td><textarea rows="10" cols="30" class="summernote"
						name="content" style="width: 650px; height: 350px;" placeholder="사진을첨부해주세요"></textarea></td>
			</tr>
			<tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록" /> <input
					type="button" value="작성 취소"
					onclick="location.href='admin_conlist.do'" /></td>
			</tr>
		</table>
	</form:form>
</body>

</html>