<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/about.css">
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script src="jquery.js"></script>
<title>Insert title here</title>
</head>
<body>
    <div class="about_wrapper">

        <div class="about_main">
            <div class="about_main_txt">
                <h2>DengStiny Give Pet Happiness</h2>
                <p>Our meeting with the Pet is 
                    <span>Destiny</span></p>
                <label>댕스티니는 모든 유기동물의 행복을 추구합니다</label>
            </div>
        </div>
        <div class ="about_main_img">
            <div>
                <img class="about_main_pet1" src="resources/img/about1.png" alt="">
            </div>
            <div>
                <img class="about_main_pet2" src="resources/img/about3.png" alt="">
            </div>
            <div>
                <img class="about_main_pet3" src="resources/img/about2.png" alt="">
            </div>
            <div>
                <img class="about_main_pet4" src="resources/img/about5.png" alt="">
            </div>
            <div>
                <img class="about_main_pet5" src="resources/img/about4.png" alt="">
            </div>

        </div>

        <div class="about_sub">
            <div class="about_sub_txt">
                <h2>We Are Support Abandoned Pet!</h2>
                <p>댕스티니는 유기동물의 입양을 돕고 있습니다</p>
                </div>
        </div>
        <div class="about_sub_img">
            <div>
                <p id="about_sub_p" align="center">Be my Family</p>
                <img class="about_sub_img_dog" src="resources/img/dogs.jpg">
                <img class="dog_drop" src="resources/img/drop.png" alt="">
                <img class="dog_drop3" src="resources/img/drop.png" alt="">
            </div>
        </div>

        <div class="about_sub_care">
            <div class="about_sub_care_txt">
                <h2>Always with Abandoned Pet</h2>
                <p>입양 후 유기동물의 행복하고 건강한 생활을 위해<br>
                    유기동물의 건강검진을 지원하고 있습니다. </p>
                </div>
        </div>
        <div class="about_sub_care_img">
            <div class="about_sub_care_img_wrapper1">
                <img id="black_footprint"src="resources/img/black_footPrint.png" alt="">
                <img class="about_sub_care_img_dog1" src="resources/img/care_pet.jpg">
            </div>
            <div class="about_sub_care_img_wrapper2">
                <img id="pink_footprint"src="resources/img/pink_footPrint.png" alt="">
                <img class="about_sub_care_img_dog2" src="resources/img/pet_cure.jpg">
            </div>
        </div>

        <div class="about_sub_donate">
            <div class="about_sub_donate_txt">
                <h2>Donation of abandoned Pet</h2>
                <p> '댕스티니'는 제품 판매 수익의 50%를 <br>
                    유기동물 구조센터에 물품으로 후원하고 있습니다. 
                    </p>
                </div>
        </div>
        <div class="about_sub_donate_img">
            <p class="go_store">
                <a href="">→ Go Store</a>
            </p>
            <div class="about_sub_donate_img_wrapper1">
                <img class="about_sub_donate_img_dog1" src="resources/img/store_cat.jpg"
                data-aos="fade-up-left" data-aos-duration="1500"
                data-aos-offset="350">
            </div>
            <p class="go_donate">
                <a href="">Go Donate ←</a>
            </p>
            <div class="about_sub_donate_img_wrapper2">
                <img class="about_sub_donate_img_dog2" src="resources/img/store.jpg"
                data-aos="fade-down-right" data-aos-duration="1500"
                data-aos-offset="350">
            </div>

        </div>
        <script> 
            AOS.init(5000); // 자바스크립트로 init()을 해야 동작한다.
        </script>


    </div>
    
</body>
</html>