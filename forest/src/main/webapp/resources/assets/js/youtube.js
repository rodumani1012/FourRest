

$(document).ready(function(){
    
        $.ajax({
            type : "GET",
            dataType : "JSON",
            url : "https://www.googleapis.com/youtube/v3/playlistItems?playlistId=PL9oFPTqZnUG6zALj45bJJvgFs7mnItN55&playlistId=PLvNzObWMMx6vp513YopdfL9SvIFWYbhoN&part=snippet&maxResults=10&key=AIzaSyAA0Hpbab8p_Ju2ax3Rnk7BWT9NBF6APLI",
            contentType : "application/json",
            success : function(jsonData){
                for(var i=0 ; i<jsonData.items.length ; i++){
                    var items = jsonData.items[i];
                    console.log('title : ' + items.snippet.title + '\n' +
                    'videoId : https://youtube.be/' +items.snippet.resourceId.videoId + '\n' +
                    'Thumbnail : ' + items.snippet.thumbnails.high.url);
                
                    $('#getVideo').append(`<div class="div-iframe-player">
                        <iframe id="player" type="text/html" width="400" height="300"
                   src="http://www.youtube.com/embed/${items.snippet.resourceId.videoId}?enablejsapi=1&origin=http://example.com"
                   frameborder="0" allowfullscreen="allowfullscreen" mozallowfullscreen="mozallowfullscreen" 
                   msallowfullscreen="msallowfullscreen" oallowfullscreen="oallowfullscreen" webkitallowfullscreen="webkitallowfullscreen"></iframe><br>
                        <a class="a-player-title"href="https://www.youtube.com/watch?v=${items.snippet.resourceId.videoId}">${items.snippet.title}</a><br/>
                        videoId : ${items.snippet.resourceId.videoId}<br/>
                        publishedAt : ${items.snippet.publishedAt}<br/>
                        </div>`
                    		);
            		    }
                
            },
            error : function(err){
                console.log("유튜브 요청 에러 : " + err);
                
            }
        });
        
  });


