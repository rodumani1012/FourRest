<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Forest</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#muldelform").submit(function() {
			if ($("#muldelform input:checked").length == 0) {
				alert("삭제할 글을 하나 이상 체크해 주세요");
				return false;
			}

		});

		$("input[name=chk]")
				.click(
						function() {
							if ($("input[name=chk]").length == $("input[name=chk]:checked").length) {
								$("input[name=all]").prop("checked", true);
							} else {
								$("input[name=all]").prop("checked", false);
							}
						});

	});
</script>
<script type="text/javascript">
	function allChk(bool) {
		$("input[name=chk]").each(function() {
			$(this).prop("checked", bool);
		});
	}
</script>

</head>
<body>

<%@ include file="./header.jsp"%>
<br><br><br><br>
	<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id" />
	</sec:authorize>
<div class="container table-responsive">
	<h2>전체 목록</h2>
	<form action="muldel.do" method="post" id="muldelform">
	<c:choose>
		<c:when test="${empty list }">
			<h3>펀딩 정보가 없습니다.</h3>
			<button class="btn btn btn-light" type="button" onclick="location.href='main.do'">처음으로</button> 
			<button class="btn btn btn-light" type="button" onclick="location.href='insert.do'">등록하기</button>
		</c:when>
		<c:otherwise>
		<br><br><br><br><br><br><br><br><br><br>
			<table class="table table-bordered">
				<col width="30">
				<col width="100">
				<col width="200">
				<col width="150">
				<col width="150">
				<col width="200">
				<col width="180">
				<col width="300">
				<tr>
					<th><input type="checkbox" name="all" onclick="allChk(this.checked)" /></th>
					<th>번호</th>
					<th>펀딩 제목</th>
					<th>목표 모금액</th>
					<th>현재 모금액</th>
					<th>기간</th>
					<th>현재 참여 인원</th>
					<th>펀딩 내용</th>
				</tr>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td><input type="checkbox" name="funtitle" value="${dto.funtitle}" /></td>
						<td>${dto.fun_seq}</td>
						<td><a href="fundingdetail.do?funtitle=${dto.funtitle}">${dto.funtitle}</a></td>
						<td>${dto.goalmoney}</td>
						<td>${dto.nowmoney}</td>
						<td>${dto.fundate}</td>
						<td>${dto.participants}</td>
						<td>${dto.fun_content}</td>
					</tr>
				</c:forEach>
			</table>
				<input type="hidden" name="id" value="${user_id }" />
				<button class="btn btn btn-light" type="button" onclick="location.href='main.do'">처음으로</button> 
				<sec:authorize access="hasRole('ROLE_ADMIN')">
				<button class="btn btn btn-light" type="button" onclick="location.href='insert.do'">등록하기</button>
				<button class="btn btn btn-light" type="submit">선택삭제</button>
				</sec:authorize>
		</c:otherwise>
	</c:choose>
	 </form>
</div>
</body>
</html>