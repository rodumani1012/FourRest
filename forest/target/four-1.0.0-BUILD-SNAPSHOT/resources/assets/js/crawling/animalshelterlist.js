

$(function(){
	getJson();
});

function getJson() {
	
	$.getJSON("resources/assets/json/animalshelterlist.json", function(data){  
		//uri와 통신을하여 성공했을 때 function(data)를 실행함
		
		$("table").attr("border","1");
		
		$.each(data,function(key,val){
			// $.each(array/object, callback) {}
				// 이터레이블된 배열 또는 오브젝트 형태를 하나하나 꺼내서 함수 실행.
			if(key == "list") {
				
				var content = val;
				
				for(var i = 0; i < content.length; i++) {
					var str = content[i];
					
					$("tbody").append(
							"<tr>"+
								"<th>"+str.area+"</th>"+
								"<th>"+str.centerName+"</th>"+
								"<th>"+str.phoneNumber+"</th>"+
								"<th>"+str.centerAddr+"</th>"+
								"<input name='shelterInfo' type='hidden' value='"+
									str.area+"/"+str.centerName+"/"+
									str.phoneNumber+"/"+str.centerAddr+"'>"+
							"</tr>"
					);
				}
			}
		});
	});
}


