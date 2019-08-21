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
		var groupsName = $("#groupsName").val();
		 $("#txt_search").keydown(function(key) {
             if (key.keyCode == 13) {
            	 PageMove(pageNum, groupsName);
             }
         });
	});
	
	function PageMove(page, groups) {
 		location.href = "ani_alien.do?board=animal_alien_disturb&groups="+ groups +"&page=" + page + "&txt_search=" + $('input#txt_search').val();
	}
	
	function del(){
		$("#txt_search").val('');
	}
	
</script>
</head>
<body>
<div>
	<div>
		<div>
			<button disabled="disabled">생태교란종</button>
			<button onclick="location.href='ani_alien.do?board=animal_alien_harm&txt_search='">위해우려종</button>
		</div>
		<!-- content -->
		<table class="form-group gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-5 filter hdpe">
			<tr>
				<td colspan="5">
					<input type="text" id="txt_search" value="${txt_search }" placeholder="생물종의 이름을 입력하세요."> 
					<button type="button" class="btn btn-outline-dark" onclick="javascript:PageMove(${paging.pageNo}, ${groups })">검색</button>
					<button type="button" class="btn btn-outline-dark" onclick="del()">초기화</button>
					<input type="hidden" id="pageNum" value="${paging.pageNo }">
					<input type="hidden" id="groupsName" value="${groups }">
				</td>
			</tr>
		</table>
		
		<div>
			<table>
				<tr>
					<td>
						<a href="javascript:PageMove(${paging.pageNo}, 'all')">
						<c:choose>
							<c:when test="${groups eq 'all'}">
								<img alt="전체" src="resources/assets/images/animal/all_click.png" >
							</c:when>
							<c:otherwise>
								<img alt="전체" src="resources/assets/images/animal/all.png">
							</c:otherwise>
						</c:choose>
							<p>전체</p>
						</a>
					</td>
					<td>
						<a href="javascript:PageMove(${paging.pageNo}, 'mammal')">
						<c:choose>
							<c:when test="${groups eq 'mammal'}">
								<img alt="포유류" src="resources/assets/images/animal/mammal_click.png">
							</c:when>
							<c:otherwise>
								<img alt="포유류" src="resources/assets/images/animal/mammal.png">
							</c:otherwise>
						</c:choose>
							<p>포유류</p>
						</a>
					</td>
					<td>
						<a href="javascript:PageMove(${paging.pageNo}, 'birds')">
						<c:choose>
							<c:when test="${groups eq 'birds'}">
								<img alt="조류" src="resources/assets/images/animal/birds_click.png">
							</c:when>
							<c:otherwise>
								<img alt="조류" src="resources/assets/images/animal/birds.png">
							</c:otherwise>
						</c:choose>
							<p>조류</p>
						</a>
					</td>
					<td>
						<a href="javascript:PageMove(${paging.pageNo}, 'reptile')">
						<c:choose>
							<c:when test="${groups eq 'reptile'}">
								<img alt="파충류" src="resources/assets/images/animal/reptile_click.png">
							</c:when>
							<c:otherwise>
								<img alt="파충류" src="resources/assets/images/animal/reptile.png">
							</c:otherwise>
						</c:choose>
							<p>파충류</p>
						</a>
					</td>
					<td>
						<a href="javascript:PageMove(${paging.pageNo}, 'amphibian')">
						<c:choose>
							<c:when test="${groups eq 'amphibian'}">
								<img alt="양서류" src="resources/assets/images/animal/amphibian_click.png">
							</c:when>
							<c:otherwise>
								<img alt="양서류" src="resources/assets/images/animal/amphibian.png">
							</c:otherwise>
						</c:choose>
							<p>양서류</p>
						</a>
					</td>
					<td>
						<a href="javascript:PageMove(${paging.pageNo}, 'fish')">
						<c:choose>
							<c:when test="${groups eq 'fish'}">
								<img alt="어류" src="resources/assets/images/animal/fish_click.png">
							</c:when>
							<c:otherwise>
								<img alt="어류" src="resources/assets/images/animal/fish.png">
							</c:otherwise>
						</c:choose>
							<p>어류</p>
						</a>
					</td>
					<td>
						<a href="javascript:PageMove(${paging.pageNo}, 'insect')">
						<c:choose>
							<c:when test="${groups eq 'insect'}">
								<img alt="곤충" src="resources/assets/images/animal/insect_click.png">
							</c:when>
							<c:otherwise>
								<img alt="곤충" src="resources/assets/images/animal/insect.png">
							</c:otherwise>
						</c:choose>
							<p>곤충</p>
						</a>
					</td>
					<td>
						<a href="javascript:PageMove(${paging.pageNo}, 'invertebrate')">
						<c:choose>
							<c:when test="${groups eq 'invertebrate'}">
							<img  alt="무척추동물" src="resources/assets/images/animal/invertebrate_click.png">
							</c:when>
							<c:otherwise>
							<img  alt="무척추동물" src="resources/assets/images/animal/invertebrate.png">
							</c:otherwise>
						</c:choose>
							<p>무척추동물</p>
						</a>
					</td>
					<td>
						<a href="javascript:PageMove(${paging.pageNo}, 'plants')">
						<c:choose>
							<c:when test="${groups eq 'plants'}">
							<img alt="식물" src="resources/assets/images/animal/plants_click.png">
							</c:when>
							<c:otherwise>
							<img alt="식물" src="resources/assets/images/animal/plants.png">
							</c:otherwise>
						</c:choose>
							<p>식물</p>
						</a>
					</td>
				</tr>
			</table>
		</div>
		
		
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
									<dd><span>영명 : </span>${dto.eng_name }</dd>
									<dd><span>분류군 : </span>${dto.groups }</dd>
									<dd><span>관리현황 : </span>${dto.management }</dd>
									<c:if test="${dto.country ne 'NA' }">
										<dd><span>원산지 : </span>${dto.country }</dd>
									</c:if>
								</dl>
							</li>
						</ul>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		
		<!-- Pagination -->
		<div class="pagination pagination-md justify-content-center">
			<a class="page-link" href="javascript:PageMove(${paging.firstPageNo}, '${groups }')">&laquo;</a> 
			<a class="page-link" href="javascript:PageMove(${paging.prevPageNo}, '${groups }')">&lt;</a>
			<c:forEach var="i" begin="${paging.startPageNo}"
				end="${paging.endPageNo}" step="1">
				<c:choose>
					<c:when test="${i eq paging.pageNo}">
						<a class="page-link" href="javascript:PageMove(${i}, '${groups }')">${i}</a>
					</c:when>
					<c:otherwise>
						<a class="page-link" href="javascript:PageMove(${i}, '${groups }')">${i}</a>
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