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
		location.href = "ani_shelterList.do?page=" + page + "&txt_search=" + $('input#txt_search').val();
	}
</script>
</head>
<body>

	<!-- content -->
	<table>
		<tr>
			<td colspan="4">
				<input type="text" id="txt_search" value="${txt_search }"> 
				<input type="button" class="small" value="검색" onclick="javascript:PageMove(${paging.pageNo})">
			</td>
		</tr>
	</table>
	<div>
		<c:choose>
			<c:when test="${empty list }">
				<h3>-----------동물목록이 존재하지 않습니다.-----------</h3>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<div>
						<div>
							<img src="${dto.img }" alt="${dto.alt}">
						</div>	
						<ul>
							<li>${dto.name }</li>
						</ul>
						<p>
					 		${dto.grade }
						</p>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	
	<!-- Pagination -->
	<div>
		<a href="javascript:PageMove(${paging.firstPageNo})">&laquo;</a> 
		<a href="javascript:PageMove(${paging.prevPageNo})">&lt;</a>
		<c:forEach var="i" begin="${paging.startPageNo}"
			end="${paging.endPageNo}" step="1">
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

</body>
</html>