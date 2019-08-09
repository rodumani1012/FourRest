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
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>


<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
<script src="dist/lang/summernote-ko-KR.js"></script>
<style type="text/css">
body {
	width:"100%";
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('.summernote').summernote({
			height : 400

		});
	});
</script>



</head>
<body>
<div class="culmn">
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
				<!-- Start Header Navigation -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggler" data-toggle="collapse"
						data-target="#navbar-menu">
						<span></span> <span></span> <span></span>
					</button>

					<a class="navbar-brand" href="main.do"><img
						src="resources/assets/images/logo2.jpg" class="logo logo-scrolled"
						alt="logo"> </a>
				</div>
				<!-- End Header Navigation -->
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="navbar-menu">
					<ul class="nav navbar-nav navbar-right" data-in="fadeInDown"
						data-out="fadeOutUp">
						<li><button type="button" class="btn btn-link text-dark" onclick="test()">Map</button></li>
						<li><button type="button" class="btn btn-link text-dark" onclick="location.href='sponsor.do'">Sponsor</button></li>
						<li><button type="button" class="btn btn-link text-dark" onclick="location.href='#portfolio'">review</button></li>
						<li><button type="button" class="btn btn-link text-dark" onclick="location.href='test.do'">문의하기</button></li>
						<li><button type="button" class="btn btn-link text-dark" onclick="location.href='contest_main.do'">공모</button></li>
						<li><button type="button" class="btn btn-link text-dark" onclick="location.href='#blog'">Blog</button></li>
						<li><button type="button" class="btn btn-link text-dark" onclick="location.href='content.do'">Contant</button></li>
						<li><button type="button" class="btn btn-link text-dark" onclick="location.href='ani_shelterList.do'">보호소</button></li>
						<li><button type="button" class="btn btn-link text-dark" onclick="location.href='admin.do'">관리자</button></li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li><sec:authorize access="isAuthenticated()">
								<sec:authentication property="principal.username" var="user_id" />
								안녕하세요. ${user_id }
								</sec:authorize>
								<sec:authorize access="isAnonymous()">
									<button type="button" class="btn btn-link text-dark"
										onclick="location.href='loginform.do'">LOGIN</button>
								</sec:authorize></li>
						<li><sec:authorize access="isAuthenticated()">
								<form:form action="${pageContext.request.contextPath}/logout"
									method="POST">
									<input type="submit" class="btn btn-link text-dark"
										value="LOGOUT" />
								</form:form>
							</sec:authorize></li>
						<li><sec:authorize access="isAnonymous()">
								<button type="button" class="btn btn-link text-dark"
									onclick="location.href='joinform.do'">JOIN</button>
							</sec:authorize></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>

		</nav>
	
<br><br><br><br><br><br>
<div class="container">

	<form:form action="contest_post.do" modelAttribute="ContestBoardDto" method="post" >
		<input type="hidden" name="writer" value="${user_id }">
		<table class="d-flex justify-content-center">
			<tr>
				<td>카테고리</td>
				<td>
				<select name="conlistno">
				<c:forEach items="${conlist}" var="dto">
					<option value="${dto.boardno }" >${dto.title }</option>
				</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<th></th>
				<td></td>
			</tr>
			<tr>	
				<td>제목</td>
				<td><input type="text" name="title" style="width: 650px" /></td>
			</tr>
			<tr>
				<th></th>
				<td></td>
			</tr>
			<tr>
				<td>설명</td>
				<td><textarea rows="10" cols="30" class="summernote"
						name="content" style="width: 650px; height: 350px;"></textarea></td>
			</tr>
			<tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록" />
				<input type="button" value="작성 취소" onclick="location.href='contest_main.do'" />
				</td>
			</tr>
		</table>
</form:form>
</div>
</div>	
</body>

</html>