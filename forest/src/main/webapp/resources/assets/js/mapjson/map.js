 $(function() {
    getJson();
  });

  function getJson() {

    $.getJSON("resources/assets/json/map.json", function(geson) {
    	
    var data = geson.features;
    var coordinates =[];
    var name ='';
    
    $.each(data,function(index,val){
    	coordinates = val.geometry.coordinates;
    	name = val.properites.CTP_KOR_NM;
    	displayArea(coordinates,name);
    });
    	
//      $.ajax({
//        url:"maptest.do?",
//        method:"post",
//        data:{"obj":JSON.stringify(data)},
//        success:function(msg){
//          alert(msg+"성공");
//        },
//        error:function () {
//          alert("실패");
//        }
//
//      });
    
    });
    
    var polygons=[];
    
    function displayArea(coordinates,name){
    	var path=[];
    	var points=[];
    	$.each(coordinates[0],function(index,coordinate){
    		var point = new Object();
    		point.x = coordinate[1];
    		point.y = coordinate[0];
    		points.push(point);
    		path.push(new kakao.maps.LatLng(coordinate[1],coordinate[0]));
    		
    	});
    	
    	var polygon = new kakao.maps.Polygon({
    		map : map,
    		path
    	});
    }
    
    
    
  }
