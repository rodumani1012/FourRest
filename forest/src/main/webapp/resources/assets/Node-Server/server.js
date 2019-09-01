const express = require('express')
const app = require('express')();
let http = require('http').Server(app);
const io = require('socket.io')(http);
let fs = require('fs');
var router = express.Router();
var roomnames=[];
var idchk = null;
app.use('/js', express.static('./js'))
app.set('views','/views')
app.set('view engine','html')
app.get('/', function (req, res) {
  var id = req.query.id
  console.log(id);
  idchk= id;
  
  //res.send("./chat",obj)
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
app.get('/admin', function (req, res) {
    fs.readFile('./chatlist.html', function (err, data) {
      if (err) {
        res.send(err)
      } else {
        res.writeHead(200, { 'Content-Type': 'text/html' })
        res.write(data)
        res.end()
      }
    })
  })

var userrooms =[];
io.sockets.on('connection',function(socket){
    
    var room

    socket.on('roomhi',function(){
      console.log('hi111111111111111111');
      socket.emit('roomlist',userrooms);
    })

    socket.on('newUser',function (name,_room){
      room=_room;
        socket.name=name
        socket.join(room)
        var roomInfo = {
          name : name,
          romm:_room,
          id:idchk
        }
        userrooms.push(roomInfo)
        console.log('방 추가');
        console.log(`[${socket.name}] joined ${room}`);
        
        io.sockets.to(room).emit('joinedRoom',{
            room: room,
            name: socket.name,
            id:idchk
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

    socket.on('onJoinRoom',function(data){
      var roomexist=false;
      for(var item in userrooms){
        if(data.roomname==userrooms[item].roomname){
          roomexist=true;
        }
      }
      if(roomexist){
        socket.leave(socket.room);
        socket.join(data.roomname);
        socket.room=data.roomname;
        data.rcode=0;
      }else{
        data.rcode=1;
      }
      io.sockets.in(socket.room).emit('onJoinRoom',data);
    })
    socket.on('onGetRoom',function(data){
      socket.emit('roomlist',userrooms)
    })

  })

http.listen(8880,function(){
    console.log('listening on *:8880')
})