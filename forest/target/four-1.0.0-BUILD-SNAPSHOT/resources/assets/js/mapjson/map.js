
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 15 // 지도의 확대 레벨
    };  

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


    $.getJSON("resources/assets/json/map.json", function(geson) {
    	
    var data = geson.features;
    var coordinates =[];
    var name ='';
    
    $.each(data,function(index,val){
    	coordinates = val.geometry.coordinates;
    	name = val.properites.CTP_KOR_NM;
    	displayArea(coordinates,name);
    });
    	
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
    		map:map,
    		path:path, // 그려질 다각형의 좌표 배열입니다
    	    strokeWeight: 5, // 선의 두께입니다
    	    strokeColor: '#39DE2A', // 선의 색깔입니다
    	    strokeOpacity: 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
    	    strokeStyle: 'solid', // 선의 스타일입니다
    	    fillColor: '#A2FF99', // 채우기 색깔입니다
    	    fillOpacity: 0.7 // 채우기 불투명도 입니다
    	});
    	
    	polygons.push(polygon);
    	
    	
    }
    
    

