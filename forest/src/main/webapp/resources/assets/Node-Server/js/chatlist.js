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
            appendRoom(element)
            
        });
    }
    function appendRoom(element){
        var unit =`<li>${element.room}</li>`
        console.log(unit);
        
        $('#chatlist').append(unit)
    }
    
})