<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*, java.text.*"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id" />
	</sec:authorize>

	<form>
		<table border="1">	
			<tr>
				<th>봉사 제목</th>
				<td>${dto.caltitle }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${dto.calid }</td>
			</tr>
			<tr>
				<th>모집 기간</th>
				<td>${dto.calrecdate }</td>
			</tr>
			<tr>
				<th>모집 마감</th>
				<td>${dto.calrecdateend }</td>
			</tr>
			<tr>
				<th>봉사 활동 기간</th>
				<td>${dto.calvolundate }</td>
			</tr>
			<tr>
				<th>봉사 활동 종료</th>
				<td>${dto.calvolundateend }</td>
			</tr>
			<tr>
				<th>봉사 활동 내용</th>
				<td>${dto.calcontent }</td>
			</tr>
			<tr>
				<th>모집 인원</th>
				<td>${dto.calrecpeo }</td>
			</tr>
			<tr>
				<th>현재 신청 인원</th>
				<td>${dto.calnowpeo }</td>
			</tr>
			<tr>
				<td colspan="2">
					<c:choose>
	                 <c:when test="${dto.calrecpeo > dto.calnowpeo}">
				     	<c:if test="${voldto != null}">
							<input type="button" value="신청 취소하기" onclick="location.href='calcancel.do?seq=${dto.calnum }&caltitle=${dto.caltitle }&id=${user_id }'"/>
							<input type="button" value="돌아가기" onclick="location.href='calrecsel.do'">
							<input type="button" value="삭제하기" onclick="location.href='caldelete.do'">
						</c:if>
				  		<c:if test="${voldto == null}">
				   			<input type="button" value="봉사 신청하기" onclick="location.href='calapply.do?seq=${dto.calnum }&caltitle=${dto.caltitle }&id=${user_id }'"/>
				      		<input type="button" value="돌아가기" onclick="location.href='calrecsel.do'">
				     		<input type="button" value="삭제하기" onclick="location.href='caldelete.do'">
				    	</c:if>
	                 </c:when>
	                 <c:otherwise>
	                     <input type="button" value="모집 마감" onclick="location.href='calendar.do'">
	                 </c:otherwise>
	             </c:choose>
	    		
				</td>
			</tr>
		</table>
		
		<table border="1">
			<tr>
				<td>봉사 제목</td>
			</tr>
			<tr>
				<th>참가자</th>
			</tr>
			
			<c:forEach items="${list }" var="dto1">
				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<td>신청자 없음</td>
						</tr>
					</c:when>
					<c:when test="${dto.caltitle == dto1.voltitle }">
						<tr>
							<td>${dto1.voltitle }</td>
						</tr>
						<tr>
							<td>${dto1.volid }</td>
						</tr>
					</c:when>
					<c:otherwise>
					</c:otherwise>
					
				</c:choose>
			</c:forEach>
		</table>
	</form>

</body>
</html>