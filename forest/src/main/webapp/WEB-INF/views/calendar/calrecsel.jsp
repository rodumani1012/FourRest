<%@page import="com.my.four.model.dto.CalendarDto"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
 
	function getFormatDate(date){ 
		 var year = date.getFullYear();	//yyyy 
		 var month = (1 + date.getMonth());	//M 
		 month = month >= 10 ? month : '0' + month;	//month 두자리로 저장 
		 var day = date.getDate();	//d 
		 day = (day >= 10) ? day : '0' + day;	//day 두자리로 저장 
		 var time = date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds()
		 return year + '' + month + '' + day + ' ' + time; 
	}

	var today = getFormatDate(new Date())
	
	$(document).ready(function() {
		
		var events = []
		
		$.ajax({
			url:'calrecAjax.do',
			type:'post',
			async:false,
			dataType:'json',
			success: function(data){
				setCalendar(data);
			},
			error:function(){
				alert('통신 실패')
			}
		});
		
		function setCalendar(data) {
			$.each(data,function(key, val){
				var calrecdateend = getFormatDate(new Date(val.calrecdateend))
				
				if(today > calrecdateend) {
					var color = '#C0C0C0'
				}
				events.push(
					{ seq : val.calnum,
					title : val.caltitle,
					start : val.calrecdate + 86400000,
					end : val.calrecdateend + 86400000,
					color : color
					})
			})
		}
		
		$('#calendar').fullCalendar({
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month'
			},
			defaultDate : '2019-08',
			editable : false,
			eventLimit : true, // allow "more" link when too many events
			
			events : events,

 			eventClick:function(event) {
 				var title = event.title;
 				var seq = event.seq;
				location.href='caldetail.do?caltitle=' + title + '&seq=' + seq;
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
	<sec:authorize access="hasRole('ROLE_ADMIN')">
	<input type="button" value="봉사활동 등록" onclick="location.href='calinsert.do'">
	</sec:authorize>
</body>
</html>