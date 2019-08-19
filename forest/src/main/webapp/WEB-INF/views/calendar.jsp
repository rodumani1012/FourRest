<%@page import="com.my.four.model.dto.CalendarDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='resources/assets/css/calcss/fullcalendar.css' rel='stylesheet' />
<link href='resources/assets/css/calcss/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='resources/assets/js/caljs/moment.min.js'></script>
<script src='resources/assets/js/caljs/jquery.min.js'></script>
<script src='resources/assets/js/caljs/fullcalendar.min.js'></script>
<script>

	$(document).ready(function() {
		
		
		$('#calendar').fullCalendar({
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month'
			},
			defaultDate : '2019-08',
			editable : false,
			eventLimit : true, // allow "more" link when too many events
			
			events : [
				<c:forEach items="${list }" var="dto">
					{
	    			title : '${dto.caltitle }',
	            	start : "${dto.calrecdate }",
					},
	    	    </c:forEach>
			],

 			eventClick:function(event) {
 				var title = event.title;
				location.href='caldetail.do?caltitle=' + title;
            } 

		});
		
		<c:forEach items="${list }" var="dto">
			$(".fc-day-grid-event").attr("title=", "abc");
   		 </c:forEach>
		
		
	});
	
	
</script>
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}

.fc-event {
	position: relative; /* for resize handle and other inner positioning */
	display: block; /* make the <a> tag block */
	font-size: .85em;
	line-height: 1.3;
	border-radius: 3px;
	border: 1px solid #3a87ad; /* default BORDER color */
	background-color: #3a87ad; /* default BACKGROUND color */
	font-weight: normal; /* undo jqui's ui-widget-header bold */
}

.fc-event[title='Y'] {
	background-color: #3a87ad;
}
.fc-event[title='N'] {
	background-color: #C0C0C0;
}
</style>
</head>
<body>

	<div id='calendar'></div>
	<input type="button" value="봉사활동 등록" onclick="location.href='calinsert.do'">

</body>
</html>