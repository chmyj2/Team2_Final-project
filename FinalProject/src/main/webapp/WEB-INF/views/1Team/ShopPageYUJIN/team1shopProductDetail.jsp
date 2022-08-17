<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/StoreTapMenu.js"></script>
<script type="text/javascript">
	<!-- add cart -->
	$(function() {
		/* ------------------------------------ */
		 // 수량 버튼 조작
		 let quantity = $("#quantity_input").val(); 
		 /* Plus */
		 $("#plus_btn").on("click", function(){
			 $("#quantity_input").val(++quantity);
			 });
		 /* minus */
		 $("#minus_btn").on("click", function(){
				if(quantity > 1){
					$("#quantity_input").val(--quantity);
				}
			});
		/* ------------------------------------ */		
	/* --READY------------ */	
	});
</script>
</head>
<body>
		<!-- YK : product detail -->
	
	    <div class="store_product_detail_wrap">
        <div class="store_product_detail_contents">
            <div class="store_product_detail_img">
                <!-- 누른 해당 이미지 상품 보여주기 -->
                <img src="resources/img/food/ANF_유기농식스프리+소고기연어.jpg" alt="">
            </div>
            
            <div class="store_product_detail_text">
                <!-- 제품명 -->
                <h2>ANF MADE WITH ORGANIC 6Free+</h2>
                <hr>
                <!-- 제품명2 -->
                <p>Beef&Salmon</p>
                <span>5.6kg 
                    <strong>￦43,850</strong>
                </span><br>
                <span>1.8kg 
                    <strong>￦15,340</strong></span>
                    <div class="store_product_detail_option">
                        <select name="store_option" id="" class="store_product_datail_select">
                            <option value="">--- (필수)옵션선택 ---</option>
                            <option value="">5.6kg ￦43,850</option>
                            <option value="">1.8kg ￦15,340</option>
                        </select>
                        <p>배송비 ￦3,000원 (￦30,000 이상 무료배송)</p>
                    </div>
                    <!-- 결과창 -->
                    <div class="store_product_detail_result">
                        총액(수량):
                    </div>
                    <div class="store_product_detail_btn">
                        <button class="store_buy_btn" onclick="">구매하기</button>
                        <button class="store_bag_btn" onclick="">장바구니</button>
                    </div>
            </div>
        </div>
<!-- 리뷰 넣을건지? -->
		<div class="store_product_detail_review_wrap">
			<div class="store_product_detail_review">
				<h2>BEST REVIEW</h2>
				<!-- 최근 리뷰 5개만 보여줄지/ 페이징으로 5개씩 늘려나갈지? -->
				<div class="store_product_detail_review_img_wrap">
					<img src="resources/img/food/ANF_유기농식스프리+소고기연어.jpg" alt="리뷰이미지">
					<img src="resources/img/food/ANF_유기농식스프리+소고기연어.jpg" alt="리뷰이미지">
					<img src="resources/img/food/ANF_유기농식스프리+소고기연어.jpg" alt="리뷰이미지">
					<img src="resources/img/food/ANF_유기농식스프리+소고기연어.jpg" alt="리뷰이미지">
				</div>

<!-- 상품상세정보/사용후기/QnA -->

				<div class="tab_content">
					<input type="radio" name="tabmenu" id="tab01" checked>
					<label for="tab01">상품상세정보</label>
					<input type="radio" name="tabmenu" id="tab02">
					<label for="tab02">사용후기</label>
					<input type="radio" name="tabmenu" id="tab03">
					<label for="tab03">Q&A</label>
					
					<div class="conbox con1">
					상품상세정보
					</div>
					
					<div class="conbox con2">
					                <div class="store_product_detail_cont">
                    <!-- 사용후기 -->
                    <div class="store_product_detail_purchase_review">
                        <div class="store_product_detail_purchase_review_span">
                            <span>REVIEW</span>
                            <span>
                                <!-- 리뷰 게시물 총 갯수 알려주기 -->
                                (10)
                            </span>
                            <hr>
                        </div>
                        <div class="store_product_detail_purchase_review_star">
                            <div class="store_product_detail_purchase_review_center">
                                <span>
                                    <img src="resources/img/review_star.png" alt="">
                                </span>
                                <span>
                                    <!-- 총 별점 평균 점수 알려주기 -->
                                    4.8
                                </span>
                                <br>
                                <button onclick="review">상품리뷰 작성하기</button>
                            </div>
                            <div class="store_product_detail_purchase_review_alert">
                                <c:if test="${sessionScope.loginMember == null }">
                                <p>상품 리뷰는 <a href="loginandjoin.go">로그인</a>후 에 작성 가능합니다</p>
                                </c:if>
                            </div>

                        </div>


                    </div>
                </div>
					</div>
					
					<div class="conbox con3">
					컨텐츠탭 내용03
					</div>
				
				</div>
				

   


			
			
				
			

			</div>
		</div>
	</div>
    
    
	<div>
	<h1>${p.num_PK}</h1>
	<h1>${p.num_PK}</h1>
	<h1>${p.num_PK}</h1>
	<h1>${p.num_PK}</h1>
	<h1>${p.num_PK}</h1>
	<h1>${p.num_PK}</h1>
	${p.categoryNum}
	${p.name}
	${p.price}
	${p.vat}
	${p.contents}
	
	<img src="resources/team1ProductImgs/${products.thumbnail}" alt="${products.name}">
	${p.thumbnail}
	${p.img1}
	${p.img2}
	${p.img3}
	
	${p.tag}
	${p.onsale}
	${p.stock }
	</div>
	
	
	
	<div class="shoppingCart_team1" style="height: 500px;">
	<!-- 주문수량 관련 -->
			<div>
			Quantity
				<input type="text" id="quantity_input" value="1">
				<span>
					<button id="minus_btn">▼</button>
					<button id="plus_btn">▲</button>
				</span>
			<!-- 장바구니 넣기, 바로구매 버튼 -->
				<div class="button_set">
					<div> <button id="cart_btn">Add Cart</button></div>
					<div> <button id="buy_btn">Buy</button></div>
				</div>
			</div>
	</div>
	








</body>
</html>