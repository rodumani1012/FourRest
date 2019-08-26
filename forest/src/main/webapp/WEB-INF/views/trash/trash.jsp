<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trash</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<div class="container table-responsive">
			<h3>쓰레기들의 분해기간</h3>
		<div class="row">
			<table class="pull-center col-lg-6 table table-bordered table-condensed ">

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
			<br><br><br><br>
		</div>
	</div>
</body>
</html>