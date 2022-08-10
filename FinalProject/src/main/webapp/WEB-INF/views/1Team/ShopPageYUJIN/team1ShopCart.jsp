<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Quantity Button -->
<script type="text/javascript">
	
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
		 // 서버로 전송할 데이터
			const form = {
				m_id : '${sessionScope.loginMember.m_id }',
				Num_PK :'${products.num_PK}',
				Cart_ProductQuantity : ''
			} 
		 
		 // click Add Cart	
		 	$("#cart_btn").on("click", function(e){
					form.Cart_ProductQuantity = $("#quantity_input").val();
		 	$.ajax({
		 		url: 'team1.addCart',
		 		type: 'POST',
		 		data: form,
		 		success: function(result){
		 				cartAlert(result);
					}
		 		/* ajax 마지막줄 */
		 		});	
		 		/* click fucn 마지막줄 */
			});
		
			function cartAlert(result){
				if(result == '0'){
					alert("장바구니에 추가를 하지 못하였습니다.");
				} else if(result == '1'){
					alert("장바구니에 추가되었습니다.");
				} else if(result == '2'){
					alert("장바구니에 이미 추가되어져 있습니다.");
				} else if(result == '5'){
					alert("로그인이 필요합니다.");	
				}
			}	 
	/* --READY------------ */	
	});
</script>

</head>
<body>


	<div style="height: 500px;"></div>
	
	
	


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
					<div> <a id="cart_btn">Add Cart</a></div>
					<div> <a id="buy_btn">Buy</a></div>
				</div>
			</div>
	</div>














	
</body>
</html>