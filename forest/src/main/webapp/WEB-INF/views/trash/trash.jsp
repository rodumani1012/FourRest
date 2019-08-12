<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trash</title>
</head>
<body>
	<h1>쓰레기</h1>
	<table border="1">
		
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="4">목록이 없습니다---------------</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
				<tr>
					<td><img alt="img" src="${dto.imgRef }"></td>
					<td>${dto.trashName }</td>
					<td>${dto.trashLife }</td>
				</tr>
				
				</c:forEach>
			</c:otherwise>
		</c:choose>
	
	</table>

</body>
</html>