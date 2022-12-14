<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='resources/t2_css/purchasedPage.css' rel="stylesheet" type="text/css">
<script type="text/javascript">
$(function(){
	
	
	var totalPrice = $('#totalPrice').text(); // 총금액
	
	$('#payment').click(function(){
		
		var Recipient = document.getElementById("billAddress").value; // 받는사람 이름
		var phoneNum = document.getElementById("billCity").value; // 받는사람 전화번호
		var billState = document.getElementById("billState").value; // 우편번호
		var billState1 = document.getElementById("billState1").value; // 도로명주소
		var billState2 = document.getElementById("billState2").value; // 상세주소
		
		
		if (Recipient == "") {
			alert("受取人を入力してください。")
			return false;
		}else if (phoneNum == "") {
			alert("電話番号を入力してください。")
			return false;
		}else if (billState == "") {
			alert("郵便番号を入力してください。")
			return false;
		}else if (billState1 == "") {
			alert("道路名住所を入力してください。")
			return false;
		}else if (billState2 == "") {
			alert("詳細アドレスを入力してください。")
			return false;
		}else {
			$.ajax({
				url:'kakaopay',
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
					alert("失敗");
				}
			});
		}
	});
});
</script>
</head>
<body>
	<header style="margin: 40px; id="site-header">
		<div class="container">
			<h1>配送 / 購入</h1>
		</div>
	</header>
	
	<c:choose>
	<c:when test="${sessionScope.loginMember !=null }">
<fieldset>
<div style="margin: 50px;">
      <div style=" margin-bottom: 20px;" class="titleTxt">
      	<div>Order / Payment</div>
      </div>
      <div style=" margin-top: 30px;" class="InfoTxt">
      	<div>会員情報</div>
      </div>
      <div class="divTable minimalistBlack" id="shippingAddress">
      	<div class="divTableHeading">
    		<div class="divTableRow">
    		<div class="divTableHead">Recipient Info</div>
    		<div class="divTableHead">オーダー情報</div>
    		</div>
  		</div>
  		<div class="divTableBody">
    		<div class="divTableRow">
      			<div class="divTableCell">オーダー</div>
      			<div class="divTableCell"><span name="shipAddress" id="shipAddress">${sessionScope.loginMember.member_ID }</span></div>
      		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">電話番号</div>
      			<div class="divTableCell"><span name="shipCity" id="shipCity">${sessionScope.loginMember.member_phoneNum }</span></div>
    		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">住所</div>
      			<div class="divTableCell"><span name="shipState" id="shipState">${addr[2]}</span>
      									  <span name="shipState1" id="shipState1">${addr[0]}</span>
      									  <span name="shipState2" id="shipState2">${addr[1]}</span>
      									</div>
    		</div>
  	</div>
	</div>
	
	
	<div style=" margin-top: 30px;" class="InfoTxt">
      	<div>配送情報
      	<input type="checkbox" id="sameAddressControl"/>会員情報と同じです。</div>
      </div>
      <div class="divTable minimalistBlack" id="billingAddress">
      
      	<div class="divTableHeading">
    		<div class="divTableRow">
    		<div class="divTableHead">Orderer Info</div>
    		<div class="divTableHead">オーダー情報</div>
    		</div>
  		</div>
  		<div class="divTableBody">
    		<div class="divTableRow">
      			<div class="divTableCell">受取人</div>
      			<div class="divTableCell"><input type="text" name="billAddress"
                     id="billAddress"/></div>
      		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">電話番号</div>
      			<div class="divTableCell"><input type="text" name="billCity" id="billCity"/></div>
    		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">配送先住所</div>
      			<div class="divTableCell"><input type="text" name="billState" id="billState" class="billState" placeholder="郵便番号"  style="width: 200px;"/>
      									  <input type="text" name="billState1" id="billState1" placeholder="道路名住所" style="width: 200px;"/>
      									  <input type="text" name="billState2" id="billState2" placeholder="詳細住所" style="width: 200px;"/>
      									  <span id="addrSearchBtn" style="display:inline;">[検索]</span></div>
    		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">メモ</div>
      			<div class="divTableCell"><input type="text" name="billZip" id="billZip" placeholder="安全に発送してください。"/></div>
    		</div>
    	
  	</div>
  	
  	</div>
      <div style=" margin-top: 30px;" class="InfoTxt">
      	<div>商品情報</div>
      </div>
      
      <div class="divTable minimalistBlack">
      	<div class="container">

		<section id="cart" class="cart">  
		
		<form action="test" id="purchaseForm">
		<c:forEach items="${purchasedProducts }" var="p">
		<div  id="product" class="product">
			<article>
				<header>
						<img src="resources/t2_yj_files/${p.productThumbnail }">
						<input  type="hidden" name="thumbnail" value="${p.productThumbnail }">
						<input  type="hidden" name="name" class="name" id="name" value="${p.productName }">
						<input  type="hidden" name="quantity" value="${p.cart_ProductQuantity }">
						<input  type="hidden" name="price" value="${p.productPrice }">
						<input  type="hidden" name="cartNum" value="${p.cartNum }">
						<input  type="hidden" name="productNum" value="${p.productNum }">
						<input  type="hidden" id="Order_User_ID" name="Order_User_ID" value="${sessionScope.loginMember.member_ID }">
					
				</header>
				<div class="content">
					<span class="p_name">${p.productName }</span>
				</div>
				<footer class="content">
					
					<span class="qt-minus">数量 : </span>
					<span class="qt">${p.cart_ProductQuantity }</span>
					<span class="full-price">${p.productPrice * p.cart_ProductQuantity }</span>
					<h2 class="price">${p.productPrice}</h2>
					<h2 class="onePriceWon">価格 : </h2>
				</footer>
			</article>
			</div>
</c:forEach>
		</form>

		</section>

	</div>
</div>
</fieldset>
	</c:when>
	<c:when test="${sessionScope.loginMember_business !=null }">
     <fieldset>
<div style="margin: 50px;">
      <div style=" margin-bottom: 20px;" class="titleTxt">
      	<div>Order / Payment</div>
      </div>
      <div style=" margin-top: 30px;" class="InfoTxt">
      	<div>会員情報</div>
      </div>
      <div class="divTable minimalistBlack" id="shippingAddress">
      	<div class="divTableHeading">
    		<div class="divTableRow">
    		<div class="divTableHead">Recipient Info</div>
    		<div class="divTableHead">オーダー情報</div>
    		</div>
  		</div>
  		<div class="divTableBody">
    		<div class="divTableRow">
      			<div class="divTableCell">オーダ</div>
      			<div class="divTableCell"><span name="shipAddress" id="shipAddress">${sessionScope.loginMember_business.vet_ID }</span></div>
      		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">電話番号</div>
      			<div class="divTableCell"><span name="shipCity" id="shipCity">${sessionScope.loginMember_business.vet_phoneNum }</span></div>
    		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">住所</div>
      			<div class="divTableCell"><span name="shipState" id="shipState">${addr[2]}</span>
      									  <span name="shipState1" id="shipState1">${addr[0]}</span>
      									  <span name="shipState2" id="shipState2">${addr[1]}</span>
      									</div>
    		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">メモ</div>
      			<div class="divTableCell"> <input type="text" name="shipZip" id="shipZip" value="安全に発送してください。""/></div>
    		</div>
  	</div>
	</div>
	
	
	<div style=" margin-top: 30px;" class="InfoTxt">
      	<div>배송 정보
      	<input type="checkbox" id="sameAddressControl"/>会員情報と同じです。</div>
      </div>
      <div class="divTable minimalistBlack" id="billingAddress">
      
      	<div class="divTableHeading">
    		<div class="divTableRow">
    		<div class="divTableHead">Orderer Info</div>
    		<div class="divTableHead">オーダー情報</div>
    		</div>
  		</div>
  		<div class="divTableBody">
    		<div class="divTableRow">
      			<div class="divTableCell">受取人</div>
      			<div class="divTableCell"><input type="text" name="billAddress"
                     id="billAddress"/></div>
      		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">電話番号</div>
      			<div class="divTableCell"><input type="text" name="billCity" id="billCity"/></div>
    		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">配送先住所</div>
      			<div class="divTableCell"><input type="text" name="billState" id="billState" class="billState" placeholder="郵便番号"  style="width: 200px;"/>
      									  <input type="text" name="billState1" id="billState1" placeholder="道路名住所" style="width: 200px;"/>
      									  <input type="text" name="billState2" id="billState2" placeholder="詳細住所" style="width: 200px;"/>
      									  <span id="addrSearchBtn" style="display:inline;">[検索]</span></div>
    		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">メモ</div>
      			<div class="divTableCell"><input type="text" name="billZip" id="billZip" placeholder="安全に発送してください。"/></div>
    		</div>
    	
  	</div>
  	
  	</div>
      <div style=" margin-top: 30px;" class="InfoTxt">
      	<div>商品情報</div>
      </div>
      
      <div class="divTable minimalistBlack">
      	<div class="container">

		<section id="cart" class="cart">  
		
		<form action="test" id="purchaseForm">
		<c:forEach items="${purchasedProducts }" var="p">
		<div  id="product" class="product">
			<article>
				<header>
						<img src="resources/t2_yj_files/${p.productThumbnail }">
						<input  type="hidden" name="thumbnail" value="${p.productThumbnail }">
						<input  type="hidden" name="name" class="name" id="name" value="${p.productName }">
						<input  type="hidden" name="quantity" value="${p.cart_ProductQuantity }">
						<input  type="hidden" name="price" value="${p.productPrice }">
						<input  type="hidden" name="cartNum" value="${p.cartNum }">
						<input  type="hidden" name="productNum" value="${p.productNum }">
						<input  type="hidden" id="Order_User_ID" name="Order_User_ID" value="${sessionScope.loginMember_business.vet_ID }">
					
				</header>
				<div class="content">
					<span class="p_name">${p.productName }</span>
				</div>
				<footer class="content">
					<span class="qt-minus">数量 : </span>
					<span class="qt">${p.cart_ProductQuantity }</span>
					<span class="full-price">${p.productPrice * p.cart_ProductQuantity }</span>
					<h2 class="price">${p.productPrice}</h2>
					<h2 class="onePriceWon">価格 : </h2>
				</footer>
			</article>
			</div>
</c:forEach>
		</form>

		</section>

	</div>
</div>
</fieldset>
     
      
	</c:when>
	<c:otherwise>
	</c:otherwise>
</c:choose>
	

	<footer id="site-footer">
		<div class="container clearfix">

			<div class="left">
				<h2 class="subtotal">Price : <span id="subPrice"></span>₩</h2>
				<h3 class="tax">Shipping Price : <span>2500</span>₩</h3>
			</div>

			<div class="right">
				<h1 class="total">Total Price: <span id="totalPrice">0</span>₩</h1>
				<a class="button reverse dark" id="payment">お支払い</a>
				
			</div>
			
			
	
		</div>
	</footer>


</body>
<script type="text/javascript">

function deletANDINsert(){
	
	var cartNum = document.getElementsByName("cartNum");	// 카트 번호(삭제할때 씀)
	var productNum = document.getElementsByName("productNum"); // 상품pk
	var quantity = document.getElementsByName("quantity");	// 상품 수량
	
	var totalPrice = $('#totalPrice').text(); // 총금액
	var shipAddress = $('#shipAddress').text();	// 회원 id
	var Recipient = document.getElementById("billAddress").value; // 받는사람 이름
	var phoneNum = document.getElementById("billCity").value; // 받는사람 전화번호
	var billState = document.getElementById("billState").value; // 우편번호
	var billState1 = document.getElementById("billState1").value; // 도로명주소
	var billState2 = document.getElementById("billState2").value; // 상세주소
	var memo = document.getElementById("billZip").value; // 메모
	var Order_User_ID = document.getElementById("Order_User_ID").value; // 주문자 이름
	var productName = document.getElementsByName("name"); // 상품이름
	var price = document.getElementsByName("price"); // 상품 금액
	var thumbnail = document.getElementsByName("thumbnail"); // 상품 금액
	
	
	var cartNumArr = new Array();
	var productNumArr = new Array();
	var quantityArr = new Array();
	var pricekArr = new Array();
	var produckNameArr = new Array();
	var thumbnailArr = new Array();
		
	$(".product").each(function( i, e ) {
		cartNumArr.push(cartNum[i].value);
		productNumArr.push(productNum[i].value);
		quantityArr.push(quantity[i].value);
		pricekArr.push(price[i].value);
		produckNameArr.push(productName[i].value);
		thumbnailArr.push(thumbnail[i].value);
		
	});
	
	alert(Order_User_ID);
	
	location.href='deleteAndInsertAndUpdatePurchasedProduct?cartNumArr=' + cartNumArr + 
			"&productNumArr=" + productNumArr + 
			"&quantityArr=" + quantityArr +
			"&shipAddress=" + shipAddress + 
			"&phoneNum=" + phoneNum + 
			"&billState=" + billState + 
			"&billState1=" + billState1 + 
			"&billState2=" + billState2 + 
			"&memo=" + memo + 
			"&pricekArr=" + pricekArr + 
			"&totalPrice=" + totalPrice + 
			"&Recipient=" + Recipient +
			"&thumbnailArr=" + thumbnailArr + 
			"&Order_User_ID=" + Order_User_ID
			
	
	};


</script>
</html>