$(function() {
	hospital_map();
	
});
	
function hospital_map() {
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level: 4 // 지도의 확대 레벨
	};  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);


//지도가 이동, 확대, 축소로 인해 지도영역이 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'bounds_changed', function() {             
    
    
    kakao.maps.event.addListener(map, 'mouseup', function() {             
    	// 지도 영역정보를 얻어옵니다 
    	var bounds = map.getBounds();
    	
    	// 영역정보의 남서쪽 정보를 얻어옵니다 
    	var swLatlng = bounds.getSouthWest();
    	
    	// 영역정보의 북동쪽 정보를 얻어옵니다 
    	var neLatlng = bounds.getNorthEast();
    	var lb = new kakao.maps.LatLngBounds(swLatlng, neLatlng);
    	var message = "<p>영역좌표 <br> 남서쪽 위도, 경도 :   <span id='newlatlng1'>" + swLatlng + "</span><br>"; 
    	message += "북동쪽 위도, 경도  : <span id='newlatlng2'>" + neLatlng + '</span> </p>'; 
    	var resultDiv = document.getElementById('result');   
    	resultDiv.innerHTML = message;
    	hospital_list(lb);
    });
    	

    
    
    
});



// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();



//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div>현재위치</div>'; // 인포윈도우에 표시될 내용입니다
       
        map.setCenter(locPosition);   
        
        var imageSrc = 'resources/t2_img/humanMarker.png', // 마커이미지의 주소입니다    
        imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
        imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
        markerPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치입니다

    // 마커를 생성합니다
    	var cLmarker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition ,
        image: markerImage // 마커이미지 설정 
    			}); 
    
    

    // 마커가 지도 위에 표시되도록 설정합니다
    	cLmarker.setMap(map);  

    // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    var content =  '<div class="customoverlay">현재위치</div>';

    // 커스텀 오버레이가 표시될 위치입니다 
    var position = new kakao.maps.LatLng(lat, lon);  

    // 커스텀 오버레이를 생성합니다
    var customOverlay = new kakao.maps.CustomOverlay({
    	map: map,
    	position: position,
    	content: content,
    	yAnchor: 1 
    });
    
    kakao.maps.event.addListener(cLmarker, 'mouseover', function() {
    	customOverlay.set(map);
	});
        
    // 마커에 마우스아웃 이벤트를 등록합니다
    kakao.maps.event.addListener(cLmarker, 'mouseout', function() {
        // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
    	customOverlay.set(null);
    });
      
            
    		});
    
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}





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
					let mgtno = hospital[i].mgtno;
					
					
					// 주소로 좌표를 검색합니다
					geocoder.addressSearch("'"+addr+"'", function(result, status) {

				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				    	

				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				        
				        var imageSrc = 'resources/t2_img/hospitalMarker.png', // 마커이미지의 주소입니다    
				        imageSize = new kakao.maps.Size(50, 50), // 마커이미지의 크기입니다
				        imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

				        // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
				        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
				        markerPosition = new kakao.maps.LatLng(result[0].y, result[0].x); // 마커가 표시될 위치입니다
				        
				        
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				        	map : map,
				        	position : new kakao.maps.LatLng(result[0].y, result[0].x),
				        	image: markerImage // 마커이미지 설정 
				        });
				        	        
				        
				        	// 인포윈도우로 장소에 대한 설명을 표시합니다
				        	var infowindow = new kakao.maps.InfoWindow({ 
				        		content: '<div class="wrap">' + 
				                '    <div class="info">' + 
				                '        <div class="title">' + 
				                	name + 
				                '      <div  class="closeInfo'+mgtno+'">X</div>' + 
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
				        	
				        	 $(document).on("click", ".closeInfo"+mgtno,function(event){
				        		 
				        		 infowindow.close(map, marker); 
				        	 })
				        	
				    } 
				});    
				
					
							
				
			}
			}
			
		
		
	});
	
}
});

	
}



	



function hospital_list(lb){
		
		var lb = lb;
		
			$.ajax({
				url:"resources/t2_js/petHospital.json",
				type : "GET" ,
				dataType:"json",
				success:function(data){
					
						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();
				   	
						let hospital = data.DATA
						
						var table = $("<table border='1' style='margin-left: auto; margin-right:auto;' />");
						
						$.each(hospital , function(i , m) {
							
							let name = hospital[i].bplcnm;
							let addr = hospital[i].sitewhladdr;
							let tel = hospital[i].sitetel;
							let state = hospital[i].dtlstatenm;
							let mgtno = hospital[i].mgtno;
							
							if(state == "정상"){
								
								if(addr != ""){
									
									
									// 주소로 좌표를 검색합니다
									geocoder.addressSearch("'"+addr+"'", function(result, status) {
									
									
									 // 정상적으로 검색이 완료됐으면 
								     if (status === kakao.maps.services.Status.OK) {
								    	 
								    	 console.log('ㅇㅇ');
								    	 
								       var hospitalxy = new kakao.maps.LatLng(result[0].y, result[0].x);
							
								       if(lb.contain(hospitalxy)==true){
								     
//								        var row = $("<tr/>").append(
//								        		  $("<td/>").text(name),
//								        		  $("<td/>").text(addr),
//								        		  $("<td/>").text(tel),
//								        		  $("<td/>").text(state ),
//								        		  $("<td/>").append($("<a href='hospitalDetailGo?hospitalNo="+mgtno+"'/>").text("자세히"))
//								        		
//								        )
								        	        
								        }
								        
								    } 
								});    

									
									
								}
							}
							
							//table.append(row);
						});
						
						//$(".hospital_list").append(table);
				
				}
			})
		}
		
		
$(function() {
	hospital_map();

	hospital_list();

	
});
	
function hospital_map() {
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level: 4 // 지도의 확대 레벨
	};  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);


//지도가 이동, 확대, 축소로 인해 지도영역이 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'bounds_changed', function() {             
    
    
    kakao.maps.event.addListener(map, 'mouseup', function() {             
    	// 지도 영역정보를 얻어옵니다 
    	var bounds = map.getBounds();
    	
    	// 영역정보의 남서쪽 정보를 얻어옵니다 
    	var swLatlng = bounds.getSouthWest();
    	
    	// 영역정보의 북동쪽 정보를 얻어옵니다 
    	var neLatlng = bounds.getNorthEast();
    	var lb = new kakao.maps.LatLngBounds(swLatlng, neLatlng);
    	var message = "<p>영역좌표 <br> 남서쪽 위도, 경도 :   <span id='newlatlng1'>" + swLatlng + "</span><br>"; 
    	message += "북동쪽 위도, 경도  : <span id='newlatlng2'>" + neLatlng + '</span> </p>'; 
    	var resultDiv = document.getElementById('result');   
    	resultDiv.innerHTML = message;

    	
    	//hospital_list(lb);

    });
    	

    
    
    
});



// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();



//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div>현재위치</div>'; // 인포윈도우에 표시될 내용입니다
       
        map.setCenter(locPosition);   
        
        var imageSrc = 'resources/t2_img/humanMarker.png', // 마커이미지의 주소입니다    
        imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
        imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
        markerPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치입니다

    // 마커를 생성합니다
    	var cLmarker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition ,
        image: markerImage // 마커이미지 설정 
    			}); 
    
    

    // 마커가 지도 위에 표시되도록 설정합니다
    	cLmarker.setMap(map);  

    // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    var content =  '<div class="customoverlay">현재위치</div>';

    // 커스텀 오버레이가 표시될 위치입니다 
    var position = new kakao.maps.LatLng(lat, lon);  

    // 커스텀 오버레이를 생성합니다
    var customOverlay = new kakao.maps.CustomOverlay({
    	map: map,
    	position: position,
    	content: content,
    	yAnchor: 1 
    });
    
    kakao.maps.event.addListener(cLmarker, 'mouseover', function() {
    	customOverlay.set(map);
	});
        
    // 마커에 마우스아웃 이벤트를 등록합니다
    kakao.maps.event.addListener(cLmarker, 'mouseout', function() {
        // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
    	customOverlay.set(null);
    });
      
            
    		});
    
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}





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
					let mgtno = hospital[i].mgtno;
					
					
					// 주소로 좌표를 검색합니다
					geocoder.addressSearch("'"+addr+"'", function(result, status) {

				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				    	

				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				        
				        var imageSrc = 'resources/t2_img/hospitalMarker.png', // 마커이미지의 주소입니다    
				        imageSize = new kakao.maps.Size(50, 50), // 마커이미지의 크기입니다
				        imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

				        // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
				        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
				        markerPosition = new kakao.maps.LatLng(result[0].y, result[0].x); // 마커가 표시될 위치입니다
				        
				        
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				        	map : map,
				        	position : new kakao.maps.LatLng(result[0].y, result[0].x),
				        	image: markerImage // 마커이미지 설정 
				        });
				        	        
				        
				        	// 인포윈도우로 장소에 대한 설명을 표시합니다
				        	var infowindow = new kakao.maps.InfoWindow({ 
				        		content: '<div class="wrap">' + 
				                '    <div class="info">' + 
				                '        <div class="title">' + 
				                	name + 
				                '      <div  class="closeInfo'+mgtno+'">X</div>' + 
				                '        </div>' + 
				                '        <div class="body">' + 
				                '            <div class="desc">' + 
				                '                <div class="ellipsis">후기수</div>' + 
				                '                <div class="jibun ellipsis"> <a href="hospitalDetailGo?hospital_no='+mgtno+'"> 자세히 </a> ' + 
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
				        	
				        	 $(document).on("click", ".closeInfo"+mgtno,function(event){
				        		 
				        		 infowindow.close(map, marker); 
				        	 })
				        	
				    } 
				});    
				
					
							
				
			}
			}
			
		
		
	});
	
}
});

}



	



function hospital_list(){

	
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
							
							$("<td/>").apeend($("<a href='hospitalDetailGo'/>").text(name)),
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
}
		
		
		
		
$(function() {
	hospital_map();
	hospital_list();

	
});
	
function hospital_map() {
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level: 4 // 지도의 확대 레벨
	};  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);


//지도가 이동, 확대, 축소로 인해 지도영역이 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'bounds_changed', function() {             
    
    
    kakao.maps.event.addListener(map, 'mouseup', function() {             
    	// 지도 영역정보를 얻어옵니다 
    	var bounds = map.getBounds();
    	
    	// 영역정보의 남서쪽 정보를 얻어옵니다 
    	var swLatlng = bounds.getSouthWest();
    	
    	// 영역정보의 북동쪽 정보를 얻어옵니다 
    	var neLatlng = bounds.getNorthEast();
    	var lb = new kakao.maps.LatLngBounds(swLatlng, neLatlng);
    	var message = "<p>영역좌표 <br> 남서쪽 위도, 경도 :   <span id='newlatlng1'>" + swLatlng + "</span><br>"; 
    	message += "북동쪽 위도, 경도  : <span id='newlatlng2'>" + neLatlng + '</span> </p>'; 
    	var resultDiv = document.getElementById('result');   
    	resultDiv.innerHTML = message;

    	//hospital_list(lb);

    });
    	

    
    
    
});



// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();



//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div>현재위치</div>'; // 인포윈도우에 표시될 내용입니다
       
        map.setCenter(locPosition);   
        
        var imageSrc = 'resources/t2_img/humanMarker.png', // 마커이미지의 주소입니다    
        imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
        imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
        markerPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치입니다

    // 마커를 생성합니다
    	var cLmarker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition ,
        image: markerImage // 마커이미지 설정 
    			}); 
    
    

    // 마커가 지도 위에 표시되도록 설정합니다
    	cLmarker.setMap(map);  

    // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    var content =  '<div class="customoverlay">현재위치</div>';

    // 커스텀 오버레이가 표시될 위치입니다 
    var position = new kakao.maps.LatLng(lat, lon);  

    // 커스텀 오버레이를 생성합니다
    var customOverlay = new kakao.maps.CustomOverlay({
    	map: map,
    	position: position,
    	content: content,
    	yAnchor: 1 
    });
    
    kakao.maps.event.addListener(cLmarker, 'mouseover', function() {
    	customOverlay.set(map);
	});
        
    // 마커에 마우스아웃 이벤트를 등록합니다
    kakao.maps.event.addListener(cLmarker, 'mouseout', function() {
        // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
    	customOverlay.set(null);
    });
      
            
    		});
    
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}





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
					let mgtno = hospital[i].mgtno;
					
					
					// 주소로 좌표를 검색합니다
					geocoder.addressSearch("'"+addr+"'", function(result, status) {

				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				    	

				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				        
				        var imageSrc = 'resources/t2_img/hospitalMarker.png', // 마커이미지의 주소입니다    
				        imageSize = new kakao.maps.Size(50, 50), // 마커이미지의 크기입니다
				        imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

				        // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
				        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
				        markerPosition = new kakao.maps.LatLng(result[0].y, result[0].x); // 마커가 표시될 위치입니다
				        
				        
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				        	map : map,
				        	position : new kakao.maps.LatLng(result[0].y, result[0].x),
				        	image: markerImage // 마커이미지 설정 
				        });
				        	        
				        
				        	// 인포윈도우로 장소에 대한 설명을 표시합니다
				        	var infowindow = new kakao.maps.InfoWindow({ 
				        		content: '<div class="wrap">' + 
				                '    <div class="info">' + 
				                '        <div class="title">' + 
				                	name + 
				                '      <div  class="closeInfo'+mgtno+'">X</div>' + 
				                '        </div>' + 
				                '        <div class="body">' + 
				                '            <div class="desc">' + 
				                '                <div class="ellipsis">후기수</div>' + 
				                '                <div class="jibun ellipsis"> <a href="hospitalDetailGo?hospital_no='+mgtno+'"> 자세히 </a> ' + 
				                '                <a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
				                '            </div>' + 
				                '        </div>' + 
				                '    </div>' +    
				                '</div>'
				        	});
				        	
				        	kakao.maps.event.addListener(marker, 'click', function() {
				        		
				        		infowindow.open(map, marker); 
				        		
				        	});
				        	
				        	 $(document).on("click", ".closeInfo"+mgtno,function(event){
				        		 
				        		 infowindow.close(map, marker); 
				        	 })
				        	
				    } 
				});    
				
					
							
				
			}
			}
			
		
		
	});
	
}
});

}



	



function hospital_list(){

	$.ajax({
		url:"resources/t2_js/petHospital.json",
		type : "GET" ,
		dataType:"json",
		success:function(data){
	
				let hospital = data.DATA

				var table = $("<table class='main-hospital-list' border='1'/>");
				
				
				$.each(hospital , function(i , m) {
					
					let name = hospital[i].bplcnm;
					let addr = hospital[i].sitewhladdr;
					let tel = hospital[i].sitetel;
					let state = hospital[i].dtlstatenm;
					let mgtno = hospital[i].mgtno;
					
					let [city, ward] = addr.split(' ');

					console.log(ward);
					
					if(state == "정상"){
						
						if(addr != ""){
						
					var row = $("<tr/>").append(
							
							$("<td/>").text(name),
							$("<td/>").text(ward),
							$("<td/>").text(tel),
							$("<td><a href='hospitalDetailGo?hospital_no="+mgtno+"'>자세히</a></td>")		
							)
						}
					}
						table.append(row);
				});
				
				$(".hospital_list").append(table);
		
		}
	})
}
		
		
		
		
