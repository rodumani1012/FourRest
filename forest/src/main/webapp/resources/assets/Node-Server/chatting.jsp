<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
#chat_box {
    width: 800px;
    min-width: 800px;
    height: 500px;
    min-height: 500px;
    border: 1px solid black;
}
#m {
    width: 700px;
}

</style>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<script src="http://code.jquery.com/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="192.168.220.22:8880/socket.io/socket.io.js">
	$(function() {

		//script의 attr 가져오기
		//var name = $('#userInfo').attr("name")
		//var room = $('#userInfo').attr("room")
		var socket = io();

		socket.emit('newUser', "test", "test")

		console.log("??");	
		
		$('form').submit(function(e) {
			e.preventDefault();
			var msg = $('#m').val().trim();
			if (msg != "" && msg != null) {
				socket.emit('chat message'.msg);
			}
			$('#messages').append($('<li class="me">').text(msg));
			$('#m').val('');
			return false;
		});

		socket.on('message', function(data) {
			if (data.type === 'msg') {
				$('#messages').append(
						$('<li class="other">').text(data.chatMessage));

			}
		})

		socket.on('joinedRoom', function(data) {
			$('#messages').append(
					$('<li class="server">').text(
							`${data.name}님이 ${data.room}에 입장하셨습니다.`));
		})

	})
	
	</script>
</head>
<body>
	
	
	<div id="chat_box">
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