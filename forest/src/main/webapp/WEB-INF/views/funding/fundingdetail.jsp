<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Forest</title>
</head>
<body>

	<%@ include file="../header.jsp"%>	
	<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id" />
	</sec:authorize>
<div class="container form-horizontal table-responsive">
	<form action="fundingpay.do" method="post">
	<br><br><br><br><br><br>
		<div class="form-group form-group-lg form-inline">
			<input class="form-control form-control-lg" type="text" name="funtitle" value="${dto.funtitle }" readonly="readonly" />
		 </div>	
	<table class="table table-bordered">	
		<tr>
			<th>목표 모금액</th>
			<td>${dto.goalmoney }</td>
		</tr>
		<tr>
			<th>현재 모금액</th>
			<td>${dto.nowmoney }</td>
		</tr>
		<tr>
			<th>기간</th>
			<td>${dto.fundate }</td>
		</tr>
		<tr>
			<th>현재 참여 인원</th>
			<td>${dto.participants }</td>
		</tr>
		<tr>
			<th>펀딩 내용</th>
			<td>${dto.fun_content }</td>
		</tr>
		<tr>
			<td colspan="2">
			
    		<c:choose>
        		<c:when test="${dto.goalmoney > dto.nowmoney}">
            		<button class="btn btn btn-light" type="submit" value="후원하기">후원하기</button>
            		<button class="btn btn btn-light" type="button" value="돌아가기" onclick="location.href='funlist.do'">돌아가기</button>
        		</c:when>
        		<c:otherwise>
            		<button class="btn btn btn-light" type="button" value="종료된 후원입니다." onclick="location.href='funlist.do'">종료된 후원입니다</button>
        		</c:otherwise>
    		</c:choose>
    		
			</td>
		</tr>
	</table>
	</form>
</div>
</body>
</html>