<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Forest</title>
<style type="text/css">
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
</style>
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
$(function(){
	$('#selectPeople').change(function(){
		$('#selectPeople option:selected').each(function () {
			if ($(this).val() == '0') { // 직접입력인 경우
				$('#calrecpeo').val('');
				$('#calrecpeo').prop('readonly', false);
			} else {
				$('#calrecpeo').val($(this).text());
				$('#calrecpeo').prop('readonly', true);
			}
		});
	});	
})

</script>
</head>
<body>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.username" var="user_id" />
	</sec:authorize>
<%@ include file="../header.jsp"%>
<br><br><br><br><br>
<div class="container row mx-auto">
	<form action="calinsertres.do" method="post">
			<input type="hidden" name="calid" value="${user_id }">
		<table class="table table-bordered col-lg-12 col-lg-12">
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
				<td>
					<input type="number" name="calrecpeo" id="calrecpeo">
					<select id="selectPeople">
						<option value="0" selected>직접입력</option>
						<c:forEach begin="1" end="10" varStatus="status">
							<option value="${status.index }">${status.index }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button class="btn btn-outline-dark" type="submit">봉사등록</button>
					<button class="btn btn-outline-dark" type="button"onclick="location.href='calendar.do'">취소</button>
				</td>
			</tr>
		</table>
	</form>
</div>	
</body>
</html>