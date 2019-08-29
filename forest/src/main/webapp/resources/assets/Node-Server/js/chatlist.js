$(function(){
    var socket = io();
    
    socket.emit('roomhi')

    socket.on('roomlist',function(room){
        console.log(room);
        if(room.length==0){
            $('#chatlist').append('개설된 방이 없습니다.')
        }else{
            addRoomList(room)
        }
        
    })
    function addRoomList(list){
        list.forEach(element => {
            console.log(element);
            console.log('1111111111');
            
            appendRoom(element)
            
        });
    }
    function appendRoom(element){
        var unit =`<li><a href='http://192.168.110.62:8880?id=${element.id}'>${element.id}</a></li>`
        console.log(unit);
        console.log('222222222222222222');
        
        $('#chatlist').append(unit)
    }
    
})