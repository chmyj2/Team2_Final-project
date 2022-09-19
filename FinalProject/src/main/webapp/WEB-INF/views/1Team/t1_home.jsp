<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<script src="https://unpkg.com/aos@next/dist/aos.js"></script> 
<script src="jquery.js"></script>
<script>
	var words = [ 'WE NEED FAMILY' ], part, i = 0, offset = 0, len = words.length, forwards = true, skip_count = 0, skip_delay = 15, speed = 100;
	var wordflick = function() {
		setInterval(function() {
			if (forwards) {
				if (offset >= words[i].length) {
					++skip_count;
					if (skip_count == skip_delay) {
						forwards = false;
						skip_count = 0;
					}
				}
			} else {
				if (offset == 0) {
					forwards = true;
					i++;
					offset = 0;
					if (i >= len) {
						i = 0;
					}
				}
			}
			part = words[i].substr(0, offset);
			if (skip_count == 0) {
				if (forwards) {
					offset++;
				} else {
					offset--;
				}
			}
			$('.word').text(part);
		}, speed);
	};

	$(document).ready(function() {
		wordflick();
	});
</script>
<title>Insert title here</title>
</head>
<body>
   <!-- home -->
    <!-- main -->
    <div id="main_wrapper">
            <img class="main_img" src="resources/img/home.jpg">
            <h2 class="main_txt">
                <div class="message">
                    <div class="word">
                        <span>WE NEED FAMILY</span>    
                    </div>
                </div>
            </h2>
            <p class="main_txt_p">사지 말고, 입양하세요.</p>
        </div>
        
        
        <!-- contents -->
        
        <div class="content_msg">DO YOU KNOW THAT?</div>

        <div id="contents">

            


            <div class="main_page_wrapper">
                    <img class="main_page_img" src="resources/img/mainP2.jpg"
                    data-aos="zoom-out-left" data-aos-duration="1500"
                    data-aos-offset="500">
                    <h2 id="blur" class="main_page_txt" >Abandoned<br>Dog</h2>
                    <span id="blur" class="main_page_p">
                        <br>
                        하루 버려지는 유기견<br>
                        평균 <span style="font-size: 20pt; text-decoration: underline;">
                        250</span> 마리<br>
                        2021년 총<span style="font-size: 20pt; text-decoration: underline;">
                        84136</span> 마리
                    </span>
                </div>

                <script> 
                    AOS.init(5000); // 자바스크립트로 init()을 해야 동작한다.
                </script>
        <div class="main_page2">
            <div class="main_page_wrapper2">
                <img class="main_page_img2" src="resources/img/mainP.jpg"
                data-aos="zoom-out-right" data-aos-duration="1500"
            data-aos-offset="400">
                <h2 id="blur" class="main_page_txt2">Euthanasia of <br> Dog</h2>
                <p id="blur" class="main_page_p2">
                    <br>
                    - 연간 유기견 안락사 통계 -<br>
                    2017년 5400마리<br>
                    2018년 6508마리<br>
                    2019년 7703마리<br>
                    .<br>
                    .<br>
                </p>
        </div>
        </div>
        <div class="main_page3">
            <div class="main_page_wrapper3">
                <div class="main_page_txt3">
                    <span class="txt_word Every">Every</span>
                    <span class="txt_word Dog">Dog</span>
                    <span class="txt_word Deserves">Deserves</span>
                    <span class="txt_word The">The</span>
                    <span class="txt_word Best">Best</span>
                <!--   Every Dog Deserves The Best &nbsp;
                    Every Dog Deserves The Best &nbsp;
                    Every Dog Deserves The Best &nbsp; -->
                </div>
            </div>
             <div class="main_page_wrapper3_img_cont">
                <img src="resources/img/sheep_dog.jpg" alt="">
            </div>
        </div>
       <!--  <div class="meet_dog_wrapper" style="font-size: 100pt;">
            Content
        </div> -->



    </div>

</body>
</html>