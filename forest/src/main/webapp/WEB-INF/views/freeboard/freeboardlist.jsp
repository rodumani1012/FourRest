<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Forest</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	
	<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id" />
	</sec:authorize>

	<!-- Main -->
<div id="main" class="wrapper style1">
	<section class="container">
	<div class="row">

	<form action="freeboard.do" method="post" id="muldelform">
		
		<c:choose>
			<c:when test="${empty list }">
				<h3>게시물이 없습니다.</h3>
			</c:when>
			<c:otherwise>
				<table border="1">
					<col width="40px"/>
					<col width="200px"/>
					<col width="100px"/>
					<col width="100px"/>
		
					<tr>	
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
					
					<c:forEach items="${list }" var="dto" varStatus="status">
						<tr>
							<td>
								${status.index }
							</td>
							<td>
								<a href="freedetail.do?free_seq=${dto.free_seq }">${dto.title }</a>
							</td>
							<td>
								${dto.id }
							</td>
							<td>
								<fmt:formatDate value="${dto.free_date }" pattern="yyyy-MM-dd"/>
							</td>
						</tr>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
		
		
		
	<c:if test="${user_id != null}">
		<button class="btn btn btn-light" type="button" onclick="location.href='freeinsert.do'">글 작성하기</button> 
	</c:if>
	</form>
	
	</div>
	</section>
</div>

</body>
</html>