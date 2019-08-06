<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>





<!-- <html> -->
<!-- <script type="text/javascript" src ="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
<!-- <script type="text/javascript" src="js/bike01.js"></script> -->
<%-- <script type="text/javascript" src="/scripts/amcharts/amcharts.js?v=<%=System.currentTimeMillis() %>"></script> --%>


	<form action="bike.do" method="post">
	<input type="hidden" name="command" value="first_db">
	<input type="submit" value="db에 저장">
	<table>
		<thead></thead>
		<tbody></tbody>
	</table>
	</form>






</body>
<script type="text/javascript" src ="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function() {
	getJson();
});

function getJson() {

	$.getJSON("resources/areadata/json/bike.json", function(data) {

		$("table").attr("border", "1");

		$.each(data, function(key, val) {

			if (key == "DESCRIPTION") {
				$("thead").append(
					"<tr><th>"+val.ADDR_GU+"</th>"
						+"<th>"+val.CONTENT_ID+"</th>"
						+"<th>"+val.CONTENT_NM+"</th>"
						+"<th>"+val.NEW_ADDR+"</th>"
						+"<th>"+val.CRADLE_COUNT+"</th>"
						+"<th>"+val.LONGITUDE+"</th>"
						+"<th>"+val.LATITUDE+"</th></tr>"
				);
			} else if (key == "DATA"){
				
				var list = val;
				
				for(var i =0 ; i< list.length; i++){
					
					var str = list[i];
					$("tbody").append(
							"<tr>"
								+"<td>"+str.addr_gu+"</td>"
								+"<td>"+str.content_id+"</td>"
								+"<td>"+str.content_nm+"</td>"
								+"<td>"+str.new_addr+"</td>"
								+"<td>"+str.cradle_count+"</td>"
								+"<td>"+str.longitude+"</td>"
								+"<td>"+str.latitude+"</td>"
								+"<input type='hidden' name='bike' value='"
									+str.addr_gu+"/"+str.content_id+"/"+str.content_nm+"/"+str.new_addr+"/"+str.cradle_count+"/"+str.longitude+"/"+str.latitude+"'>"
							+"</tr>"
						);
				}
			}

		});

	});

}


</script>


</html>