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
</style>
<script type="text/javascript">
	function PageMove(page) {
		location.href = "ani_alien.do?board=animal_alien_disturb&page=" + page + "&txt_search=" + $('input#txt_search').val();
	}
</script>
</head>
<body>

<div>
	<div>
		<div>
			<button disabled="disabled">생태교란종</button>
			<button onclick="location.href='ani_alien.do?board=animal_alien_harm'">위해우려종</button>
		</div>
		<!-- content -->
		<table>
			<tr>
				<td colspan="5">
					<input type="text" id="txt_search" value="${txt_search }" placeholder="생물종의 이름을 입력하세요."> 
					<button type="button" onclick="javascript:PageMove(${paging.pageNo})">검색</button>
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
								<img class="image" src="${dto.img }" alt="${dto.korName}">
							</li>
							<li>
								<dl>
									<dt>${dto.korName }</dt>
									<dd><span>영명 :</span>${dto.engName }</dd>
									<dd><span>분류군 :</span>${dto.groups }</dd>
									<dd><span>관리현황 :</span>${dto.management }</dd>
									<c:if test="${dto.country ne null }">
										<dd><span>원산지 :</span>${dto.country }</dd>
									</c:if>
								</dl>
							</li>
						</ul>
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
	</div>
</div>

</body>
</html>