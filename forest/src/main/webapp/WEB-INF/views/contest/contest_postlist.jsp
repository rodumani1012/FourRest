<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>contestboard다</h1>
	<form action="contest_postlist.do">
	<input type="hidden" name="pagenum" value="1">
	<input type="hidden" name="contentnum" value="6">
	<select name="conlistno">
		<c:forEach items="${conlist }" var="dto">
			<option value="${dto.boardno}">${dto.title}</option>
		</c:forEach>
	</select>
	<input type="submit" value="submit > ">
	</form>
		<hr> <h3>123등;</h3> <hr>
	<div id="3등까지보여줘">
		<c:choose>
			<c:when test="${empty threelist }">
				<div>
				※ 123등 글이 존재하지않습니다.※
				</div>				
			</c:when>
			<c:otherwise>
				<c:forEach items="${threelist }" var="threedto" varStatus="status" >
					<div>
						대표사진: ${threedto.reppic}
						순위 : ${status.count }
						평점/5 : ${threedto.likerate }
						번호 : ${threedto.boardno }
						제목 : <a href="contest_detail.do?boardno=${threedto.boardno }">${threedto.title }[${threedto.replyno }]</a>
						작성자 : ${threedto.writer }
						작성일 : <fmt:formatDate value="${threedto.regdate }" pattern="yyyy-MM-dd"/>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	<hr> <h3>아래부턴 리스트얌</h3> <hr>
	<div id="9개씩보여주자">
		<c:choose>
			<c:when test="${empty list }">
			<div id="게시물없음">게시물이없습니다.</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<div>
						글번호: ${dto.boardno }
						글제목:<a href="contest_detail.do?boardno=${dto.boardno }">${dto.title }[${dto.replyno }]</a>
						작성자:${dto.writer }
						작성일:<fmt:formatDate value="${dto.regdate }" pattern="yyyy-MM-dd"/>
						대표사진:${dto.reppic}
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>

		<div>
				<input type="button" value="글 작성" onclick="location.href='contest_Writteform.do'">
			</div>

		</div>
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