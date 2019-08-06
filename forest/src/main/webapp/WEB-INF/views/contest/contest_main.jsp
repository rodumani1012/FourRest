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

<style type="text/css">
body {
		background: #eee;
}

.flexslider {
		width: 790px;
		margin: 0 auto;
		box-shadow: none;
}

.flexslider li {
		position: relative;
}

.flexslider li .meta {
		position: absolute;
		bottom: 20px;
		left: 20px;
		color: white;
		display: flex;
		flex-direction: column;
		justify-content: flex-start;
		align-items: flex-start;
		font-family: 'Roboto', sans-serif;
}

.flexslider li h1 {
		background: rgba(51, 51, 51, 0.5);
		padding: 12px 18px 12px;
		margin-bottom: 0;
		font-size: 1.8em;
		font-weight: 300;
}

.flexslider li h2 {
		background: rgba(51, 51, 51, 0.5);
		padding: 13px 18px 11px;
		font-size: 1.1em;
		margin-bottom: 0;
		font-weight: 300;
}

.flexslider li .category {
		display: flex;
		flex-direction: row;
}

.flexslider li .category p {
		background: #e43837;
		margin-right: 7px;
		font-size: 1.1em;
		padding: 12px 18px 10px;
		font-weight: 300;
}

.flexslider li .category span {
		background: #e43837;
		margin-top: 17px;
		padding: 8px 12px 0;
		font-size: 0.9em;
		font-weight: 300;
		height: 26px;
}

.flexslider li h1,
.flexslider li h2,
.flexslider li .category p,
.flexslider li .category span {
		-webkit-animation-duration: .6s;
		animation-duration: .6s;
		-webkit-animation-fill-mode: both;
		animation-fill-mode: both;
		-webkit-animation-name: fadeOutLeft;
		animation-name: fadeOutLeft;
}

.flexslider li.flex-active-slide .meta h1,
.flexslider li.flex-active-slide .meta h2,
.flexslider li.flex-active-slide .meta .category p,
.flexslider li.flex-active-slide .meta .category span {
		-webkit-animation-delay: .4s;
		animation-delay: .4s;
		-webkit-animation-duration: .6s;
		animation-duration: .6s;
		-webkit-animation-fill-mode: both;
		animation-fill-mode: both;
		-webkit-animation-name: fadeInLeft;
		animation-name: fadeInLeft;
}

.flexslider li.flex-active-slide .meta h2 {
		-webkit-animation-delay: .5s;
		animation-delay: .5s;
}

.flexslider li.flex-active-slide .meta .category p {
		-webkit-animation-delay: .6s;
		animation-delay: .6s;
}

.flexslider li.flex-active-slide .meta .category span {
		-webkit-animation-delay: .8s;
		animation-delay: .8s;
}

.flex-direction-nav {
		position: absolute;
		top: 0;
		left: 30px;
}

.flex-direction-nav a {
		text-decoration: none;
		display: block;
		width: 30px;
		height: 30px;
		background-color: #333;
		margin: -20px 0 0;
		position: absolute;
		top: 50px;
		z-index: 10;
		overflow: hidden;
		opacity: .5;
		cursor: pointer;
		color: #fff;
		-webkit-transition: all .3s ease;
		-moz-transition: all .3s ease;
		transition: all .3s ease;
}

.flex-direction-nav .flex-prev {
		text-align: left;
		left: -10px;
}

.flex-direction-nav .flex-next {
		text-align: right;
		left: 30px;
}

.flexslider:hover .flex-prev {
		left: -10px;
}

.flexslider:hover .flex-next {
		left: 30px;
}

.flexslider:hover .flex-next:hover,
.flexslider:hover .flex-prev:hover {
		opacity: 1;
}

.flex-direction-nav a:before {
		font-family: FontAwesome;
		content: '\f104';
		font-size: 25px;
		display: flex;
		justify-content: center;
		align-items: center;
		position: relative;
		top: 0;
		padding: 2px;
		font-size: 19px;
    line-height: 27px;
}

.flex-direction-nav a.flex-next:before {
		content: '\f105';
}

@-webkit-keyframes fadeInLeft {
		0% {
				opacity: 0;
				-webkit-transform: translate3d(-100%, 0, 0);
				transform: translate3d(-100%, 0, 0);
		}
		100% {
				opacity: 1;
				-webkit-transform: none;
				transform: none;
		}
}

@keyframes fadeInLeft {
		0% {
				opacity: 0;
				-webkit-transform: translate3d(-100%, 0, 0);
				transform: translate3d(-100%, 0, 0);
		}
		100% {
				opacity: 1;
				-webkit-transform: none;
				transform: none;
		}
}

@-webkit-keyframes fadeOutLeft {
		0% {
				opacity: 1;
		}
		100% {
				opacity: 0;
				-webkit-transform: translate3d(-100%, 0, 0);
				transform: translate3d(-100%, 0, 0);
		}
}

@keyframes fadeOutLeft {
		0% {
				opacity: 1;
		}
		100% {
				opacity: 0;
				-webkit-transform: translate3d(-100%, 0, 0);
				transform: translate3d(-100%, 0, 0);
		}
}

li img{
width: 500px;
height: 400px;
object-fit:cover;
}
img:hover{
opacity:0.5 ;
}

.col-sm-3 img{
width: 400px;
height: 400px;
object-fit:cover;
}

</style>
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