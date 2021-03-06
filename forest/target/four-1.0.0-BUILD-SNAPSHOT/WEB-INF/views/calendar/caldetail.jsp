<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	var arlist = new Array();
	
</script>
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
				<th>봉사 활동 기간</th>
				<td>${dto.calvolundate }</td>
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
	        		<c:choose>
		        		<c:when test="${empty list }">
		        			<label>없을때</label>
		        			<input type="button" value="봉사 신청하기" onclick="location.href='calapply.do?caltitle=${dto.caltitle }&id=${user_id }'"/>
		            		<input type="button" value="돌아가기" onclick="location.href='calendar.do'">
		            		<input type="button" value="삭제하기" onclick="location.href='caldelete.do?caltitle=${dto.caltitle}&id=${user_id }'">
		        		</c:when>
	        		</c:choose>
	        			<c:forEach items="${list }" var="dto1">
	        				<c:set var="compare" value="${fn:contains(dto1.volid, user_id)"/>
	        				arlist.push("${compare }")
	        			</c:forEach>
	        				<c:choose>
							<c:when test="${fn:contains(arlist, true) }">
								<label>${arlist }</label>
								<label>${fn:contains(arlist, true) }</label>
								<input type="button" value="신청 취소하기" onclick="location.href='calcancel.do?caltitle=${dto.caltitle }&id=${user_id }'"/>
	            				<input type="button" value="돌아가기" onclick="location.href='calendar.do'">
	            				<input type="button" value="삭제하기" onclick="location.href='caldelete.do'">
							</c:when>
							<c:otherwise>
								<label>${arlist }</label>
								<label>${fn:contains(arlist, true) }</label>
								<input type="button" value="봉사 신청하기" onclick="location.href='calapply.do?caltitle=${dto.caltitle }&id=${user_id }'"/>
	            				<input type="button" value="돌아가기" onclick="location.href='calendar.do'">
	            				<input type="button" value="삭제하기" onclick="location.href='caldelete.do'">
							</c:otherwise>
							</c:choose>
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