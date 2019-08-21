<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>달력</title>

<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding|Nanum+Myeongjo&display=swap"
	rel="stylesheet">
<link href="resources/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<script src="https://use.fontawesome.com/07b0ce5d10.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet" href="resources/assets/css/admincal.css" />
<style type="text/css">
</style>
</head>
<%@ page import="java.util.*, java.text.*"%>

<%
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
	String today = formatter.format(new java.util.Date());
%>
<body>

	<!--=============================NAVIGATION =============================-->

	<!--top nav start=======-->
	<nav class="navbar navbar-inverse top-navbar" id="top-nav">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="" href="admin.do"><img align="left"
					src="resources/image/logowhite.png" alt="로곤디" width="103"
					height="49"></a> <a href="javascript:;" class="sidebar-toggle">
					<i class="fa fa-bars"></i>
				</a> <span class="close-btn" id="hide-btn"><i class="fa fa-times"
					aria-hidden="true"></i></span>
			</div>

			<ul class="social-icon pull-right list-inline">

				<li class="dropdown"><a class="messages-link dropdown-toggle"
					data-toggle="dropdown" href="#"><span
						class="glyphicon glyphicon-envelope"></span> <span class="number">4</span>
						<span class="caret"></span></a>
				</li>
				<li class="dropdown"><a class="alerts-link dropdown-toggle"
					data-toggle="dropdown" href="#"><span
						class="glyphicon glyphicon-bell"></span> <span class="number">6</span>
						<span class="caret"></span></a>
				</li>
				<li class="dropdown"><a class="tasks-link dropdown-toggle"
					data-toggle="dropdown" href="#"><span
						class="glyphicon glyphicon-th-list"></span> <span class="number">11</span>
						<span class="caret"></span></a>
				</li>
				<li class="dropdown"><a class="user-link dropdown-toggle"
					data-toggle="dropdown" href="#"><span
						class="glyphicon glyphicon-user"></span> <span class="caret"></span></a>
				</li>
			</ul>
		</div>
	</nav>
	<!--    top nav end===========-->
	<br>
	<div class="container">
		<div class="row text-center" style="display: block; background-color:#f5f5f5; ">
			<h3>봉사일정관리</h3>
			<br>
		</div>
		<br>
		<div class="row">
			<div class="col-md-6">
				<div class="schedule-warp">
					<table id="calendar" align="center" style="border-color: #e5e5e5">
						<tr>
							<!-- label은 마우스로 클릭을 편하게 해줌 -->
							<td><label onclick="prevCalendar()"><</label></td>
							<td align="center" id="tbCalendarYM" colspan="5">yyyy년 m월</td>
							<td><label onclick="nextCalendar()">> </label></td>
						</tr>
						<tr>
							<td align="center"><font color="#F79DC2"/>일</td>
							<td align="center">월</td>
							<td align="center">화</td>
							<td align="center">수</td>
							<td align="center">목</td>
							<td align="center">금</td>
							<td align="center"><font color="skyblue"/>토</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-md-6">
				<div class="schedule-warp">
					<div class="pull-right">
						<button type="button" class="btn btn-success btn-filter"
							data-target="pagado">일정완료</button>
						<button type="button" class="btn btn-warning btn-filter"
							data-target="pendiente">일정수정</button>
						<button type="button" class="btn btn-danger btn-filter"
							data-target="cancelado">일정취소</button>
						<button type="button" class="btn btn-default btn-filter"
							data-target="all">일정추가</button>
					</div>
					<div class="day-one">DAY 2: September 22 (Saturday)</div>
					<div class="schedule-card">
						<div class="insidebox">
							<span class="schedule-tag">8:00 AM</span> <span
								class="schedule-start">Check-In, On-Site Hacking Starts</span>
						</div>
					</div>

					<div class="schedule-card">
						<div class="insidebox">
							<span class="schedule-tag">8:30 AM</span> <span
								class="schedule-start">Running Brunch</span>
						</div>
					</div>

					<div class="schedule-card">
						<div class="insidebox">
							<span class="schedule-tag">1:00 PM</span> <span
								class="schedule-start"> Lunch</span>
						</div>
					</div>

					<div class="schedule-card">
						<div class="insidebox">
							<span class="schedule-tag">5:00 PM</span> <span
								class="schedule-start"> Project Presentations, Judging,
								Awards, Closing Ceremony</span>
						</div>
					</div>

					<div class="schedule-card">
						<div class="insidebox">
							<span class="schedule-tag">5:30 PM</span> <span
								class="schedule-start">On-Site Hacking Ends</span>
						</div>
					</div>

					<div class="schedule-card">
						<div class="insidebox">
							<span class="schedule-tag">6:00 PM</span> <span
								class="schedule-start">Go home and rest!</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

<script type="text/javascript">
	var today = new Date();//오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
	var date = new Date();//today의 Date를 세어주는 역할
	function prevCalendar() {//이전 달
		// 이전 달을 today에 값을 저장하고 달력에 today를 넣어줌
		//today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
		//getMonth()는 현재 달을 받아 오므로 이전달을 출력하려면 -1을 해줘야함
		today = new Date(today.getFullYear(), today.getMonth() - 1, today
				.getDate());
		buildCalendar(); //달력 cell 만들어 출력 
	}

	function nextCalendar() {//다음 달
		// 다음 달을 today에 값을 저장하고 달력에 today 넣어줌
		//today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
		//getMonth()는 현재 달을 받아 오므로 다음달을 출력하려면 +1을 해줘야함
		today = new Date(today.getFullYear(), today.getMonth() + 1, today
				.getDate());
		buildCalendar();//달력 cell 만들어 출력
	}
	function buildCalendar() {//현재 달 달력 만들기
		var doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
		//이번 달의 첫째 날,
		//new를 쓰는 이유 : new를 쓰면 이번달의 로컬 월을 정확하게 받아온다.     
		//new를 쓰지 않았을때 이번달을 받아오려면 +1을 해줘야한다. 
		//왜냐면 getMonth()는 0~11을 반환하기 때문
		var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
		//이번 달의 마지막 날
		//new를 써주면 정확한 월을 가져옴, getMonth()+1을 해주면 다음달로 넘어가는데
		//day를 1부터 시작하는게 아니라 0부터 시작하기 때문에 
		//대로 된 다음달 시작일(1일)은 못가져오고 1 전인 0, 즉 전달 마지막일 을 가져오게 된다
		var tbCalendar = document.getElementById("calendar");
		//날짜를 찍을 테이블 변수 만듬, 일 까지 다 찍힘
		var tbCalendarYM = document.getElementById("tbCalendarYM");
		//테이블에 정확한 날짜 찍는 변수
		//innerHTML : js 언어를 HTML의 권장 표준 언어로 바꾼다
		//new를 찍지 않아서 month는 +1을 더해줘야 한다. 
		tbCalendarYM.innerHTML = today.getFullYear() + "년 "
				+ (today.getMonth() + 1) + "월";

		/*while은 이번달이 끝나면 다음달로 넘겨주는 역할*/
		while (tbCalendar.rows.length > 2) {
			//열을 지워줌
			//기본 열 크기는 body 부분에서 2로 고정되어 있다.
			tbCalendar.deleteRow(tbCalendar.rows.length - 1);
			//테이블의 tr 갯수 만큼의 열 묶음은 -1칸 해줘야지 
			//30일 이후로 담을달에 순서대로 열이 계속 이어진다.
		}
		var row = null;
		row = tbCalendar.insertRow();
		//테이블에 새로운 열 삽입//즉, 초기화
		var cnt = 0;// count, 셀의 갯수를 세어주는 역할
		// 1일이 시작되는 칸을 맞추어 줌
		for (i = 0; i < doMonth.getDay(); i++) {
			/*이번달의 day만큼 돌림*/
			cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
			cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
		}
		/*달력 출력*/
		for (i = 1; i <= lastDate.getDate(); i++) {
			//1일부터 마지막 일까지 돌림
			cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
			cell.innerHTML = i;//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
			cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
			if (cnt % 7 == 1) {/*일요일 계산*/
				//1주일이 7일 이므로 일요일 구하기
				//월화수목금토일을 7로 나눴을때 나머지가 1이면 cnt가 1번째에 위치함을 의미한다
				cell.innerHTML = "<font color=#F79DC2>" + i
				//1번째의 cell에만 색칠
			}
			if (cnt % 7 == 0) {/* 1주일이 7일 이므로 토요일 구하기*/
				//월화수목금토일을 7로 나눴을때 나머지가 0이면 cnt가 7번째에 위치함을 의미한다
				cell.innerHTML = "<font color=skyblue>" + i
				//7번째의 cell에만 색칠
				row = calendar.insertRow();
				//토요일 다음에 올 셀을 추가
			}
			/*오늘의 날짜에 노란색 칠하기*/
			if (today.getFullYear() == date.getFullYear()
					&& today.getMonth() == date.getMonth()
					&& i == date.getDate()) {
				//달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
				cell.bgColor = "#fddfbd";//셀의 배경색을 노랑으로 
			}
			if (i == 25) {
				cell.bgColor = "pink";
			}

		}
	}
</script>
<script language="javascript" type="text/javascript">
	buildCalendar();//
</script>

<script src="resources/assets/js/vendor/jquery-1.11.2.min.js"></script>
<script src="resources/assets/js/vendor/bootstrap.min.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		$(".sidebar-toggle").click(function() {
			$(this).hide();

			$("#user-profil").show();

			$("#hide-btn").show();

			$(".container-2").css("width", "85%");

		});

		$("#hide-btn").click(function() {
			$(this).hide();

			$("#user-profil").hide();

			$(".sidebar-toggle").show();

			$(".container-2").css("width", "100%");

		});
	});
</script>
</html>
