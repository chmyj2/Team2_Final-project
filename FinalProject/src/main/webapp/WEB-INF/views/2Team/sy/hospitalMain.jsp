<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=616ab49f45cfb91e31f4cd32e312c1aa&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="resources/t2_js/hospital_function2.js"></script>
</head>

<body>
    <h1>병원찾기</h1>
    
    <div id="map"></div>
    <p><em>지도 중심좌표가 변경되면 지도 정보가 표출됩니다</em></p>
<p id="result"></p>
    
    <h1>------------------------------------------------</h1>
    
    <div class="hospital_list" ></div>
    
	
</body>
</html>