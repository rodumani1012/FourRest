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
<iframe src="${requestScope['javax.servlet.forward.context_path']}/puzzleiframe.do" width="100%" height="600px"></iframe>
	
</body>
</html>