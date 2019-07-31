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
<body>
	
<!-- 	<form action="ani_saveDb.do" method="post"> -->
<!-- 	<input type="submit" value="db저장하기"> -->
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
		<!-- 	</form> -->
		<div>
			<c:if test="${pag.prev }">
				<div onclick="location.href='boardController.do?command=selectlist&contentnum=3&pagenum=${pag.pagenum-1}'">◀</div>
			</c:if>
			<c:forEach begin="${pag.startPage }" end="${pag.endPage }" var="idx">
				<c:choose>
					<c:when test="${pag.pagenum == idx}">
						<span><b><c:out value="【${idx }】"></c:out></b></span>
					</c:when>
					<c:otherwise>
						<a
							href="boardController.do?command=selectlist&contentNum=3&pageNum=${idx}">
							<span><b><c:out value="【${idx }】"></c:out></b></span>
						</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pag.next }">
				<div onclick="location.href='boardController.do?command=selectlist&contentnum=3&pagenum=${pag.pagenum+1}'"></div>
			</c:if>
		</div>

</body>
</html>