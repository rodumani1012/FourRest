<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
//입력 날짜 체크
function checkRqDate() {

	var calrecdate = $("#calrecdate").val().split('-');
	var a = calrecdate[0]+""+calrecdate[1]+""+calrecdate[2];
	
	var calrecdateend = $("#calrecdateend").val().split('-');
	var b = calrecdateend[0]+""+calrecdateend[1]+""+calrecdateend[2];

	if(a > b){
		alert("모집 시작일이 모집 종료일보다 큽니다");
	}
}

function checkRqDate1() {

	var calvolundate = $("#calvolundate").val().split('-');
	var a = calvolundate[0]+""+calvolundate[1]+""+calvolundate[2];
	
	var calvolundateend = $("#calvolundateend").val().split('-');
	var b = calvolundateend[0]+""+calvolundateend[1]+""+calvolundateend[2];

	if(a > b){
		alert("봉사 시작일이 봉사 종료일보다 큽니다");
	}
}
	
</script>
</head>
<body>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.username" var="user_id" />
	</sec:authorize>

	<form action="calinsertres.do" method="post">
		<table border="1">
			<tr>
				<th>봉사 제목</th>
				<td><input type="text" name="caltitle"></td>
			</tr>
			<tr>
				<th>봉사 모집 기간</th>
				<td><input type="date" id="calrecdate" name="calrecdate"></td>
			</tr>
			<tr>
				<th>봉사 모집 종료 기간</th>
				<td><input type="date" id="calrecdateend" name="calrecdateend" onchange="javascript:checkRqDate(this);"></td>
			</tr>
			<tr>
				<th>봉사 활동 기간</th>
				<td><input type="date" id="calvolundate" name="calvolundate"></td>
			</tr>
			<tr>
				<th>봉사 활동 종료 기간</th>
				<td><input type="date" id="calvolundateend" name="calvolundateend" onchange="javascript:checkRqDate1(this);"></td>
			</tr>
			<tr>
				<th>봉사 내용</th>
				<td><textarea rows="10" cols="60" name="calcontent"></textarea></td>
			</tr>
			<tr>
				<th>모집 인원</th>
				<td><input type="text" name="calrecpeo"></td>
			</tr>
			<input type="hidden" name="calid" value=${user_id }>
			<tr>
				<td colspan="2"><input type="submit" value="봉사등록"> <input
					type="button" value="취소" onclick="location.href='calendar.do'"></td>
			</tr>
		</table>
	</form>
</body>
</html>