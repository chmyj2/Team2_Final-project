<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/loginAndJoin.css">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/loginAndJoin.js"></script>
<script type="text/javascript" src="resources/js/site_jquery.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript" src="resources/js/aqicn.js"></script>
<script type="text/javascript" src="resources/js/validCheck.js"></script>
<script type="text/javascript" src="resources/js/check.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<div id="wrapper">

    <!-- index -->
    <header>
        <div class="header">
            <a href="loginandjoin.go"><img class="icon_login" src="resources/img/LOGIN.png"></a>
            <span class="join_sale">10% SALE</span>
            <a href="bag"><img class="icon_bag"src="resources/img/shop.png"></a>
            <img class="icon_search" src="resources/img/search.png">
            <input class="search" type="text" placeholder="insert keyword">
        </div>
        <!-- top부분 login/장바구니/검색기능 -->
        <!-- 지도 했던것 처럼 오늘 안락사 대상 친구 페이지 하단 우측에 뜨게하기 -->
        <nav>
            <ul>
                <li><a href="about.go">ABOUT</a>  
                <!-- 페이지 소개 및 사료와 영양제 수익금의 0%는 유기견구조센터에 기부한다 -->
                </li>
                <li><a href="#">ADOPT</a>  
                    <!-- 지역별 구조센터 -->
                </li>
                <li><a href="team1Main">HOME</a>  
                    <!-- dropdown 사료/영양제 -->  
                </li>
                <!-- <a href="#"><img class="logo" src="DENGSTINY.png" alt=""></a>   -->
                    <!-- dropdown 사료/영양제 -->  
                
                <li class="store_drop"><a href="#">STORE</a>  
                    <ul class="store_drop_content">
                        <li><a href="#">Food</a></li>
                        <li><a href="#">Nutrient</a></li>
                    </ul>
                </li>
                <li><a href="#">COMMUNITY</a>  
                </li>
                <li><a href="contact.go">CONTACT</a>  
                </li>
            </ul>
           
        </nav>
    </header>
    
    <div>	<!-- home 영역 -->
		<jsp:include page="${contentPage }"></jsp:include>
		
	</div>
	
	
	
	
	
	
	
	
	<!-- footer 영역 -->
	
	<!-- <footer id="footer">
            <div class="footer">
    
            <div class="f_company">
                <h4>DengStiny</h4>
                <p> Address : 서울특별시 종로구 종로12길 15 5층 (관철동 13-13)</p>
                <p> Contact. 02-0000-0000 </p>
                <p>© DengStiny ALL RIGHTS RESERVED</p>
            </div>
        </div>
        <div class="footer_sub">

        </div>

    </footer> -->
	
	
</div>
</body>
</html>