$(function(){

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
		center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level: 8 // 지도의 확대 레벨
};  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption);

map.setMaxLevel(8);


var clusterer = new kakao.maps.MarkerClusterer({
	map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
	gridSize: 180 ,      // 클러스터의 격자 크기. 화면 픽셀 단위이며 해당 격자 영역 안에 마커가 포함되면 클러스터에 포함시킨다 
	minLevel: 7 // 클러스터 할 최소 지도 레벨 
	
});
	
$(".mymodal_btnclick").click(function(){ 
	
	var selectvalue = $("#mymodal_adrselect option:selected").val();
	
	
		if(selectvalue == 'gn') {
			// 모든 button 객체를 대상으로 클릭 이벤트가 발생한다면
			// 콜백 함수(function)를 실행하도록 한다.
			// 이동할 위도 경도 위치를 생성합니다 
						
			// 지도 중심을 이동 시킵니다

			var moveLatLon = new kakao.maps.LatLng(37.517305, 127.047502);
						
			map.setCenter(moveLatLon);
			map.setLevel(6);
			
			 modal.querySelector('.modal_close_btn').addEventListener('click', function() {
			        bg.remove();
			        modal.style.display = 'none';
			    });
			
		} else if(selectvalue == 'gd'){
			
			// 모든 button 객체를 대상으로 클릭 이벤트가 발생한다면
			// 콜백 함수(function)를 실행하도록 한다.
			// 이동할 위도 경도 위치를 생성합니다 
			
			// 지도 중심을 이동 시킵니다

			var moveLatLon = new kakao.maps.LatLng(37.530126, 127.1237708);
			
			map.setCenter(moveLatLon);
			map.setLevel(6);
			
		}else if(selectvalue == 'gb'){
			// 모든 button 객체를 대상으로 클릭 이벤트가 발생한다면
			// 콜백 함수(function)를 실행하도록 한다.
			// 이동할 위도 경도 위치를 생성합니다 
			
			// 지도 중심을 이동 시킵니다

			var moveLatLon = new kakao.maps.LatLng(37.6397819, 127.0256135);
			
			map.setCenter(moveLatLon);
			map.setLevel(6);
			
			
		}else if(selectvalue == 'gs'){
			// 모든 button 객체를 대상으로 클릭 이벤트가 발생한다면
			// 콜백 함수(function)를 실행하도록 한다.
			// 이동할 위도 경도 위치를 생성합니다 
			
			// 지도 중심을 이동 시킵니다

			var moveLatLon = new kakao.maps.LatLng(37.550937, 126.849642);
			
			map.setCenter(moveLatLon);
			map.setLevel(6);
			
			
		}else if(selectvalue == 'ga'){
			// 모든 button 객체를 대상으로 클릭 이벤트가 발생한다면
			// 콜백 함수(function)를 실행하도록 한다.
			// 이동할 위도 경도 위치를 생성합니다 
			
			// 지도 중심을 이동 시킵니다

			var moveLatLon = new kakao.maps.LatLng(37.4781549, 126.9514847);
			
			map.setCenter(moveLatLon);
			map.setLevel(6);
			
			
		}else if(selectvalue == 'gj'){
			// 모든 button 객체를 대상으로 클릭 이벤트가 발생한다면
			// 콜백 함수(function)를 실행하도록 한다.
			// 이동할 위도 경도 위치를 생성합니다 
			
			// 지도 중심을 이동 시킵니다

			var moveLatLon = new kakao.maps.LatLng(37.538617, 127.082375);
			
			map.setCenter(moveLatLon);
			map.setLevel(6);
			
			
		}else if(selectvalue == 'gr'){
			// 모든 button 객체를 대상으로 클릭 이벤트가 발생한다면
			// 콜백 함수(function)를 실행하도록 한다.
			// 이동할 위도 경도 위치를 생성합니다 
			
			// 지도 중심을 이동 시킵니다

			var moveLatLon = new kakao.maps.LatLng(37.495472, 126.887536);
			
			map.setCenter(moveLatLon);
			map.setLevel(6);
			
			
		}else if(selectvalue == 'gc'){
			// 모든 button 객체를 대상으로 클릭 이벤트가 발생한다면
			// 콜백 함수(function)를 실행하도록 한다.
			// 이동할 위도 경도 위치를 생성합니다 
			
			// 지도 중심을 이동 시킵니다

			var moveLatLon = new kakao.maps.LatLng(37.4568644, 126.8955105);
			
			map.setCenter(moveLatLon);
			map.setLevel(6);
			
			
		}else if(selectvalue == 'nw'){
			// 모든 button 객체를 대상으로 클릭 이벤트가 발생한다면
			// 콜백 함수(function)를 실행하도록 한다.
			// 이동할 위도 경도 위치를 생성합니다 
			
			// 지도 중심을 이동 시킵니다

			var moveLatLon = new kakao.maps.LatLng(37.654358, 127.056473);
			
			map.setCenter(moveLatLon);
			map.setLevel(6);
			
			
		}else if(selectvalue == 'db'){
			// 모든 button 객체를 대상으로 클릭 이벤트가 발생한다면
			// 콜백 함수(function)를 실행하도록 한다.
			// 이동할 위도 경도 위치를 생성합니다 
			
			// 지도 중심을 이동 시킵니다

			var moveLatLon = new kakao.maps.LatLng(37.668768, 127.047163);
			
			map.setCenter(moveLatLon);
			map.setLevel(6);
			
			
		}else if(selectvalue == 'ddm'){
			
			// 모든 button 객체를 대상으로 클릭 이벤트가 발생한다면
			// 콜백 함수(function)를 실행하도록 한다.
			// 이동할 위도 경도 위치를 생성합니다 
			
			// 지도 중심을 이동 시킵니다
			
			var moveLatLon = new kakao.maps.LatLng(37.574524, 127.03965);
			
			map.setCenter(moveLatLon);
			map.setLevel(6);
			
			
		}else if(selectvalue == 'dj'){
			// 모든 button 객체를 대상으로 클릭 이벤트가 발생한다면
			// 콜백 함수(function)를 실행하도록 한다.
			// 이동할 위도 경도 위치를 생성합니다 
			
			// 지도 중심을 이동 시킵니다

			var moveLatLon = new kakao.maps.LatLng(37.51245, 126.9395);
			
			map.setCenter(moveLatLon);
			map.setLevel(6);
			
			
		}else if(selectvalue == 'mp'){
			// 모든 button 객체를 대상으로 클릭 이벤트가 발생한다면
			// 콜백 함수(function)를 실행하도록 한다.
			// 이동할 위도 경도 위치를 생성합니다 
			
			// 지도 중심을 이동 시킵니다

			var moveLatLon = new kakao.maps.LatLng(37.5663245, 126.901491);
			
			map.setCenter(moveLatLon);
			map.setLevel(6);
			
			
		}else if(selectvalue == 'sdm'){
			// 모든 button 객체를 대상으로 클릭 이벤트가 발생한다면
			// 콜백 함수(function)를 실행하도록 한다.
			// 이동할 위도 경도 위치를 생성합니다 
			
			// 지도 중심을 이동 시킵니다

			var moveLatLon = new kakao.maps.LatLng(37.579225, 126.9368);
			
			map.setCenter(moveLatLon);
			map.setLevel(6);
			
			
		}else if(selectvalue == 'sc'){
			// 모든 button 객체를 대상으로 클릭 이벤트가 발생한다면
			// 콜백 함수(function)를 실행하도록 한다.
			// 이동할 위도 경도 위치를 생성합니다 
			
			// 지도 중심을 이동 시킵니다

			var moveLatLon = new kakao.maps.LatLng(37.483569, 127.032598);
			
			map.setCenter(moveLatLon);
			map.setLevel(6);
			
			
		}else if(selectvalue == 'sd'){
			// 모든 button 객체를 대상으로 클릭 이벤트가 발생한다면
			// 콜백 함수(function)를 실행하도록 한다.
			// 이동할 위도 경도 위치를 생성합니다 
			
			// 지도 중심을 이동 시킵니다

			var moveLatLon = new kakao.maps.LatLng(37.563456, 127.036821);
			
			map.setCenter(moveLatLon);
			map.setLevel(6);
			
			
		}else if(selectvalue == 'sb'){
			// 모든 button 객체를 대상으로 클릭 이벤트가 발생한다면
			// 콜백 함수(function)를 실행하도록 한다.
			// 이동할 위도 경도 위치를 생성합니다 
			
			// 지도 중심을 이동 시킵니다

			var moveLatLon = new kakao.maps.LatLng(37.5894, 127.016749);
			
			map.setCenter(moveLatLon);
			map.setLevel(6);
			
			
		}else if(selectvalue == 'sp'){
			// 모든 button 객체를 대상으로 클릭 이벤트가 발생한다면
			// 콜백 함수(function)를 실행하도록 한다.
			// 이동할 위도 경도 위치를 생성합니다 
			
			// 지도 중심을 이동 시킵니다

			var moveLatLon = new kakao.maps.LatLng(37.5145636, 127.1059186);
			
			map.setCenter(moveLatLon);
			map.setLevel(6);
			
			
		}else if(selectvalue == 'yc'){
			// 모든 button 객체를 대상으로 클릭 이벤트가 발생한다면
			// 콜백 함수(function)를 실행하도록 한다.
			// 이동할 위도 경도 위치를 생성합니다 
			
			// 지도 중심을 이동 시킵니다

			var moveLatLon = new kakao.maps.LatLng(37.517016, 126.866642);
			
			map.setCenter(moveLatLon);
			map.setLevel(6);
			
			
		}else if(selectvalue == 'ydp'){
			// 모든 button 객체를 대상으로 클릭 이벤트가 발생한다면
			// 콜백 함수(function)를 실행하도록 한다.
			// 이동할 위도 경도 위치를 생성합니다 
			
			// 지도 중심을 이동 시킵니다

			var moveLatLon = new kakao.maps.LatLng(37.526436, 126.896004);
			
			map.setCenter(moveLatLon);
			map.setLevel(6);
			
			
		}else if(selectvalue == 'ys'){
			// 모든 button 객체를 대상으로 클릭 이벤트가 발생한다면
			// 콜백 함수(function)를 실행하도록 한다.
			// 이동할 위도 경도 위치를 생성합니다 
			
			// 지도 중심을 이동 시킵니다

			var moveLatLon = new kakao.maps.LatLng(37.532527, 126.99049);
			
			map.setCenter(moveLatLon);
			map.setLevel(6);
			
			
		}else if(selectvalue == 'ep'){
			// 모든 button 객체를 대상으로 클릭 이벤트가 발생한다면
			// 콜백 함수(function)를 실행하도록 한다.
			// 이동할 위도 경도 위치를 생성합니다 
			
			// 지도 중심을 이동 시킵니다

			var moveLatLon = new kakao.maps.LatLng(37.602784, 126.929164);
			
			map.setCenter(moveLatLon);
			map.setLevel(6);
			
			
		}else if(selectvalue == 'jr'){
			// 모든 button 객체를 대상으로 클릭 이벤트가 발생한다면
			// 콜백 함수(function)를 실행하도록 한다.
			// 이동할 위도 경도 위치를 생성합니다 
			
			// 지도 중심을 이동 시킵니다

			var moveLatLon = new kakao.maps.LatLng(37.5735207, 126.9788345);
			
			map.setCenter(moveLatLon);
			map.setLevel(6);
			
			
		}else if(selectvalue == 'jg'){
			// 모든 button 객체를 대상으로 클릭 이벤트가 발생한다면
			// 콜백 함수(function)를 실행하도록 한다.
			// 이동할 위도 경도 위치를 생성합니다 
			
			// 지도 중심을 이동 시킵니다

			var moveLatLon = new kakao.maps.LatLng(37.563843, 126.997602);
			
			map.setCenter(moveLatLon);
			map.setLevel(6);
			
			
		}else if(selectvalue == 'jrg'){
			// 모든 button 객체를 대상으로 클릭 이벤트가 발생한다면
			// 콜백 함수(function)를 실행하도록 한다.
			// 이동할 위도 경도 위치를 생성합니다 
			
			// 지도 중심을 이동 시킵니다

			var moveLatLon = new kakao.maps.LatLng(37.6063242, 127.0925842);
			
			map.setCenter(moveLatLon);
			map.setLevel(6);
			
			
		}
		
	

   });




$(document).ready(function() {
	


//지도가 이동, 확대, 축소로 인해 지도영역이 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
/*kakao.maps.event.addListener(map, 'bounds_changed', function() {             
    
    
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

    });
    	

    
    
    
});*/



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
    
  /*  kakao.maps.event.addListener(cLmarker, 'mouseover', function() {
    	customOverlay.set(map);
	});
        
    // 마커에 마우스아웃 이벤트를 등록합니다
    kakao.maps.event.addListener(cLmarker, 'mouseout', function() {
        // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
    	customOverlay.set(null);
    });*/
      
            
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
				        	position : new kakao.maps.LatLng(result[0].y, result[0].x),
				        	image: markerImage // 마커이미지 설정 
				        });
				        
				        //클러스터러에 마크를 추가합니다. 1개씩
				        clusterer.addMarker(marker);

			        	// 인포윈도우로 장소에 대한 설명을 표시합니다
			        	var infowindow = new kakao.maps.InfoWindow({ 
			        		content: '<div class="wrap">' + 
			        				 '    <div class="info">' + 
			        				 '        <span class="title">' + name + 
			        				 '        <span>' + 
			        				 '      <span  class="closeInfo'+mgtno+'" style="text-align: left;">X</span>' + 
			        				 '	  <div class> '+
			        				 '   	<span class="ellipsis">후기수</span> <br>' + 
			        				 '   	<span class="jibun"> <a href="hospitalDetailGo?hospital_no='+mgtno+'"> 자세히 </a></span>' + 
			        				 '	  </div>' +
			        				 '    </div>' +    
			        				 '</div>'
			        	});
			        	href='hospitalDetailGo?hospital_no="+mgtno+"'
				        	
				        	kakao.maps.event.addListener(marker, 'click', function() {
				        		
				        		infowindow.open(map, marker); 
				        		
				        	});
				        	
				        	 $(document).on("click", ".closeInfo"+mgtno, function(event){
				        		 
				        		 infowindow.close(map, marker); 
				        	 })
				        	
				        	
				    } 
				});    
				
					
							
				
			}
			}
			
		
		
	});
	
}
});

});

});



