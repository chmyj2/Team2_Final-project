$(function () {
	
	
	hospital_list();
	hospital_map();
	
	//37.5693255, 126.9860066

})




$(function hospital_map() {

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.5693255, 126.9860066), // 지도의 중심좌표
        level: 10 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();


//마커 클러스터러를 생성합니다 
var clusterer = new kakao.maps.MarkerClusterer({
    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
    minLevel: 6 // 클러스터 할 최소 지도 레벨 
});


$.ajax({
url:"resources/t2_js/petHospital.json",
type : "GET" ,
dataType:"json",
success:function(data){
	
	

	
	
	// 동물병원 리스트 데이터입니다.
	let hospital = data.DATA
	
	$.each(hospital , function(i , m) {
		
		//병원이 정상 영업 시 
		if(hospital[i].dtlstatenm == "정상"){
			//병원의 주소가 없을 시 
			if(hospital[i].sitewhladdr != ""){
			
					let name =  hospital[i].bplcnm;
					let addr = hospital[i].sitewhladdr;
					let tel = hospital[i].sitetel;
					let state = hospital[i].dtlstatenm;
					let x =hospital[i].x;
					let y = hospital[i].y;
					
					// 주소로 좌표를 검색합니다
					geocoder.addressSearch("'"+addr+"'", function(result, status) {

				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				    	 
				    	

				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				        
				        
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				        	
				        	position: coords
				        });
				        
				      
				        
				        	// 인포윈도우로 장소에 대한 설명을 표시합니다
				        	var infowindow = new kakao.maps.InfoWindow({
				        		content: '<div class="wrap">' + 
				                '    <div class="info">' + 
				                '        <div class="title">' + 
				                	name + 
				                '      <div  class="closeInfo">X</div>' + 
				                '        </div>' + 
				                '        <div class="body">' + 
				                '            <div class="desc">' + 
				                '                <div class="ellipsis">후기수</div>' + 
				                '                <div class="jibun ellipsis"> <a href=""> 자세히 </a> ' + 
				                '                <a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
				                '            </div>' + 
				                '        </div>' + 
				                '    </div>' +    
				                '</div>'
				        	});
				        	
				        	
				        	
				        	kakao.maps.event.addListener(marker, 'click', function() {
				        		infowindow.open(map, marker); 
				        		
				        	});
				        	
				        	 $(document).on("click",".closeInfo",function(event){
				        		 
				        		 infowindow.close(map, marker); 
				        	 })
				        	
				    } 
				});    
				
					
							
				
			}
			}
			
		
		
	});
	
	
	
}
});

clusterer.addMarkers(marker);
	
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
		
		
		
