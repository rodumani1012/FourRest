<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>


<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
<script src="dist/lang/summernote-ko-KR.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 400

		});
	});
</script>

</head>
<body>
	<form:form action="contest_write.do" modelAttribute="ContestBoardDto" method="post" >
		<input type="hidden" name="writer" value="test">
		<table>
			<tr>
				<td>제 목</td>
				<td><input type="text" name="title" style="width: 650px" /></td>
			</tr>
			<tr>
				<td>내 용</td>
				<td><textarea rows="10" cols="30" id="summernote"
						name="content" style="width: 650px; height: 350px;"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록" />
				<input type="button" value="작성 취소" onclick="location.href='contestboard.do'" />
				</td>
			</tr>
		</table>
</form:form>
</body>

</html>