<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- <script type="text/javascript" src="resources/assets/js/crawling/animalshelterlist.js"></script> -->
<script type="text/javascript">
	function PageMove(page) {
		location.href = "ani_shelterList.do?page=" + page + "&txt_search=" + $('input#txt_search').val();
	}
</script>
<body>
	
		<!-- content -->
	<div>
		<div>
			<table border="1">
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

			<table>
				<tr>
					<td colspan="4">
						<input type="text" id="txt_search" value="${txt_search }"> 
						<input type="button" class="small" value="검색" 
							onclick="javascript:PageMove(${paging.pageNo})">
					</td>
				</tr>
			</table>

			<!-- Pagination -->
			<div>
				<a href="javascript:PageMove(${paging.firstPageNo})">&laquo;</a> 
				<a href="javascript:PageMove(${paging.prevPageNo})">&lt;</a>
					<c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
						<c:choose>
							<c:when test="${i eq paging.pageNo}">
								<a href="javascript:PageMove(${i})">${i}</a>
							</c:when>
							<c:otherwise>
								<a href="javascript:PageMove(${i})">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				<a href="javascript:PageMove(${paging.nextPageNo})">&gt;</a> 
				<a href="javascript:PageMove(${paging.finalPageNo})">&raquo;</a>
			</div>
		</div>
	</div>


</body>
</html>