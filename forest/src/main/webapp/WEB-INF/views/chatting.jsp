<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="192.168.110.62:8880/socket.io/socket.io.js"></script>
	 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script id="userInfo" src="resources/assets/js/chat.js" ></script>
<style type="text/css">
	#messages{
		width:200px;
		height: 200px;
		background-color: yellow;
	}
</style>	
</head>
<body>

	<div id="messages">
		<ul id="messages"></ul>
	</div>	
	<div class="div-button-send">
		<form action="">
			<input id="m" autocomplete="off" />
			<button>전 송</button>
		</form>
	</div>

	

</body>
</html>