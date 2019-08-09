<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flexslider/2.2.0/flexslider-min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.css">
<link rel="stylesheet" href="resources/assets/css/contest_main.css">

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

/*	--------------------------------------------------
	:: Table Filter
	-------------------------------------------------- */
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
	/* Had to use this style to force the div to expand (wasn't necessary with my bootstrap version 3.3.6) */
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
<style type="text/css">
#listdiv{
display: none;
}
#btninlist{
display: none;
}
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<br><br><br><br><br>
<div class="container">
<div class="col-sm-12">
		<h3 style="display: inline;">공모전목록</h3>
		<button class="btn btn-outline-dark" type="button" onclick="showup()" id="btninslide">리스트로보기</button>
		<button class="btn btn-outline-dark" type="button" onclick="showback()" id="btninlist">사진으로보기</button>
</div>
		<div class="" id="listdiv">
		
			<section class="content">
				<div class="col-md-8 col-md-offset-2">
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
													<c:when test="${today<end&&today>start}">
												<tr data-status="pagado">
													<td>
													</td>
													<td>${dto.boardno}</td>
													<td><a href="#">${dto.title }</a></td>
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
													<td><a href="#">${dto.title }</a></td>
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
													<td><a href="#">${dto.title }</a></td>
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
									<input type="button" value="공모작성"
										onclick="location.href='admin_conlistwrite.do'">
								</div>
							</div>

						</div>
					</div>
				</div>
			</section>
	</div>
<div class="container" id="sliddiv" >
	<div class="flexslider left">
	<ul class="slides">
		<c:choose>
			<c:when test="${empty conlist }">
			<li>
			<img src="https://source.unsplash.com/BaCmEa2hy8g/1600x900">
			<div class="meta">
				<h1>Lorem ipsum dolor sit amet, consectetur.</h1>
				<h2>Lorem ipsum dolor sit.</h2>
			</div>
		</li>
		<li>
			<img src="https://source.unsplash.com/RmZIUIF2S2Q/1600x900">
			<div class="meta">
				<h1>Lorem ipsum dolor sit amet, consectetur.</h1>
				<h2>Lorem ipsum dolor sit.</h2>
			</div>
		</li>
		<li>
			<img src="https://source.unsplash.com/cFplR9ZGnAk/1600x900">
			<div class="meta">
				<h1>Lorem ipsum dolor sit amet, consectetur.</h1>
				<h2>Lorem ipsum dolor sit.</h2>
			</div>
		</li>
		<li>
			<img src="https://source.unsplash.com/Ui8KQ0ahXBM/1600x900">
			<div class="meta">
				<h1>Lorem ipsum dolor sit amet, consectetur.</h1>
				<h2>Lorem ipsum dolor sit.</h2>
			</div>
		</li>
			</c:when>
			<c:otherwise>
				<c:forEach items="${conlist }" var="dto">
					<li>
						<a href="conlistdetail.do?conlistno=${dto.boardno }">${dto.reppic }</a>	
						<div class="meta">
							<h1>${dto.title }</h1>
							<h2>${dto.sort }</h2>
						</div>
					</li>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
	</div>
</div>
<!-- .container -->
<br>



<div class="container">

	<div class="col-sm-12">
		<h3 style="display: inline;">RELATED POSTS</h3>
		<button class="btn btn-outline-dark" type="button" onclick="location.href='contest_postform.do'">공모글작성</button>
		<button class="btn btn-outline-dark"  type="button" onclick="location.href='contest_postlist.do?conlistno=0&pagenum=1&contentnum=6'">참여작보기</button>
	</div>
	<hr>	
	<div class="col-sm-12">
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
<div class="carousel-inner" role="listbox">
	<div class="carousel-item active">
		<div class="row">
					<c:choose>
			<c:when test="${empty threelist }">
								<div class="col-sm-3">
				<img class="d-block img-fluid" src="http://placehold.it/400x400" alt="First slide">
				<div class="text-center">
					<h6 class="card-title">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</h6>
				</div>
			</div>
  			
  			<div class="col-sm-3">
  				<img class="d-block img-fluid" src="http://placehold.it/400x400" alt="First slide">
  				<div class="text-center">
  					<h6 class="card-title">Lorem ipsum dolor sit amet.</h6>
  				</div>
  			</div>
  			<div class="col-sm-3">
  				<img class="d-block img-fluid" src="http://placehold.it/400x400" alt="First slide">
  				<div class="text-center">
  					<h6 class="card-title">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</h6>
  				</div>
  			</div>
  			<div class="col-sm-3">
  				<img class="d-block img-fluid" src="http://placehold.it/400x400" alt="First slide">
  				<div class="text-center">
  					<h6 class="card-title">Lorem ipsum dolor sit amet.</h6>
  				</div>
  			</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${threelist }" var="threedto" varStatus="status" >
					<div class="col-sm-3">
  					<img class="d-block img-fluid" ${threedto.reppic}>
  					<div class="text-center">
  						<h6 class="card-title">	순위 : ${status.count }
						<a href="contest_detail.do?boardno=${threedto.boardno }">${threedto.title }	평점: ${threedto.likerate }</a>
					</h6>
  				</div>
  			</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>

  		</div>
  	</div>
  </div>
</div>
</div>
</div>
<hr>

<script src="https://cdnjs.cloudflare.com/ajax/libs/flexslider/2.2.0/jquery.flexslider-min.js"></script>
<script>
     $('.flexslider').flexslider({
	animation: "slide",
	controlNav: false
});
</script>

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
<script type="text/javascript">
function showback() {
    $("#listdiv").hide();
    $("#sliddiv").show();
    $("#btninlist").hide();
    $("#btninslide").show();
    
 }

 function showup() {
    $("#sliddiv").hide();
    $("#listdiv").show();
    $("#btninslide").hide();
    $("#btninlist").show();
    
 }
</script>


</body>
</html>