$(function() {
	
	coords_map();
	
	
})


function coords_map() {
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
     	
	var detailaddr = document.getElementById('detail_addr').value;
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch("'"+detailaddr+"'", function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {
    	

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        
        detail_map(coords);
        	
    } 
	
})

}


function detail_map(coords) {
	
	var coords = coords;
	
    	var mapContainer = document.getElementById('detail_map'), // 지도를 표시할 div 
    	mapOption = {
    		center: coords, // 지도의 중심좌표
    		level: 4 // 지도의 확대 레벨
    	};  
    	
    	 // 지도를 생성합니다    
    	 var map = new kakao.maps.Map(mapContainer, mapOption);
    	
    	 var imageSrc = 'resources/t2_img/hospitalMarker.png', // 마커이미지의 주소입니다    
         imageSize = new kakao.maps.Size(50, 50), // 마커이미지의 크기입니다
         imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

         // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
         var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
         markerPosition = coords; // 마커가 표시될 위치입니다
         
         
         // 결과값으로 받은 위치를 마커로 표시합니다
         var marker = new kakao.maps.Marker({
         	map : map,
         	position : coords,
         	image: markerImage // 마커이미지 설정 
         }); 
        
        
        	
    } 
