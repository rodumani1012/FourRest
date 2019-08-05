<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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
</head>
<body>
	<div class="container">
		<div class="row">
			<section class="content">
				<div class="col-md-8 col-md-offset-2">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="pull-right">
								<div class="btn-group">
									<button type="button" class="btn btn-success btn-filter"
										data-target="pagado">진행중</button>
									<button type="button" class="btn btn-warning btn-filter"
										data-target="pendiente">마감임박</button>
									<button type="button" class="btn btn-danger btn-filter"
										data-target="cancelado">종료</button>
									<button type="button" class="btn btn-default btn-filter"
										data-target="all">진행예정</button>
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
												<tr data-status="pagado">
													<td>
													</td>
													<td>${dto.boardno}</td>
													<td><a href="#">${dto.title }</a></td>
													<td><fmt:formatDate value="${dto.startdate }"
															pattern="yyyy-MM-dd" /> ~ <fmt:formatDate
															value="${dto.enddate }" pattern="yyyy-MM-dd" /></td>
													<td>${dto.partnum }</td>
												</tr>
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