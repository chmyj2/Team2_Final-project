<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	<!-- YK : product detail -->
	
	    <div class="store_product_detail_wrap">
        <div class="store_product_detail_contents">
            <div class="store_product_detail_img">
                <!-- 누른 해당 이미지 상품 보여주기 -->
                <img src="resources/img/ANF_유기농식스프리+소고기연어.jpg" alt="">
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
    </div>








</body>
</html>