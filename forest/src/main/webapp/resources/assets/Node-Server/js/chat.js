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
				
				socket.emit('chat message',msg);
			}
			message = `<p class="chat_name">me</p><p>${msg}</p>`
			$('#messages').append($('<li class="me">').html(message));
			$('#m').val('');
			return false;
		});

		socket.on('message', function(data) {
			if (data.type === 'msg') {
				$('#messages').append(
						$('<li class="other">').text('other : '+data.chatMessage));

			}
		})

		socket.on('joinedRoom', function(data) {
			$('#messages').append(
					$('<li class="server">').text(
							`${data.name}님이 ${data.room}에 입장하셨습니다.`));
		})

	})