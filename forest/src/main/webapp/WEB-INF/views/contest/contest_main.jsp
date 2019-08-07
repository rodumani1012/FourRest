<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<body>
<%@ include file="../header.jsp" %>
<br><br><br><br><br>
<div class="container">
	<div class="row">
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

</body>
</html>