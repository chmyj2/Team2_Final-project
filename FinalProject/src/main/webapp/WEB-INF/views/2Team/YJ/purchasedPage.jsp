<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

$(function() {
		
		var checkArr = new Array();
		var total = 0;
		$("#cart .full-price").each(function( i, e ) {
		     console.log($(this).text());
		     checkArr.push($(this).text());
		     total += Number(checkArr[i]);
		   });
		     $('#subPrice').text(total);
		     $('#totalPrice').text(total + 2500);
		     
		     
		     
		     
		 $('#sameAddressControl').click(function(){
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
		     
		     
        
});



function goPurchasePage() {
	   
	
	$('#purchaseForm').submit();
	
	
}



  

</script>

<style type="text/css">


.clearfix {
  content: "";
  display: table;
  clear: both;	
}

.container {
	font-family: 'Open Sans', sans-serif;
	margin: 0 auto;
	width: 100%;
}

#cart {
	width: 100%;
}

#cart h1 {
	font-weight: 300;
}

#cart a {
	color: #53b5aa;
	text-decoration: none;

	-webkit-transition: color .2s linear;
	-moz-transition: color .2s linear;
	-ms-transition: color .2s linear;
	-o-transition: color .2s linear;
	transition: color .2s linear;
}

#cart a:hover {
	color: #000;
}


.product {
	border: 1px solid #eee;
	margin: 20px 0;
	width: 100%;
	height: 195px;
	position: relative;

	-webkit-transition: margin .2s linear, opacity .2s linear;
	-moz-transition: margin .2s linear, opacity .2s linear;
	-ms-transition: margin .2s linear, opacity .2s linear;
	-o-transition: margin .2s linear, opacity .2s linear;
	transition: margin .2s linear, opacity .2s linear;
}

.product img {
	width: 100%;
	height: 100%;
}

.product header, .product .content {
	background-color: #fff;
	border: 1px solid #ccc;
	border-style: none none solid none;
	float: left;
}

.product header {
	background: #000;
	margin: 0 1% 20px 0;
	overflow: hidden;
	padding: 0;
	position: relative;
	width: 24%;
	height: 195px;
}


.product .content {
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	height: 140px;
	padding: 0 20px;
	width: 75%;
}

.product h1 {
	color: #53b5aa;
	font-size: 25px;
	font-weight: 300;
	margin: 17px 0 20px 0;
}

.product footer.content {
	height: 50px;
	margin: 6px 0 0 0;
	padding: 0;
}

.product footer .price {
	background: #f0f0f0;
	color: #000;
	float: right;
	font-size: 15px;
	font-weight: 300;
	line-height: 49px;
	margin: 0;
	padding: 0 30px;
}

.product footer .full-price {
	background: #53b5aa;
	color: #fff;
	float: right;
	font-size: 22px;
	font-weight: 300;
	line-height: 49px;
	margin: 0;
	padding: 0 30px;

	-webkit-transition: margin .15s linear;
	-moz-transition: margin .15s linear;
	-ms-transition: margin .15s linear;
	-o-transition: margin .15s linear;
	transition: margin .15s linear;
}


.qt {
	font-size: 19px;
	line-height: 50px;
	width: 70px;
	text-align: center;
}

.qt-minus {
	border: none;
	font-size: 25px;
	font-weight: 200;
	height: 100%;
	padding: 0 20px;
}



.qt-minus {
	line-height: 47px;
}

#site-footer {
	margin: 30px 0 0 0;
}

#site-footer {
	padding: 40px;
}

#site-footer h1 {
	background: #f0f0f0;
	border: 1px solid #ccc;
	border-style: none none solid none;
	font-size: 24px;
	font-weight: 300;
	margin: 0 0 7px 0;
	padding: 14px 40px;
	text-align: center;
}

#site-footer h2 {
	font-size: 24px;
	font-weight: 300;
	margin: 10px 0 0 0;
}

#site-footer h3 {
	font-size: 19px;
	font-weight: 300;
	margin: 15px 0;
}

.left {
	float: left;
}

.right {
	float: right;
}

.CheckOutbtn {
	background: #53b5aa;
	border: 1px solid #999;
	border-style: none none solid none;
	cursor: pointer;
	display: block;
	color: #fff;
	font-size: 20px;
	font-weight: 300;
	padding: 16px 0;
	width: 290px;
	text-align: center;

	-webkit-transition: all .2s linear;
	-moz-transition: all .2s linear;
	-ms-transition: all .2s linear;
	-o-transition: all .2s linear;
	transition: all .2s linear;
}

.CheckOutbtn:hover {
	color: #fff;
	background: #429188;
}

.type {
	background: #f0f0f0;
	font-size: 13px;
	padding: 10px 16px;
	left: 100%;
}

.type, .color {
	border: 1px solid #ccc;
	border-style: none none solid none;
	position: absolute;
}

.minused {
	margin: 0 50px 0 0 !important;
}

.added {
	margin: 0 -50px 0 0 !important;
}


.onePriceWon{
background: #f0f0f0;
    color: #000;
    float: right;
    font-size: 15px;
    font-weight: 300;
    line-height: 49px;
    margin: 0;
    padding: 0 30px;
}


div.minimalistBlack {
  border: 3px solid red;
  width: 100%;
  text-align: left;
  border-collapse: collapse;
}
.divTable.minimalistBlack .divTableCell, .divTable.minimalistBlack .divTableHead {
  border: 1px solid #000000;
  padding: 5px 4px;
}
.divTable.minimalistBlack .divTableBody .divTableCell {
  font-size: 13px;
}
.divTable.minimalistBlack .divTableHeading {
  background: #CFCFCF;
  background: -moz-linear-gradient(top, #dbdbdb 0%, #d3d3d3 66%, #CFCFCF 100%);
  background: -webkit-linear-gradient(top, #dbdbdb 0%, #d3d3d3 66%, #CFCFCF 100%);
  background: linear-gradient(to bottom, #dbdbdb 0%, #d3d3d3 66%, #CFCFCF 100%);
  border-bottom: 3px solid #000000;
}
.divTable.minimalistBlack .divTableHeading .divTableHead {
  font-size: 15px;
  font-weight: bold;
  color: #000000;
  text-align: center;
}

/* DivTable.com */
.divTable{ display: table; }
.divTableRow { display: table-row; }
.divTableHeading { display: table-header-group;}
.divTableCell, .divTableHead { display: table-cell;}
.divTableHeading { display: table-header-group;}
.divTableFoot { display: table-footer-group;}
.divTableBody { display: table-row-group;}


input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}




</style>


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
			<article class="product">
				<header>
						<img src="resources/t2_yj_files/${p.productThumbnail }">
						<input  type="hidden" name="thumbnail" value="${p.productThumbnail }">
						<input  type="hidden" name="name" value="${p.productName }">
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
      <form name="testForm">
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
      			<div class="divTableCell"><span name="shipAddress" id="shipAddress">${sessionScope.loginMember_business.vet_ID }님</span></div>
      		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">휴대전화</div>
      			<div class="divTableCell"><span name="shipCity" id="shipCity">${sessionScope.loginMember_business.vet_phoneNum }</span></div>
    		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">주소</div>
      			<div class="divTableCell"><span name="shipState" id="shipState">${sessionScope.loginMember_business.vet_address }</span></div>
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
		butt
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
      			<div class="divTableCell"><input type="text" name="billState" id="billState"/></div>
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
						<input  type="hidden" name="name" value="${p.productName }">
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
				<a class="CheckOutbtn" onclick="goPurchasePage()" >Check Out</a>
			</div>

		</div>
	</footer>


</body>
</html>