<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/loginAndJoin.css">
<link rel="stylesheet" href="resources/css/member.css">
<link rel="stylesheet" href="resources/css/store.css">
<link rel="stylesheet" href="resources/css/master.css">
<link rel="stylesheet" href="resources/css/adopt.css">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/loginAndJoin.js"></script>
<script type="text/javascript" src="resources/js/site_jquery.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript" src="resources/js/aqicn.js"></script>
<script type="text/javascript" src="resources/js/validCheck.js"></script>
<script type="text/javascript" src="resources/js/check.js"></script>
<script type="text/javascript" src="resources/js/store_detail.js"></script>
<script type="text/javascript" src="resources/js/rememberID.js"></script>
<script type="text/javascript" src="resources/js/purchasePage.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
 
<!-- <script type="text/javascript" src="resources/js/kakaoLogin.js"></script> --> 
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- <script src="https://developers.kakao.com/sdk/js/kakao.js"></script> -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<div class="wrap">

    <!-- index -->
    <header>
        <div class="header">
            <img class="icon_search" src="resources/img/search.png">
            <input class="search" type="text" placeholder="insert keyword">
            
            <h1 class="logo_wrap">
            <a href="team1Main">
            <img class="logo_dengstiny" src="resources/img/dengstiny.png">
            </a>
            </h1>
            
        	<span id="resultArea">${result }</span>
        	
        <!-- 	<div class="master_page">
        		<a href="master.reg"> 상품등록(임시작업용) </a>
        	</div> -->
           <div class="log_state">
           		<jsp:include page="${loginPage }"></jsp:include> 
           </div>
           
           
           
           
        </div>
        <!-- 지도 했던것 처럼 오늘 안락사 대상 친구 페이지 하단 우측에 뜨게하기 -->
        <nav>
            <ul>
                <li><a href="about.go">ABOUT</a>  
                <!-- 페이지 소개 및 사료와 영양제 수익금의 0%는 유기견구조센터에 기부한다 -->
                </li>
                
                <li><a href="enter.team1Adopt">ADOPT</a>  
                </li>
                
                <li class="store_drop"><a href="enter.team1MainShop">STORE</a>  
                    <ul class="store_drop_content">
                    <c:choose>
                	<c:when test="${sessionScope.loginMember.member_ID == 'admin' }">
                	    <li><a href="enter.team1StoreFor?product_category=dog&product_sub_category=food&product_sub_category2=product">Dog</a></li>
                        <li><a href="enter.team1StoreFor?product_category=cat&product_sub_category=food&product_sub_category2=product">Cat</a></li>
                        <li><a href="master.reg">상품등록</a></li>
                </c:when>
                
                <c:otherwise>
                        <li><a href="enter.team1StoreFor?product_category=dog&product_sub_category=food&product_sub_category2=product">Dog</a></li>
                        <li><a href="enter.team1StoreFor?product_category=cat&product_sub_category=food&product_sub_category2=product">Cat</a></li>
                
                </c:otherwise>
                
                
                
               	</c:choose>
               	
                        <!-- <li><a href="enter.team1StoreFor?product_category=dog">Dog</a></li>
                        <li><a href="enter.team1StoreFor?product_category=cat">Cat</a></li>
                        <li><a href="master.reg"> 상품등록 </a></li> -->
                        
                    </ul>
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
	
	 <footer id="footer">
            <div class="footer">
            <img id="footerlogo" name="footerlogo" src="">
    
            <h4 class="company_name">DengStiny</h4>
            <hr align="left" class="footer_hr">
            <div class="f_company">
                <p> Address : 서울특별시 종로구 종로12길 15 5층 (관철동 13-13)</p>
                <p> Contact. 02-0000-0000 </p>
                <p> 사업자정보 : 12-3456-7890</p>
                <p>GitHub : <a>https://github.com/LitaHart/Team12FinalProject</a></p>
                <h4>© DengStiny ALL RIGHTS RESERVED</h4>
            </div>
        </div>
        
        <div class="footer_sub">
            <div class="contact">
                <h4 class="service">Customer Service Center</h4>
                <p style="font-size: 25pt; font-weight: bolder; margin-bottom: 50px;"> 
                    	☎ 02-0000-0000 </p>
                <p style="font-size: 15pt; font-weight :bold;"> Mon-Fri 10:00AM - 6:00PM</p>
                <p style="font-size: 15pt;">(Sat,Sun,Holiday OFF)</p>
                <p style="font-size: 10pt;">BANK INFO 신한 000-000-000000 (댕스티니)</p>
            </div>
        </div>
    </footer>
        
        
        </div>
</body>
</html>