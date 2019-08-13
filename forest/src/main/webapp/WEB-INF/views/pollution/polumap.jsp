<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>원, 선, 사각형, 다각형 표시하기</title>
    <!-- include application-chart.min.css -->
    <link rel="icon" type="image/png" sizes="16x16" href="favicon.ico">
    <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<a href="godomap.do">맵맵맵맵맵맵</a>
<div id="map" style="width:500px;height:700px;"></div>    
<p id="result"></p>
<div id="chartdiv"></div>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.highcharts.com/highcharts.src.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d71449af21090ce3a8d8c57f9cca8757"></script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(36.425949, 127.705363), // 지도의 중심좌표
        level: 13 // 지도의 확대 레벨 작을수록 확대댐
    };  

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


// 다각형을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 다각형을 표시합니다
var polygonPath = [
	
	[
     new kakao.maps.LatLng(37.5548768201904, 126.96966524449994),
     new kakao.maps.LatLng(37.55308718044556, 126.97642899633566),
     new kakao.maps.LatLng(37.55522076659584, 126.97654602427454),
     new kakao.maps.LatLng(37.55320655210504, 126.97874667968763),
     new kakao.maps.LatLng(37.55368689494708, 126.98541456064552),
     new kakao.maps.LatLng(37.54722934282707, 126.995229135048),
     new kakao.maps.LatLng(37.549694559809545, 126.99832516302801),
     new kakao.maps.LatLng(37.550159406110104, 127.00436818301327),
     new kakao.maps.LatLng(37.54820235864802, 127.0061334023129),
     new kakao.maps.LatLng(37.546169758665414, 127.00499711608721),
     new kakao.maps.LatLng(37.54385947805103, 127.00727818360471),
     new kakao.maps.LatLng(37.54413326436179, 127.00898460651953),
     new kakao.maps.LatLng(37.539639030116945, 127.00959054834321),
     new kakao.maps.LatLng(37.537681185520256, 127.01726163044557),
     new kakao.maps.LatLng(37.53378887274516, 127.01719284893274),
     new kakao.maps.LatLng(37.52290225898471, 127.00614038053493),
     new kakao.maps.LatLng(37.51309192794448, 126.99070240960813),
     new kakao.maps.LatLng(37.50654651085339, 126.98553683648308),
     new kakao.maps.LatLng(37.50702053393398, 126.97524914998174),
     new kakao.maps.LatLng(37.51751820477105, 126.94988506562748),
     new kakao.maps.LatLng(37.52702918583156, 126.94987870367682),
     new kakao.maps.LatLng(37.534519656862926, 126.94481851935942),
     new kakao.maps.LatLng(37.537500243531994, 126.95335659960566),
     new kakao.maps.LatLng(37.54231338779177, 126.95817394011969),
     new kakao.maps.LatLng(37.54546318600178, 126.95790512689311),
     new kakao.maps.LatLng(37.548791603525764, 126.96371984820232),
     new kakao.maps.LatLng(37.55155543391863, 126.96233786542686),
     new kakao.maps.LatLng(37.5541513366375, 126.9657135934734),
     new kakao.maps.LatLng(37.55566236579088, 126.9691850696746),
     new kakao.maps.LatLng(37.5548768201904, 126.96966524449994)
 ],[
	new kakao.maps.LatLng(33.5641592794216,126.76810769405087),
	new kakao.maps.LatLng(33.55627895764881,126.80811250530077),
	new kakao.maps.LatLng(33.52469704921349,126.86073654031928),
	new kakao.maps.LatLng(33.52643714304505,126.89281325620627),
	new kakao.maps.LatLng(33.503334977089686,126.91310370824057),
	new kakao.maps.LatLng(33.48095034803912,126.90168871448753),
	new kakao.maps.LatLng(33.45302162962542,126.92437630387386),
	new kakao.maps.LatLng(33.39164571578218,126.90554917633473),
	new kakao.maps.LatLng(33.38231096757103,126.88014972201171),
	new kakao.maps.LatLng(33.35472313256807,126.86817869146073),
	new kakao.maps.LatLng(33.306514278037525,126.82909341898826),
	new kakao.maps.LatLng(33.307005033700115,126.77572999969814),
	new kakao.maps.LatLng(33.278851795358314,126.74335319543825),
	new kakao.maps.LatLng(33.270175945090955,126.65307277375895),
	new kakao.maps.LatLng(33.23621090573838,126.59928143623368),
	new kakao.maps.LatLng(33.24371564909495,126.58901738387941),
	new kakao.maps.LatLng(33.240820434842114,126.51977134812242),
	new kakao.maps.LatLng(33.22657848742092,126.47090148793191),
	new kakao.maps.LatLng(33.24602771368301,126.4099359336251),
	new kakao.maps.LatLng(33.23173079763588,126.37017572943468),
	new kakao.maps.LatLng(33.241410210952026,126.32680296262788),
	new kakao.maps.LatLng(33.19605392476859,126.2697908923715),
	new kakao.maps.LatLng(33.235896226081785,126.23541484105488),
	new kakao.maps.LatLng(33.259388011660334,126.18352078770103),
	new kakao.maps.LatLng(33.292265061029646,126.16164603240452),
	new kakao.maps.LatLng(33.3369143591478,126.16411862524699),
	new kakao.maps.LatLng(33.389208508446195,126.23418093173848),
	new kakao.maps.LatLng(33.41728391732652,126.26290374315803),
	new kakao.maps.LatLng(33.4358175090436,126.26334752626512),
	new kakao.maps.LatLng(33.48898413837508,126.38550757278685),
	new kakao.maps.LatLng(33.48576086437714,126.40833057042097),
	new kakao.maps.LatLng(33.49777855202679,126.4540006929407),
	new kakao.maps.LatLng(33.52054046470463,126.49490785068467),
	new kakao.maps.LatLng(33.51555085312057,126.51135964980969),
	new kakao.maps.LatLng(33.525532579400924,126.58622640244599),
	new kakao.maps.LatLng(33.5603612390647,126.73025492918568),
	new kakao.maps.LatLng(33.5641592794216,126.76810769405087)
]];
console.log(polygonPath.length);
console.log(polygonPath);
// 지도에 표시할 다각형을 생성합니다
var polygon = new kakao.maps.Polygon({
    path:polygonPath, // 그려질 다각형의 좌표 배열입니다
    strokeWeight: 5, // 선의 두께입니다
    strokeColor: '#39DE2A', // 선의 색깔입니다
    strokeOpacity: 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
    strokeStyle: 'solid', // 선의 스타일입니다
    fillColor: '#A2FF99', // 채우기 색깔입니다
    fillOpacity: 0.7 // 채우기 불투명도 입니다
});

polygon.setMap(map);
// 지도에 다각형을 표시합니다

var mouseoverOption={
	fillColor:'red',
	fillOpacity:0.5
};
kakao.maps.event.addListener(polygon,'mouseover',function(){
	polygon.setOptions(mouseoverOption);
});
//다각형에 마우스다운 이벤트를 등록합니다
var downCount = 0;
kakao.maps.event.addListener(polygon, 'mousedown', function() { 
    console.log(event);
    var resultDiv = document.getElementById('result');
    resultDiv.innerHTML = '다각형에 mousedown 이벤트가 발생했습니다!' + (++downCount);
}); 

</script>
<script type="text/javascript">
$(function (){
		$('#chartdiv').highcharts({
		chart:{
			type:'column'
		},
		title:{
			text:'fruit competition'
		},
		xAxis:{
			categories:['apple','pineapple','banana']
			},
		yAxis:{
			title:{
				text:'fruit eaten'
			}
		},
		series:[{
			name:'brooke',
			data:[1,4,2]
		},{
			name:'roomy',
			data:[0,1,2]
		}]
		
	});
});
</script>

</body>
</html>