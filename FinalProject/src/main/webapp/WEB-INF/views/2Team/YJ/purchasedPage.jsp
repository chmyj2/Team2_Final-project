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
	$('#payment').click(function(){
		 /* var checkArr = new Array();
		 $("#product header").each(function( i, e ) {
		checkArr.push($(".name").val());
					 
		});
		
		alert(checkArr); */
		
		var totalPrice = $('#totalPrice').text();
		$.ajax({
			url:'kakaopay',
			type : "POST",
			dataType:'json',
			data :	{"totalPrice" : totalPrice},
			success:function(data){
				var box = data.next_redirect_pc_url;
				window.open(box,"_blank", "width=450, height=200, top=100, left=100, popup=yes);
				//payInfoDB(); 
				{
					
				}
			},
			error:function(error){
				alert("실패");
			}
		});
	});
});



function payInfoDB() {
	alert("asd")
};



</script>
</head>
<body>

	<header id="site-header">
		<div class="container">
			<h1>배송 및 구매</h1>
		</div>
	</header>
	
	<c:choose>
	<c:when test="${sessionScope.loginMember !=null }">
<fieldset>
<div style="margin: 50px;">
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
      			<div class="divTableCell"> <input type="text" name="shipZip" id="shipZip"/></div>
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
      			<div class="divTableCell"><input type="text" name="billAddress"
                     id="billAddress"/></div>
      		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">휴대전화</div>
      			<div class="divTableCell"><input type="text" name="billCity" id="billCity"/></div>
    		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">배송지 주소</div>
      			<div class="divTableCell"><input type="text" name="billState" id="billState" placeholder="우편번호"  style="width: 200px;"/>
      									  <input type="text" name="billState1" id="billState1" placeholder="도로명주소" style="width: 200px;"/>
      									  <input type="text" name="billState2" id="billState2" placeholder="상세주소" style="width: 200px;"/>
      									  <span id="addrSearchBtn" style="display:inline;">[검색]</span></div>
    		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">배송 시 메모</div>
      			<div class="divTableCell"><input type="text" name="billZip" id="billZip"/></div>
    		</div>
    	
  	</div>
  	
  	</div>
      <div style=" margin-top: 20px;border: 3px solid #000000;">
      	<div>상품 정보</div>
      </div>
      
      <div class="divTable minimalistBlack">
      	<div class="container">

		<section id="cart" class="cart">  
		
		<form action="test" id="purchaseForm">
		<c:forEach items="${purchasedProducts }" var="p">
			<article id="product" class="product">
				<header>
						<img src="resources/t2_yj_files/${p.productThumbnail }">
						<input  type="hidden" name="thumbnail" value="${p.productThumbnail }">
						<input  type="hidden" name="name" class="name" id="name" value="${p.productName }">
						<input  type="hidden" name="quantity" value="${p.cart_ProductQuantity }">
						<input  type="hidden" name="price" value="${p.productPrice }">
					
				</header>
				<div class="content">
					<h1>${p.productName }</h1>
				</div>
				<footer class="content">
					<span class="qt-minus">수량 : </span>
					<span class="qt">${p.cart_ProductQuantity }</span>
					<span class="full-price">${p.productPrice * p.cart_ProductQuantity }</span>
					<h2 class="price">${p.productPrice}</h2>
					<h2 class="onePriceWon">가격 : </h2>
				</footer>
			</article>
</c:forEach>
		</form>

		</section>

	</div>
</div>
</fieldset>
	</c:when>
	<c:when test="${sessionScope.loginMember_business !=null }">
      <%-- <span class="loginOK-dropbtn">${sessionScope.loginMember_business.vet_ID }님</span>
      <span class="loginOK-dropbtn">${sessionScope.loginMember_business.vet_address }님</span>
      <span class="loginOK-dropbtn">${sessionScope.loginMember_business.vet_phoneNum }님</span> --%>
      
     <fieldset>
<div style="margin: 50px;">
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
      			<div class="divTableCell"><span name="shipAddress" id="shipAddress">${sessionScope.loginMember_business.vet_ID }</span></div>
      		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">휴대전화</div>
      			<div class="divTableCell"><span name="shipCity" id="shipCity">${sessionScope.loginMember_business.vet_phoneNum }</span></div>
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
      			<div class="divTableCell"> <input type="text" name="shipZip" id="shipZip"/></div>
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
      			<div class="divTableCell"><input type="text" name="billAddress"
                     id="billAddress"/></div>
      		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">휴대전화</div>
      			<div class="divTableCell"><input type="text" name="billCity" id="billCity"/></div>
    		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">배송지 주소</div>
      			<div class="divTableCell"><input type="text" name="billState" id="billState" placeholder="우편번호"  style="width: 200px;"/>
      									  <input type="text" name="billState1" id="billState1" placeholder="도로명주소" style="width: 200px;"/>
      									  <input type="text" name="billState2" id="billState2" placeholder="상세주소" style="width: 200px;"/>
      									  <span id="addrSearchBtn" style="display:inline;">[검색]</span></div>
    		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">배송 시 메모</div>
      			<div class="divTableCell"><input type="text" name="billZip" id="billZip"/></div>
    		</div>
    	
  	</div>
  	
  	</div>
      <div style=" margin-top: 20px;border: 3px solid #000000;">
      	<div>상품 정보</div>
      </div>
      
      <div class="divTable minimalistBlack">
      	<div class="container">

		<section id="cart" class="cart">  
		
		<form action="test" id="purchaseForm">
		<c:forEach items="${purchasedProducts }" var="p">
			<article class="product">
				<header>
						<img src="resources/t2_yj_files/${p.productThumbnail }">
						<input  type="hidden" name="thumbnail" value="${p.productThumbnail }">
						<input  type="hidden" name="name" class="name" id="name" value="${p.productName }">
						<input  type="hidden" name="quantity" value="${p.cart_ProductQuantity }">
						<input  type="hidden" name="price" value="${p.productPrice }">
					
				</header>
				<div class="content">
					<h1>${p.productName }</h1>
				</div>
				<footer class="content">
					<span class="qt-minus">수량 : </span>
					<span class="qt">${p.cart_ProductQuantity }</span>
					<span class="full-price">${p.productPrice * p.cart_ProductQuantity }</span>
					<h2 class="price">${p.productPrice}</h2>
					<h2 class="onePriceWon">가격 : </h2>
				</footer>
			</article>
</c:forEach>
		</form>

		</section>

	</div>
</div>
</fieldset>
     
      
	</c:when>
	<c:otherwise>
      <span class="loginOK-dropbtn">${sessionScope.loginMember_business.vet_ID }님</span>
      <span class="loginOK-dropbtn">${sessionScope.loginMember_business.vet_address }님</span>
      <span class="loginOK-dropbtn">${sessionScope.loginMember_business.vet_phoneNum }님</span>
	</c:otherwise>
</c:choose>
	

	<footer id="site-footer">
		<div class="container clearfix">

			<div class="left">
				<h2 class="subtotal">상품 금액 : <span id="subPrice"></span>원</h2>
				<h3 class="tax">배송비 : <span>2500</span>원</h3>
			</div>

			<div class="right">
				<h1 class="total">총 금액: <span id="totalPrice">0</span>원</h1>
				<a class="payment" id="payment">Payment</a>
			</div>

		</div>
	</footer>


</body>
</html>