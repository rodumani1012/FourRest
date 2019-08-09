const express = require('express')
const app = require('express')();
let http = require('http').Server(app);
const io = require('socket.io')(http);
let fs = require('fs');

app.use('/js', express.static('./js'))

app.get('/', function (req, res) {
    fs.readFile('./chat.html', function (err, data) {
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
    socket.on('chat message', (msg) => {
      //소켓을 통해 이벤트 전송
      socket.broadcast.to(room).emit('message', { type: 'msg', chatMessage: msg });
      console.log('[' + socket.name + '] sent >>' + msg);
    });
     
    socket.on('disconnet',function(){
      console.log('한명의 유저가 나갔습니다.')
    })

    
});

http.listen(8880,function(){
    console.log('listening on *:8880')
})