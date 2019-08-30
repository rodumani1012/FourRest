<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Forest</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
		location.href = "freeboardlist.do?category=" + $('#category').val() + "&page=" + page + "&txt_search=" + $('input#txt_search').val();
	}
</script>
</head>
<body>

	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.username" var="user_id" />
	</sec:authorize>

	<!-- Main -->
	<%@ include file="../header.jsp"%>
	<div id="main" class="wrapper style1">

		<section class="container">
			<br> <br> <br> <br> <br>
			<div class="row">
				<span class="pull-left">총 ${totalCount } 건</span>
				<c:choose>
					<c:when test="${empty list }">
						<table class="table table-bordered">
							<col width="40px" />
							<col width="200px" />
							<col width="100px" />
							<col width="100px" />
							<tr>
								<th>글번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
							<tr>
								<td colspan="4">게시물이 없습니다.</td>
							</tr>
						</table>
					</c:when>
					<c:otherwise>
						<table class="table table-bordered">
							<col width="40px" />
							<col width="200px" />
							<col width="100px" />
							<col width="100px" />
							<tr>
								<th>글번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>

							<c:forEach items="${list }" var="dto" varStatus="status">
								<tr>
									<td>${status.index + 1 }</td>
									<td><a href="freedetail.do?free_seq=${dto.free_seq }">${dto.title }</a>
									</td>
									<td>${dto.id }</td>
									<td><fmt:formatDate value="${dto.free_date }"
											pattern="yyyy-MM-dd HH:MM" /></td>
								</tr>
							</c:forEach>
						</table>
					</c:otherwise>
				</c:choose>
				<c:if test="${user_id != null}">
				<div class="container-fluid">
					<button class="btn btn btn-light pull-right" type="button"
						onclick="location.href='freeinsert.do'">글 작성하기</button>
				</div>		
				</c:if>
				<div class="container">
					<!-- Pagination -->
					<div class="pagination pagination-md justify-content-center">
						<a class="page-link"
							href="javascript:PageMove(${paging.firstPageNo})">&laquo;</a> <a
							class="page-link"
							href="javascript:PageMove(${paging.prevPageNo})">&lt;</a>
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
						<a class="page-link"
							href="javascript:PageMove(${paging.nextPageNo})">&gt;</a> <a
							class="page-link"
							href="javascript:PageMove(${paging.finalPageNo})">&raquo;</a>
					</div>
				</div>
				<!-- 검색 -->
				<br><br><br>
				<div class="container-fluid">
					<table class="mx-auto">
						<tr>
							<td colspan="4">
								<div class="form-group form-inline">
									<select class="form-control" id="category">
										<option value="all">전체</option>
										<option value="title">제목</option>
										<option value="content">내용</option>
										<option value="writer">글쓴이</option>
									</select>
									<input type="text" class="form-control" id="txt_search" value="${txt_search }" style="width: 340px; margin-right: 15px; margin-left: 15px;"> 			
									<input type="hidden" id="pageNum" value="${paging.pageNo }">
									<button type="button" class="small btn btn-secondary" onclick="javascript:PageMove(${paging.pageNo})">검색하기</button>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</section>
	</div>

</body>
</html>