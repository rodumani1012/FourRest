<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<title>들어가세요좀</title>
<style type="text/css">
.area {
	position: absolute;
	background: #fff;
	border: 1px solid #888;
	border-radius: 3px;
	font-size: 12px;
	top: -5px;
	left: 15px;
	padding: 2px;
}

.info {
	font-size: 12px;
	padding: 5px;
}

.info .title {
	font-weight: bold;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>
<script src="https://code.highcharts.com/highcharts.src.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d71449af21090ce3a8d8c57f9cca8757"></script>

<body>
	<div class="row">
		<div id="map" class="col-md-5" style="width: 500px; height: 700px; margin-top: 50px;"></div>
		<div class="col-md-5" style="text-align: center;">
			<!-- 	<form action="polu_showme.do"> -->
			<select id="bigOption" name="bigOption" class="form-control"
				style="width: auto; display: inline;">
				<option value="0">쓰레기배출량</option>
				<option value="1">폐수방출량</option>
				<option value="2">미세먼지농도</option>
			</select> <select id="miniOption" name="miniOption" class="form-control"
				style="width: auto; display: inline;">
				<option value="0">2010</option>
				<option value="1">2011</option>
				<option value="2">2012</option>
				<option value="3">2013</option>
				<option value="4">2014</option>
				<option value="5">2015</option>
				<option value="6">2016</option>
			</select> <input type="button" value="검색" class="btn btn-outline-info"
				onclick="showshow()">
			<!-- 	</form> -->
			<div id="chartdivtop"></div>
			<div id="chartdivbottom"></div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function showshow(){
		var bigOption = $("#bigOption").val();
		var miniOption = $("#miniOption").val();
		if(bigOption==2&&miniOption==6)
			alert('2010~2015 중 선택해주세요 ')
		else if((bigOption==1&&miniOption ==0)||(bigOption==0&&miniOption==0))
			alert('2011~2016 중 선택해주세요')
		else
			showbigchart() ;
	}
	function showbigchart() {
		var bigOption = $("#bigOption").val();
		var miniOption = $("#miniOption").val();
		console.log(bigOption);
		var biglist = [];
		$.ajax({
			url : "polu_showme.do",
			type : 'post',
			data : {
				"bigOption" : bigOption,
				"miniOption" : miniOption
			},
			dataType : "json",
			success : function(data) {
				if (data.code === 'OK') {
					biglist = data.biglist;
					// 					$.each(biglist, function(index, value) {

					// 						console.log(index + ":" + value.area + ":"
					// 								+ value.repyear + ":" + value.amount);
					// 					});

					var seridatalist = [];
					var areanames = [];
					$.each(biglist, function(index, value) {
						var seridata = new Object();
						// 						console.log(index + ":" + value.area + ":"
						// 								+ value.repyear + ":" + value.amount);
						seridata.name = value.area;
						seridata.data = [ value.amount ];
						seridatalist.push(seridata);
						areanames.push(value.area);
					});

					//--------------------------------------------------
					// 					console.log(data.bigtitle)
					// 					console.log(data.bigyaxis)
					$(function() {
						$('#chartdivtop').highcharts({
							chart : {
								type : 'column'
							},
							title : {
								text : data.bigtitle
							},
							xAxis : {
								categories : ' '
							},
							yAxis : {
								title : {
									text : data.bigyaxis
								}
							},
							series : seridatalist
						});
					});

					//--------------------------------------------------
					console.log("값받기성공");

				} else {
					console.log("값받기실패");
				}
			},
			fail : function() {
				console.log('통신실패');
			}
		});

	}
</script>

<script>
	// 지도에 폴리곤으로 표시할 영역데이터 배열입니다 
	var areas = new Array();

	$.getJSON("resources/assets/json/map.json", function(geson) {
		//			const data = JSON.stringify(geson).features);
		var data = geson.features;
		var coordinates = new Object();
		var name = new Object();

		$.each(data, function(index, val) {

			sortall(val.geometry.coordinates, val.properties.CTP_KOR_NM);
		});

	});

	function sortall(coordinatesArr, areaname) {
		var paths = [];
		for (let i = 0; i < coordinatesArr.length; i++) {

			var Arrayin = new Object();
			let path = [];
			let points = [];

			$.each(coordinatesArr[i], function(index, coordinate) {
				var point = new Object();
				point.x = coordinate[1];
				point.y = coordinate[0];
				points.push(point);
				path.push(new kakao.maps.LatLng(point.x, point.y));//concat
			});
			paths.push(path);//concat

			Arrayin.name = areaname;
			Arrayin.path = paths;

		}
		displayArea(Arrayin);
		areas.push(JSON.parse(JSON.stringify(Arrayin)));
		//	areas.push(Arrayin);
		console.log(areas.length);
	}
	console.log('-------------------------하');
	console.log(areas);
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(36.425949, 127.705363), // 지도의 중심좌표
		level : 13
	// 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption), customOverlay = new kakao.maps.CustomOverlay(
			{}), infowindow = new kakao.maps.InfoWindow({
		removable : true
	});

	// 지도에 영역데이터를 폴리곤으로 표시합니다 
	// 		for (var i = 0, len = areas.length; i < len; i++) {
	// 			displayArea(areas[i]);
	// 		}

	// 다각형을 생상하고 이벤트를 등록하는 함수입니다
	function displayArea(area) {

		// 다각형을 생성합니다 
		var polygon = new kakao.maps.Polygon({
			map : map, // 다각형을 표시할 지도 객체
			path : area.path,
			strokeWeight : 2,
			strokeColor : '#004c80',
			strokeOpacity : 0.8,
			fillColor : '#fff',
			fillOpacity : 0.7
		});

		// 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
		// 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
		kakao.maps.event.addListener(polygon, 'mouseover',
				function(mouseEvent) {
					polygon.setOptions({
						fillColor : '#09f'
					});

					customOverlay.setContent('<div class="area">' + area.name
							+ '</div>');

					customOverlay.setPosition(mouseEvent.latLng);
					customOverlay.setMap(map);
				});

		// 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
		kakao.maps.event.addListener(polygon, 'mousemove',
				function(mouseEvent) {

					customOverlay.setPosition(mouseEvent.latLng);
				});

		// 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
		// 커스텀 오버레이를 지도에서 제거합니다 
		kakao.maps.event.addListener(polygon, 'mouseout', function() {
			polygon.setOptions({
				fillColor : '#fff'
			});
			customOverlay.setMap(null);
		});

		// 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다 
		kakao.maps.event.addListener(polygon, 'click', function(mouseEvent) {
			var content = '<div class="info">' + '   <div class="title">'
					+ area.name + '</div>' + '   <div class="size">총 면적 : 약 '
					+ Math.floor(polygon.getArea()) + ' m<sup>2</sup></area>'
					+ '</div>';

			infowindow.setContent(content);
			infowindow.setPosition(mouseEvent.latLng);
			infowindow.setMap(map);

			//polu_showarea.do
			var bigOpt = $("#bigOption").val();
			var bignm='';
			var ay ='';
			if(bigOpt==0){
				bignm='지정폐기물 발생량'
				ay='(단위 : 톤/일)'				
			}
			if(bigOpt==1){
				bignm='폐수발생량'
				ay='(단위 : m³/일)'
			}
			if(bigOpt==2){
				bignm='미세먼지(PM10) 배출량'
				ay='(단위 : kg )'				
			}
				

			var areanm = area.name;
			console.log('-----------꾜');
			console.log(areanm);
			console.log(bigOpt);
			var minilist = [];
			$.post("polu_showarea.do", {
				"bigOption" : bigOpt,
				"areaname" : areanm
			}, function(data) {
				if (data.code == 'OK') {
					var amountlist = [];
					var areayears=[]; 
					minilist = data.minilist;
					
					$.each(minilist, function(index, value) {
						amountlist.push(value.amount);
						areayears.push(value.repyear);
						console.log(index + ":" + value.name);						
					});
					
					//------------------------------------------

					$(function() {
						$('#chartdivbottom').highcharts({
							chart : {
								scrollablePlotArea : {
									minWidth : 700
								}
							},
							title : {
								text : areanm+'-'+ bignm
							},
							xAxis : {
								categories : areayears
							},
							yAxis : {
								title : {
									text : ay
								}
							},
							series : [ {
			 				name : areanm,
			 				data : amountlist
			 			}  ]
						});
					});

					//------------------------------------------

					// 					alert("야이");
				} else {
					alert("안댄당");
				}
			})
		});
	}

	//map.addOverlayMapTypeId(kakao.maps.MapTypeId.TERRAIN); //지형도로바꾸기
	// 		map.setDraggable(false); //드래거블 막기
	// 		map.setZoomable(false); //주머블막기
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.BOTTOMRIGHT);
</script>

<script type="text/javascript">
	$(function() {
		$('#chartdivtop').highcharts({
			chart : {
				type : 'column'
			},
			title : {
				text : '검색으로 지역별 통계를 조회하세요'
			},
		// 		xAxis : {
		// 			categories : ['서울']
		// 		},
		// 		yAxis : {
		// 			title : {
		// 				text : ''
		// 			}
		// 		},
		// 		series :[' ']
		});
	});
</script>
<script type="text/javascript">
	$(function() {
		$('#chartdivbottom').highcharts({
			chart : {
				scrollablePlotArea : {
					minWidth : 700
				}
			},
			title : {
				text : '지역을 클릭해 통계자료를 조회하세요'
			},
// 			xAxis : {
// 				categories : [ 'apple', 'pineapple', 'banana' ]
// 			},
// 			yAxis : {
// 				title : {
// 					text : 'fruit eaten'
// 				}
// 			},
// 			series : [ {
// 				name : 'brooke',
// 				data : [ 1, 4, 2 ]
// 			}, {
// 				name : 'roomy',
// 				data : [ 0, 1, 2 ]
// 			} ]

		});
	});
</script>