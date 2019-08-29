$(function() {

		//script의 attr 가져오기
		//var name = $('#id').attr("name");
		//var room = $('#userInfo').attr("room")
	var socket = io.connect();
	
	//alert(name);
	socket.emit('newUser', 'test', "문의하기")
	
	socket.on('create',function(data){
		
	})
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
							`${data.id}님이 ${data.room}에 입장하셨습니다.`));
							
							//socket.emit('onGetRoom',roominfo);
							
		})
	
	})