<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.image {
	width: 150px; 
	height: 100px;
}
ul {
	list-style: none;
}
dd {
	margin: 0 auto;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var pageNum = $("#pageNum").val();
		 $("#txt_search").keydown(function(key) {
             if (key.keyCode == 13) {
            	 PageMove(pageNum);
             }
         });
	});
	function PageMove(page) {
		location.href = "ani_alien.do?board=animal_alien_harm&page=" + page + "&txt_search=" + $('input#txt_search').val();
	}
</script>
</head>
<body>

<div>
	<div>
		<div>
			<button onclick="location.href='ani_alien.do?board=animal_alien_disturb'">생태교란종</button>
			<button disabled="disabled">위해우려종</button>
		</div>
		<!-- content -->
		<table class="form-group gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-5 filter hdpe">
			<tr>
				<td colspan="5">
					<input type="text" id="txt_search" value="${txt_search }" placeholder="생물종의 이름을 입력하세요."> 
					<input type="hidden" id="pageNum" value="${paging.pageNo }">
					<button type="button" class="btn btn-outline-dark" onclick="javascript:PageMove(${paging.pageNo})">검색</button>
				</td>
			</tr>
		</table>
		
		<div>
			> 검색결과 ( 총 ${totalCount }종)
		</div>
		
		<div>
			<c:choose>
				<c:when test="${empty list }">
					<h3>-----------동물목록이 존재하지 않습니다.-----------</h3>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<ul>
							<li>
								<img class="image" src="${dto.img }" alt="${dto.kor_name}">
							</li>
							<li>
								<dl>
									<dt>${dto.kor_name }</dt>
									<dd><span>영명 :</span>${dto.eng_name }</dd>
									<dd><span>분류군 :</span>${dto.groups }</dd>
									<dd><span>관리현황 :</span>${dto.management }</dd>
								</dl>
							</li>
						</ul>
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

</body>
</html>