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
			editable : true,
			eventLimit : true, // allow "more" link when too many events
			
			events : [
				<c:forEach items="${list }" var="dto">
					{
	    			title : '${dto.caltitle }',
	            	start : "${dto.calvolundate }"
	            	
					},
	    	    </c:forEach>
			],

 			eventClick:function(event) {
 				var title = event.title;
				location.href='caldetail.do?caltitle=' + title;
            } 

			
		});
		
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
</style>
</head>
<body>

	<div id='calendar'></div>
	<input type="button" value="봉사활동 등록" onclick="location.href='calinsert.do'">

</body>
</html>