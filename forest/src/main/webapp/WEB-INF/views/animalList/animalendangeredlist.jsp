<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function PageMove(page) {
		location.href = "ani_endangeredList.do?page=" + page + "&txt_search=" + $('input#txt_search').val();
	}
</script>
<style type="text/css">
div>img {
	width: 150px; 
	height: 100px;
}
</style>
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
<link rel="stylesheet" href="resources/assets/css/bootsnav.css">

<!--For Plugins external css-->
<!--<link rel="stylesheet" href="assets/css/plugins.css" />-->

<!--Theme custom css -->
<link rel="stylesheet" href="resources/assets/css/style.css">
<!--<link rel="stylesheet" href="assets/css/colors/maron.css">-->

<!--Theme Responsive css-->
<link rel="stylesheet" href="resources/assets/css/responsive.css" />
<script type="text/javascript"
   src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>


<%@ include file="../header.jsp"%> 
<br><br><br><br><br>
<div class="container">
	<div class="row">
	<!-- content -->
	<table class="form-group gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-5 filter hdpe">
		<tr>
			<td colspan="5">
				<input type="text" id="txt_search" value="${txt_search }"> 
				<button type="button" class="btn btn-outline-dark" onclick="javascript:PageMove(${paging.pageNo})">검색</button>
			</td>
		</tr>
	</table>
	
	<table class="table table-bordered">
		<tr class="table-active">
			<th>구분</th><th>포유류</th><th>조류</th><th>파충류</th><th>양서류</th><th>어류</th><th>곤충류</th><th>무척추동물</th><th>육상식물</th><th>해조류</th><th>고등균류</th><th>합계</th>
		</tr>
		<tr>
			<td>멸종위기 Ⅰ 급</td>
			<c:forEach var="one" items="${one }">
				<td>${one }</td>
			</c:forEach>
			<td>${totalOne }</td>
		</tr>
		<tr>
			<td>멸종위기 Ⅱ 급</td>
			<c:forEach var="two" items="${two }">
				<td>${two }</td>
			</c:forEach>
			<td>${totalTwo }</td>
		</tr>
		<tr>
			<td>합계</td>
			<c:forEach var="totalOneTwo" items="${totalOneTwo }">
				<td>${totalOneTwo }</td>
			</c:forEach>
		</tr>
	</table>
	
	<div>
		> 검색결과 ( 총 ${totalCount }종)
	</div>

	<div class="container">
		<div class="row">
		<c:choose>
			<c:when test="${empty list }">
				<h3>-----------동물목록이 존재하지 않습니다.-----------</h3>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
							<div class="form-group gallery_product col-lg-2 col-md-2 col-sm-2 col-xs-3 filter hdpe">
								<img src="${dto.img }" alt="${dto.korName}">
							<p>
								- ${dto.korName }(${dto.groups })
							</p>
							<p>
					 			멸종위기 야생 생물 ${dto.grade }급
							</p>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</div>
	
	<!-- Pagination -->
		<div class="pagination pagination-md justify-content-center">
			<a class="page-link" href="javascript:PageMove(${paging.firstPageNo})">&laquo;</a> 
			<a class="page-link" href="javascript:PageMove(${paging.prevPageNo})">&lt;</a>
			<c:forEach var="i" begin="${paging.startPageNo}"
				end="${paging.endPageNo}" step="1">
				<c:choose>
					<c:when test="${i eq paging.pageNo}">
						<a class="page-link" href="javascript:PageMove(${i})">${i}</a>
					</c:when>
					<c:otherwise>
						<a class="page-link" href="javascript:PageMove(${i})">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<a class="page-link" href="javascript:PageMove(${paging.nextPageNo})">&gt;</a> 
			<a class="page-link" href="javascript:PageMove(${paging.finalPageNo})">&raquo;</a>
		</div>
	</div>
</div>
</div>
</body>
</html>