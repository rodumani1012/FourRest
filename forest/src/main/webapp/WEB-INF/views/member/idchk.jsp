<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		var id = opener.document.getElementsByName("id")[0].value;
		document.getElementsByName("idchk")[0].value=id;
	})
	function idConfirm(bool){
		if(bool=="true"){
			opener.document.getElementsByName("id")[0].title="y";
			opener.document.getElementsByName("pw")[0].focus();
		}else{
			opener.document.getElementsByName("id")[0].title="";
			opener.document.getElementsByName("id")[0].focus();
		}
		self.close();
	}

</script>
</head>
<body>
<%
	String idnotused=request.getAttribute("idchk")+"";
%>
	
	<table>
		
		<tr>
			<td><input type="text" name="idchk"></td>
		</tr>
		<tr>
			<td><%=idnotused.equals("true")?"아이디 생성 가능":"중복된 아이디 존재" %></td>
		</tr>
		<tr>
			<td><input type="button" value="확인" onclick="idConfirm('${idchk}')"></td>
		</tr>
	</table>

</body>
</html>