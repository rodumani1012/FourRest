<%@page import="com.my.four.model.dto.CalendarDto"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

		var mylist = [
			
			<c:forEach items="${list }" var="dto">
			
			{
				<jsp:useBean id="now" class="java.util.Date" />
				<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="today" />
				
				title : '${dto.caltitle }',
	        	start : '${dto.calvolundate }',
	        	end : '${dto.calvolundateend }' + "T23:59:59",
	        	
	        	<c:if test="${today > (fn:join(fn:split((dto.calvolundateend), '-'), '')) }">
	        		color : '#C0C0C0'
	        	</c:if>
				},
			
		    </c:forEach>
				
		]

		$('#calendar').fullCalendar({
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month'
			},
			defaultDate : '2019-08',
			editable : false,
			eventLimit : true, // allow "more" link when too many events
			
			events : mylist,

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

.fc-event {
	position: relative; /* for resize handle and other inner positioning */
	display: block; /* make the <a> tag block */
	font-size: .85em;
	line-height: 1.3;
	border-radius: 3px;
	border: 1px solid #3a87ad; /* default BORDER color */
	background-color: rgba(0,255,0,0.4); /* default BACKGROUND color */
	font-weight: normal; /* undo jqui's ui-widget-header bold */
}
.fc-content {
	color: black;
}

</style>
</head>
<body>

	<div id='calendar'></div>
	<input type="button" value="봉사활동 등록" onclick="location.href='calinsert.do'">

</body>
</html>