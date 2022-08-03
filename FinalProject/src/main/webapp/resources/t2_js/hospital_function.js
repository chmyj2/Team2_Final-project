$(function () {
	hospital_list();
	hospital_map();
	
})

$(function hospital_map(){
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.5693255, 126.9860066), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
	
	$.ajax({
		url:"resources/t2_js/petHospital.json",
		type : "GET" ,
		dataType:"json",
		success:function(data){
			
			let hospital = data.DATA
			
			$.each(hospital , function(i , m) {
				
				if(hospital[i].dtlstatenm == "정상"){
					if(hospital[i].sitewhladdr != ""){
						if( hospital[i].x != ""){
							let name =  hospital[i].bplcnm;
							let addr = hospital[i].sitewhladdr;
							let tel = hospital[i].sitetel;
							let state = hospital[i].dtlstatenm;
							let x =hospital[i].x;
							let y = hospital[i].y;
							
							// 주소로 좌표를 검색합니다
							geocoder.addressSearch('경기 성남시 분당구 판교역로 235 에이치스퀘어', function(result, status) {
								
							    // 정상적으로 검색이 완료됐으면 
							     if (status === kakao.maps.services.Status.OK) {

							        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
									var message = 'latlng: new kakao.maps.LatLng(' + result[0].y + ', ';
									message += result[0].x + ')';
									
									var resultDiv = document.getElementById('clickLatlng'); 
									resultDiv.innerHTML = message;
									
							        // 결과값으로 받은 위치를 마커로 표시합니다
							        var marker = new kakao.maps.Marker({
							            map: map,
							            position: coords
							        });

							        // 인포윈도우로 장소에 대한 설명을 표시합니다
							        var infowindow = new kakao.maps.InfoWindow({
							            content: '<div style="width:150px;text-align:center;padding:6px 0;">장소</div>'
							        });
							        infowindow.open(map, marker);

							        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							        map.setCenter(coords);
							    } 
							});    

							
							
						
							
						}
					}
				}
				
			});
		}
	});
	
	
		
	    
	    
	

	
		
})



$(function hospital_list(){
			
			$.ajax({
				url:"resources/t2_js/petHospital.json",
				type : "GET" ,
				dataType:"json",
				success:function(data){
			
						let hospital = data.DATA
						
						var table = $("<table/>");
						
						$.each(hospital , function(i , m) {
							
							let name = hospital[i].bplcnm;
							let addr = hospital[i].sitewhladdr;
							let tel = hospital[i].sitetel;
							let state = hospital[i].dtlstatenm;
							
						
							if(state == "정상"){
								
								if(addr != ""){
								
							var row = $("<tr/>").append(
									$("<td/>").text(name),
									$("<td/>").text(addr),
									$("<td/>").text(tel),
									$("<td/>").text(state)
									
									)
								}
							}
								table.append(row);
						});
						
						$(".hospital_list").append(table);
				
				}
			})
		})
		
		
		
