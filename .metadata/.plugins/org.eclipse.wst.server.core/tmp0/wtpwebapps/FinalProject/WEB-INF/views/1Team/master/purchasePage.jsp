<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='resources/t2_css/purchasedPage.css' rel="stylesheet" type="text/css">
<script type="text/javascript" src="resources/js/purchasePage.js"></script>
<script type="text/javascript">
$(function(){
	
	var ProductPrice = document.getElementById("ProductPrice").value;
	var quantity = document.getElementById("quantity").value;
	
	$('#price').text(ProductPrice * quantity);
	$('#subPrice').text(ProductPrice * quantity);
	$('#totalPrice').text(ProductPrice * quantity + 3000);
	
	
	
	
	
 $('#sameAddressControl').click(function(){
	 console.log("asdasd");
     $("#addrSearchBtn").css("display","inline");
     var same = this.checked;
     $('#billAddress').val(same ? $('#shipAddress').text():'');
     $('#billCity').val(same ? $('#shipCity').text():'');
     $('#billState').val(same ? $('#shipState').text():'');
     $('#billState1').val(same ? $('#shipState1').text():'');
     $('#billState2').val(same ? $('#shipState2').text():'');
     $('#billZip').val(same ? $('#shipZip').val():'');
          if(same == true){
              $('#billingAddress input').filter('input:text')
             	 .attr('readonly',true)
             	 .css('opacity', 0.5);
             $("#addrSearchBtn").css("display","none");
             	}else{
              $('#billingAddress input').filter('input:text').attr('readonly',false)
           	 .css('opacity', 1);
          }
   });
 
 $('#payment').click(function(){
	 	var totalPrice = $('#totalPrice').text();
		$.ajax({
		url:'team1_kakaopay',
		type : "POST",
		dataType:'json',
		data :	{"totalPrice" : totalPrice},
		success:function(data){
			var box = data.next_redirect_pc_url;
			var kakaoPop= window.open(box,'kakaoPay','width=500, height=800');
			{
				
			}
		},
		error:function(error){
			alert("실패");
		}
	});
});

	
}); 



function UpdateANDINsert() {
	
	var totalPrice = $('#totalPrice').text(); // 총금액
	alert("총금액 : " + totalPrice);
	
	 var shipAddress = $('#shipAddress').text();	// 회원 정보
	alert("주문자ID : " + shipAddress);
	 
	var Recipient = document.getElementById("billAddress").value;  // 받는사람
	alert("수령인 : " + Recipient);
	
	/* 
	var phoneNum = document.getElementById("billCity").value; // 받는사람 전화번호
	alert("수령인 전화번호 : " + phoneNum);
	
	var billState = document.getElementById("billState").value; // 우편번호
	alert("수령인 우편번호 : " + billState);
	
	var billState1 = document.getElementById("billState1").value; // 도로명주소
	alert("수령인 도로명주소 : " + billState1);
	
	var billState2 = document.getElementById("billState2").value; // 상세주소
	alert("수령인 상세주소 : " + billState2);
	  */
	/* var memo = document.getElementById("billZip").value; // 메모
	alert("메모 : " + billZip);
	 */
	 
	/*  var p_name = document.getElementsById("p_name"); // 상품이름
	alert("상품이름 : " + p_name);
	
	var qt = document.getElementsById("qt"); // 수량
	alert("상품수량 : " + qt);
	
	var ProductPrice = document.getElementsById("ProductPrice"); // 상품 금액
	alert("상품금액 : " + ProductPrice); */
	 
	
				 
	
/* 	var = 
	
	
	location.href='UpdateANDINsert'; */
	
}


</script>
</head>
<body>
	
<fieldset>
      <div style=" margin-bottom: 20px;border: 3px solid #000000;">
      	<div>Order / Payment</div>
      </div>
      <div style=" margin-top: 20px;border: 3px solid #000000;">
      	<div>회원 정보</div>
      </div>
      <div class="divTable minimalistBlack" id="shippingAddress">
      	<div class="divTableHeading">
    		<div class="divTableRow">
    		<div class="divTableHead">Recipient Info</div>
    		<div class="divTableHead">주문자 정보</div>
    		</div>
  		</div>
  		<div class="divTableBody">
    		<div class="divTableRow">
      			<div class="divTableCell">주문자</div>
      			<div class="divTableCell"><span name="shipAddress" id="shipAddress">${sessionScope.loginMember.member_ID }</span></div>
      		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">휴대전화</div>
      			<div class="divTableCell"><span name="shipCity" id="shipCity">${sessionScope.loginMember.member_phoneNum }</span></div>
    		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">주소</div>
      			<div class="divTableCell"><span name="shipState" id="shipState">${addr[2]}</span>
      									  <span name="shipState1" id="shipState1">${addr[0]}</span>
      									  <span name="shipState2" id="shipState2">${addr[1]}</span>
      									</div>
    		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">배송 시 메모</div>
      			<div class="divTableCell"> <input type="text" name="shipZip" id="shipZip" value="빠른 배송 부탁드립니다.""/></div>
    		</div>
  	</div>
	</div>
	
	
	<div style=" margin-top: 20px;border: 3px solid #000000;">
      	<div>배송 정보
      	<input type="checkbox" id="sameAddressControl"/>회원정보와 동일합니다.</div>
      </div>
      <div class="divTable minimalistBlack" id="billingAddress">
      
      	<div class="divTableHeading">
    		<div class="divTableRow">
    		<div class="divTableHead">Orderer Info</div>
    		<div class="divTableHead">주문자 정보</div>
    		</div>
  		</div>
  		<div class="divTableBody">
    		<div class="divTableRow">
      			<div class="divTableCell">수령인</div>
      			<div class="divTableCell"><input type="text" name="billAddress" id="billAddress"/></div>
      		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">휴대전화</div>
      			<div class="divTableCell"><input type="text" name="billCity" id="billCity"/></div>
    		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">배송지 주소</div>
      			<div class="divTableCell"><input type="text" name="billState" id="billState" class="billState" placeholder="우편번호"  style="width: 200px;"/>
      									  <input type="text" name="billState1" id="billState1" placeholder="도로명주소" style="width: 200px;"/>
      									  <input type="text" name="billState2" id="billState2" placeholder="상세주소" style="width: 200px;"/>
      									  <span id="addrSearchBtn" style="display:inline;">[검색]</span></div>
    		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">배송 시 메모</div>
      			<div class="divTableCell"><input type="text" name="billZip" id="billZip" placeholder="빠른 배송 부탁드립니다."/></div>
    		</div>
    		
    	
  	</div>
  	
  	</div>
      <div style=" margin-top: 20px;border: 3px solid #000000;">
      	<div>상품 정보</div>
      </div>
      
      <div class="divTable minimalistBlack">
      	<div class="container">

		<section id="cart" class="cart">  
		
		<div  id="product" class="product">
			<article>
				<header>
						<img src="resources/reviewFile/${product.product_thumnail }">
				</header>
				<div>
    			<input type="hidden" value="${sessionScope.loginMember.member_ID }" id="Order_User_ID">
    			<input type="hidden" value="${product.product_num }" id="Order_ProductNum">
    			<input type="hidden" value="${product.product_price * param.quantity + 3000}" id="Order_TotalPrice">
    			<input type="hidden" value="${product.product_thumnail }" id="Order_thumbnail">
    		</div>
				<div class="content">
					<span class="p_name" id="p_name">${product.product_title }</span>
				</div>
				<footer class="content">
				<input id="ProductPrice" type="hidden" value="${product.product_price }">
				<input id="quantity" type="hidden" value="${param.quantity }">
					<span class="qt-minus" id="qt">수량 : ${param.quantity }</span>
					<span class="price" id="price" ></span>
					<span class="onePriceWon">가격 : </span>
				</footer>
			</article>
			</div>

		</section>

	</div>
</div>
</fieldset>
	

	<footer id="site-footer">
		<div class="container clearfix">

			<div class="left">
				<h1 class="subtotal"><span id="subPrice"></span>원</h1>
				<h3 class="tax">배송비 : <span>3000</span>원</h3>
			</div>

			<div class="right">
				<h1 class="total"><span id="totalPrice"></span>원</h1>
				<a class="payment" id="payment">Payment</a>
			</div>

		</div>
	</footer>


</body>
<script type="text/javascript">

function orderInsert(){
	
	
	var Order_User_ID = document.getElementById("Order_User_ID").value; // 주문자
	var phoneNum = document.getElementById("billCity").value; // 폰넘버
	var quantity = document.getElementById("quantity").value; // 수량
	var Order_ProductNum = document.getElementById("Order_ProductNum").value; // 수량
	var billState = document.getElementById("billState").value; // 우편번호
	var billState1 = document.getElementById("billState1").value; // 도로명주소
	var billState2 = document.getElementById("billState2").value; // 상세주소
	
	var ProductPrice = document.getElementById("ProductPrice").value; // 상품1개 가격
	var Order_TotalPrice = document.getElementById("Order_TotalPrice").value; // 상품1개 가격
	var memo = document.getElementById("billZip").value; // 메모
	var Recipient = document.getElementById("billAddress").value; // 수령인
	var Order_thumbnail = document.getElementById("Order_thumbnail").value; // 메모
	
	
	
	location.href='orderInsert.do?Order_User_ID=' + Order_User_ID +
			'&Order_ProductNum=' + Order_ProductNum +
			'&Order_PhoneNumber=' + phoneNum +
			'&Product_Quantity=' + quantity +
			'&billState=' + billState +
			'&billState1=' + billState1 +
			'&billState2=' + billState2 +
			'&Product_Price=' + ProductPrice +
			'&Order_TotalPrice=' + Order_TotalPrice +
			'&Shipping_Memo=' + memo +
			'&Recipient=' + Recipient +
			'&Order_thumbnail=' + Order_thumbnail;
	};


</script>

</html>