<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div class="store_wrap">
        <div class="store_header">
            <div class="store_for_dog">
                <img class="store_for_dog_img" src="resources/img/about4.png" alt="">
            </div>
            <h2>
                <a href="#">FOR CAT</a>
            </h2>
        </div>
    
        <!-- 카테고리/제조사별 3개정도? 
                로얄캐닌/네츄럴코어/ANF-->
        <!-- 자견용(퍼피)/성견용(어덜트)/노령견용(시니어)/전연령용
                각 DB 5개 정도씩? -->

                <div class="store_new_products_txt">
                    <h2>* DRY FOOD FOR DOG *</h2>
                    <p>From raw materials for dogs to other well-being pet foods</p>
                </div>


                <!-- 제조사별/연령별 체크박스 -->
                <!-- table로 할까...? -->
                <div class="store_for_dog_category_wrap">
                    <div class="store_foe_dog_category_select">
                        <div class="store_for_dog_categoty_row">
                            <strong>By Company</strong>
                            <input type="checkbox" name="" value="">Royal Canin
                            <input type="checkbox" name="" value="">Natural Core
                            <input type="checkbox" name="" value="">ANF
                        </div>
                        <br>
                        <div class="store_for_dog_category_col">
                            <strong>By Age</strong>
                            <input type="checkbox" name="" value="">Puppy
                            <input type="checkbox" name="" value="">Adult
                            <input type="checkbox" name="" value="">Senior
                        </div>
                    </div>
                    <!-- 영양제링크 -->

                    
                </div>
        
        <div class="store_new_products">

            <div class="store_new_products_img">
                <div class="store_new_products_ANF">
                    <!-- a링크 타고 상품디테일.jsp로 이동 -->
                <a href="get.aProductTeam1">
                    <img src="resources/img/food/ANF_유기농식스프리+소고기연어.jpg" alt="">
                </a>

                <h2>ANF MADE WITH ORGANIC 6Free+</h2>
                <p>Beef&Salmon</p>
                <span>5.6kg 
                    <strong>￦43,850</strong>
                </span><br>
                <span>1.8kg 
                    <strong>￦15,340</strong></span>
                </div>

                <div class="store_new_products_ANF">
                    <img src="resources/img/food/ANF_유기농식스프리+연어흰살생선.jpg" alt="">
                    <h2>ANF MADE WITH ORGANIC 6Free+</h2>
                    <p>Salmon&Whitefish</p>
                    <span>5.6kg 
                        <strong>￦40,470</strong>
                    </span><br>
                    <span>1.8kg 
                        <strong>￦15,340</strong></span>
                </div>
                
                <div class="store_new_products_ANF">
                    <img src="resources/img/food/ANF_유기농식스프리+오리고기연어.jpg" alt="">
                    <h2>ANF MADE WITH ORGANIC 6Free+</h2>
                    <p>Duck&Salmon</p>
                    <span>5.6kg 
                        <strong>￦43,510</strong>
                    </span><br>
                    <span>3.6kg 
                        <strong>￦42,680</strong></span>
                </div>

            </div>
        </div>

    </div>

</body>
</html>