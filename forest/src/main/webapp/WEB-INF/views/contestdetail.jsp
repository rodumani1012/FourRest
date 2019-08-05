<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>

<script src="dist/lang/summernote-ko-KR.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 300
		});
	});
</script>
<style type="text/css">
#Updateform {
	display: none;
}

table {
	border-style: solid;
}
</style>
<title>Insert title here</title>

</head>

<body>
	<div id="Detailform">
		<table class="que-tbl table">
			<col width="20px">
			<col width="600px">
			<tr>
				<th>글 번호</th>
				<td>${dto.boardno }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${dto.writer }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${dto.regdate }</td>
			</tr>
			<tr>
				<th>제 목</th>
				<td>${dto.title }</td>
			</tr>
			<tr height="300px">
				<th>내 용</th>
				<td>${dto.content }</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="글수정"
					onclick="showUp()"> <input type="button" value="글삭제"
					onclick="location.href='contest_delete.do?groupno=${dto.groupno}'">
					<input type="button" value="목록으로"
					onclick="location.href='recipeController.do?command=queboardlist&pagenum=1&contentnum=10&opt=5&condition=0'">
				</td>
			</tr>
		</table>
		<div class="reply"></div>
	</div>

	<div id="Updateform">
		<form action="contest_update.do" method="post">
			<input type="hidden" name="boardno" value="${dto.boardno }">
			<input type="hidden" name="groupno" value="${dto.groupno}">
			<table class="que-tbl">
				<tr>
					<th>글 번호</th>
					<td>${dto.boardno }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${dto.writer }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${dto.regdate }</td>
				</tr>
				<tr>
					<th>제 목</th>
					<td><input type="text" name="title" value="${dto.title }">
					</td>
				</tr>
				<tr>
					<th>내 용</th>
					<td><textarea name="content" id="summernote" rows="10"
							cols="100">${dto.content }</textarea></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="submit" id="savebutton" value="수정확인"> 
					<input type="button" value="수정취소" onclick="showBack()"> 
					<input type="button" value="목록으로" onclick="location.href='contest.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<hr>
	<form action="replyform.do" method="post">
		<input type="hidden" name="parentno" value="${dto.boardno }">
		<input type="hidden" name="groupnoReply" value="${dto.groupno}">
		<table class="que-tbl2">
			<tr>
				<th colspan="2">&nbsp;&nbsp;답변달 글 : ${dto.boardno } 작성자 : <input
					type="text" style="width: 100px" name="writerReply"
					value="${ldto.id }" readonly="readonly"> 제 목 : <input
					type="text" style="width: 150px" name="titleReply" value=" re."><input
					type="submit" value="답변등록" style="float: right;"></th>
			</tr>
			<tr>
				<td><textarea rows="10" cols="100" name="contentReply"
						placeholder="답변을 작성해 주세요"></textarea></td>
			</tr>
		</table>
	</form>
	<hr>
	<table class="que-tbl2">
		<c:choose>
			<c:when test="${empty listReply }">
				<tr>
					<td colspan="4"><i class="far fa-sticky-note"></i>답변을 기다려주세요</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${listReply }" var="dtoReply">
					<tr>
						<th>댓글제목:${dtoReply.title } 작성자: ${dtoReply.writer }</th>
					</tr>
					<tr>
						<th align="right">${dtoReply.regdate }<input type="button"
							value="삭제"
							onclick="location.href='recipeController.do?command=queDeleteReply&groupno=${dto.groupno }&boardno=${dtoReply.boardno}&pboardno=${dto.boardno}'">
						</th>
					</tr>
					<tr>
						<td><textarea rows="5" cols="100">${dtoReply.content }</textarea></td>
					</tr>

				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#summernote').summernote();
		});

		function showUp() {
			$("#Detailform").hide();
			$("#Updateform").show();

		}

		function showBack() {
			$("#Updateform").hide();
			$("#Detailform").show();
		}
	</script>


</body>
</html>
