<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!--Google Font link-->
<link rel="shortcut icon" href="">
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


<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- <script type="text/javascript" src="resources/assets/js/crawling/animalshelterlist.js"></script> -->
<script type="text/javascript">
	function PageMove(page) {
		location.href = "ani_shelterList.do?page=" + page + "&txt_search=" + $('input#txt_search').val();
	}
</script>
<body>
	
		<!-- content -->
<%@ include file="../header.jsp" %>
<br><br><br><br><br>			
	<div class="culmn">
		<div class="container table-responsive">
			<table class="table table-bordered mx-auto " border="1">
				<thead>
					<tr>
						<th>관할구역</th>
						<th>보호센터명</th>
						<th>전화번호</th>
						<th>보호센터</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan="4">-----------센터목록이 존재하지 않습니다.-----------</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list }" var="dto">
								<tr>
									<td>${dto.area }</td>
									<td>${dto.centerName }</td>
									<td>${dto.phoneNumber }</td>
									<td>${dto.centerAddr }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>


			<!-- Pagination -->
			<div class="pagination pagination-md justify-content-center">
				<a class="page-link" href="javascript:PageMove(${paging.firstPageNo})">&laquo;</a> 
				<a class="page-link" href="javascript:PageMove(${paging.prevPageNo})">&lt;</a>
					<c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
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
			<div class="cotainer">
				<table class="pull-right">
					<tr>
						<td colspan="4">
							<div class="form-group form-inline">
							<input type="text" class="form-control" id="txt_search" value="${txt_search }"> 
							<button type="button" class="small btn btn-secondary"
								onclick="javascript:PageMove(${paging.pageNo})">검색하기</button>
							</div>
						</td>
					</tr>
				</table>
			</div>	
		</div>
	</div>


</body>
</html>