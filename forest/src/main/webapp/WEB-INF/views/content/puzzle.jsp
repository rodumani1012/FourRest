<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-Frame-Options" content="SAMEORIGIN"/>
<title>Insert title here</title>

</head>
<body>

<%@ include file="../header.jsp" %>

<br><br><br><br>
<iframe src="${requestScope['javax.servlet.forward.context_path']}/puzzleiframe.do" width="1100px" height="450px"></iframe>
	
	<button type="button" class="btn btn-outline-dark btn-lg" onclick="location.href='content.do'" >←뒤로가기</button>
	
</body>
</html>