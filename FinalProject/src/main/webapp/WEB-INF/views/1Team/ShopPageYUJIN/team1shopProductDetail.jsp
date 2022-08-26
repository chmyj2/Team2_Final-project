<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/StoreTapMenu.js"></script>
<script type="text/javascript" src="resources/js/store_detail.js"></script>
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
<script type="text/javascript">
$(function() {
	$('.starRev span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
//		  alert($(this).attr("value"));
		  alert($(this).attr("value"));
		let  a = $(this).attr("value")
		  $('#starrr').attr('value', a)
		  return false;
		});
});
</script>
<script type="text/javascript">
$(function() {
	$(".reviewUpdate").click(function() {
		let txt = $(this).parent().parent().find('span').text();
		$(this).parent().parent().find('span').toggle();
		$(this).parent().parent().find('input').toggle();
		$(this).parent().parent().find('input').val(txt);
		
		$.ajax({
			// 서버로 보낼 주소 입력
			url: "review.update",
			type: "post",
//			data: ,
//			success : 
			
		});
		
		
		
	});
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
			</div>

<!-- 상품상세정보/사용후기/QnA -->

				<div class="tab_content">
					<input type="radio" name="tabmenu" id="tab01" >
					<label for="tab01">상품상세정보</label>
					<input type="radio" name="tabmenu" id="tab02" checked>
					<label for="tab02">사용후기</label>
					<input type="radio" name="tabmenu" id="tab03">
					<label for="tab03">Q&A</label>
					
					
					
					<!------------- 상품 상세 정보 란 ------------->
					<div class="conbox con1">
					상품상세정보
					</div>
					
					
					
                                        <!-- 사용후기 -->
				<div class="conbox con2">
					<div class="store_product_detail_cont">
						<div class="store_product_detail_purchase_review_span">
							<span>REVIEW</span> 
							<span> 
							 (${p})
							</span>
						</div>
						<div class="store_product_detail_purchase_review">
							<div class="store_product_detail_purchase_review_star">
									<form action="write.review1" method="post" enctype="multipart/form-data">
								<div class="store_product_detail_purchase_review_center">
									<span> 
										<img src="resources/img/review_star.png" alt="">
									</span> 
									<span> <!-- 총 별점 평균 점수 알려주기 --> 
										${avg}
									</span> 
									<br>
									<button onclick="review">상품리뷰 작성하기</button>
									<div class="store_product_detail_purchase_review_alert">
										<c:if test="${sessionScope.loginMember == null }">
											<p>
												상품 리뷰는 <a href="loginandjoin.go"
													style="background-color: yellow;">로그인</a>후 에 작성 가능합니다
											</p>
										</c:if>
									</div>
								</div>

								<div class="store_product_detail_purchase_review_cont">
									<h2>REVIEW</h2>
									<!-- 제목 -->
									<input type="text" name="review_title"> <br>
									<!-- 내용 -->
									<textarea name="review_text" id="" placeholder="write text"></textarea>
									<!-- 파일첨부 -->
									<input type="file" name="review_img">
									<!-- 별점주기 -->

									<div class="starRev">
										<span class="starR" value="1">★</span> 
										<span class="starR" value="2">★</span> 
										<span class="starR" value="3">★</span> 
										<span class="starR" value="4">★</span>
										<span class="starR" value="5">★</span> 
										<input type="hidden" name="review_star" id="starrr" value="0">
									</div>
									
										<button>리뷰작성완료</button>
									</div>
								</form>
								
								
								
								
								<div class="store_product_detail_purchase_review_center">
									<span> 
										<img src="resources/img/review_star.png" alt="">
									</span> 
									<span> <!-- 총 별점 평균 점수 알려주기 --> 
										${avg}
									</span> 
									<br>
									<button onclick="review">상품리뷰 작성하기</button>
									<div class="store_product_detail_purchase_review_alert">
										<c:if test="${sessionScope.loginMember == null }">
											<p>
												상품 리뷰는 <a href="loginandjoin.go"
													style="background-color: yellow;">로그인</a>후 에 작성 가능합니다
											</p>
										</c:if>
									<div class="store_product_detail_purchase_review_center_sub">
										<ul> 
										<li><span>★★★★★</span> 아주 만족해요</li>
										<li><span>★★★★</span> 만족해요</li>
										<li><span>★★★</span> 보통이에요</li>
										<li><span>★★</span>  그냥 그래요</li>
										<li><span>★</span> 별로에요</li>
										</ul>
									</div>
									</div>
								</div>
								
								<!-- 콘텐츠 세로줄  -->
							<!-- <div class="vertical_line">
							</div> -->
								
								

								<form action="write.review1" method="post" enctype="multipart/form-data">
								<div class="store_product_detail_purchase_review_cont">
									<h2>REVIEW</h2>
									<!-- 제목 -->
									<input type="text" name="review_title"> <br>
									<!-- 내용 -->
									<textarea name="review_text" id="" placeholder="write text"></textarea>
									<!-- 파일첨부 -->
									<input type="file" name="review_img">
									<!-- 별점주기 -->

									<div class="starRev">
										<span class="starR" value="1">★</span> 
										<span class="starR" value="2">★</span> 
										<span class="starR" value="3">★</span> 
										<span class="starR" value="4">★</span>
										<span class="starR" value="5">★</span> 
										<input type="hidden" name="review_star" id="starrr" value="0">
									</div>
									
										<button>리뷰작성완료</button>
									</div>
								</form>
							</div>
						</div>
						
					</div>


					<!-- 리뷰 보여주기 -->
					<div class="store_product_detail_purchase_reviews">
						<div class="store_review_state">
							<ul>
								<li>
									<!-- 평점 순 정리하기 --> 평점순
								</li>
							</ul>
						</div>
						<c:forEach var="r" items="${r}">
						<div class="store_review_tbody">
							<div class="store_review_header">
								<div class="store_review_star">
									<c:if test="${r.review_star == 5}">
									<img alt="" src="resources/img/review_star.png">
									<img alt="" src="resources/img/review_star.png">
									<img alt="" src="resources/img/review_star.png">
									<img alt="" src="resources/img/review_star.png">
									<img alt="" src="resources/img/review_star.png">
									</c:if>
									<c:if test="${r.review_star == 4}">
									<img alt="" src="resources/img/review_star.png">
									<img alt="" src="resources/img/review_star.png">
									<img alt="" src="resources/img/review_star.png">
									<img alt="" src="resources/img/review_star.png">
									</c:if>
									<c:if test="${r.review_star == 3}">
									<img alt="" src="resources/img/review_star.png">
									<img alt="" src="resources/img/review_star.png">
									<img alt="" src="resources/img/review_star.png">
									</c:if>
									<c:if test="${r.review_star == 2}">
									<img alt="" src="resources/img/review_star.png">
									<img alt="" src="resources/img/review_star.png">
									</c:if>
									<c:if test="${r.review_star == 1}">
									<img alt="" src="resources/img/review_star.png">
									</c:if>
								</div>
								<div class="store_review_title">
									${r.review_title}
								</div>
								<div class="store_review_id_cont">
									<div class="store_review_id">
										<span>${r.review_id}</span>님의 후기입니다.
									</div>
									<div class="store_review_date">
									<fmt:formatDate value="${r.review_date}" pattern="yy-MM-dd HH:mm"/>
									
									</div>
								</div>
							</div>



							<div class="store_review_txt_cont">
									<div class="store_review_img_cont">
										<img class="store_review_img"
											src="resources/reviewFile/${r.review_img}" alt="">
									</div>
									<div class="store_review_txt">
										<span id="r">${r.review_txt}</span>
										<input style="display: none;" class="store_review_list_update" type="text"> 
									</div>
									<div class="store_review_btn_stat">
										<!-- 수정 Ajax -->
										<button class="reviewUpdate">수정</button>
										<button class="reviewDelete" onclick="location.href='review.delete?review_num=${r.review_num}'">삭제</button>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
					<div class="store_review_paging">
							<a href="get.aProductTeam1?page=1">◀</a>
						<c:forEach var="r" begin="1" end="${pageCount}">
							<a href="get.aProductTeam1?page=${r}">${r}</a>
						</c:forEach>
							<a href="get.aProductTeam1?page=${pageCount}">▶</a>
					</div>
				<!-- 컨박스 -->



				<!------------------ Q&A 영역 ------------------>
					<div class="conbox con3">
					컨텐츠탭 내용03
					</div>
				
				</div>
				

   


			
			
				
			

			
		</div>
	</div>

    
	<%-- <div>
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
	</div> --%>
	





</body>
</html>