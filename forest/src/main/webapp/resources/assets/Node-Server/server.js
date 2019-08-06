const express = require('express')
const app = require('express')();
let http = require('http').Server(app);
const io = require('socket.io')(http);
let fs = require('fs');

app.use('/js', express.static('./js'))

app.get('/', function (req, res) {
    fs.readFile('./chatting.jsp', function (err, data) {
      if (err) {
        res.send(err)
      } else {
        res.writeHead(200, { 'Content-Type': 'text/html' })
        res.write(data)
        res.end()
      }
    })
  })

io.sockets.on('connection',function(socket){
    console.log("왔니");
    
    var room
    socket.on('newUser',function (name,_room){
        room=_room;
        socket.name=name
        socket.join(room)
        console.log(`[${socket.name}] joined ${room}`);
        
        io.sockets.to(room).emit('joinedRoom',{
            room: room,
            name: socket.name
        })

    })
    
    socket.on('disconnet',function(){
        console.log('한명의 유저가 나갔습니다.')
    })

    socket.on('send_msg', function (msg) {
        //다시, 소켓을 통해 이벤트를 전송한다.
        socket.broadcast.to(room).emit('message',{type: 'msg',chatMessage :msg})
        console.log('['+socket.name+']sent >>'+msg);
    });

    
})

http.listen(8880,function(){
    console.log('listening on *:8880')
})