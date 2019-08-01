<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>contestboard다</h1>

	<table class="que-tbl" border="1">
		<col width="100">
		<col width="300">
		<col width="100">
		<col width="100">
		<tr>
			<th>글번호</th>
			<th>제 목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<c:choose>
			<c:when test="${empty threelist }">
				<tr>
					<td colspan="5" style="text-align: center;">※ 123등글이
						존재하지않습니다.※</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${threelist }" var="threedto">
					<tr>
						<td class="tdcenter">${threedto.boardno }</td>
						<td><a href="contest_detail.do?boardno=${threedto.boardno }">${threedto.title }[${threedto.replyno }]</a></td>
						<td class="tdcenter">${threedto.writer }</td>
						<td class="tdcenter">${threedto.regdate }</td>
						<td class="tdcenter">${threedto.content}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="4" style="text-align: center;">※ 해당하는 글이 존재하지
						않습니다 ※</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td class="tdcenter">${dto.boardno }</td>
						<td><a href="contest_detail.do?boardno=${dto.boardno }">${dto.title }[${dto.replyno }]</a>
						</td>
						<td class="tdcenter">${dto.writer }</td>
						<td class="tdcenter">${dto.regdate }</td>
						<td class="tdcenter">${dto.content}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="5" style="text-align: right; padding-right: 10px;">
				<input type="button" value="글 작성"
				onclick="location.href='contest_Writteform.do'">
			</td>
		</tr>
	</table>

	<div class="paging">
		<c:if test="${pm.prev }">
			<a
				href="contest.do?contentnum=9&pagenum=${pm.pagenum-1}&condition=${con}">
				<span>◀</span>
			</a>
		</c:if>

		<c:forEach begin="${pag.startPage }" end="${pag.endPage }" var="idx">
			<c:choose>
				<c:when test="${pag.pagenum==idx}">
					<span id="now"><b><c:out value="【${idx }】"></c:out></b></span>
				</c:when>
				<c:otherwise>
					<a href="contest.do?contentnum=9&pagenum=${idx}"> <span
						id="notnow"><b><c:out value="【${idx }】"></c:out></b></span>
					</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pm.next }">
			<a
				href="contest.do?contentnum=9&pagenum=${pm.pagenum+1}&condition=${con}">
				<span>▶</span>
			</a>
		</c:if>

	</div>




</body>
</html>