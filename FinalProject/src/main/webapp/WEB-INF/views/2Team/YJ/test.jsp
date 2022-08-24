<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript">

function goPurchasePage(productNum) {
	$('#purchaseForm').submit();
	
}

function goCartView(productNum){
	var cart_UserID = document.getElementById("cart_UserID").value;
	location.href = "CartView.go?productNum=" + productNum + "&cart_UserID=" + cart_UserID;
}

var prevStock = 0;

function quantityChange(quantity, price,stock){
	if( quantity.value>stock ){
		quantity.value = stock;
		alert("재고보다 많은 수량은 구매 불가능합니다");
		return false;
	}

	if(quantity.value<=0){
	quantity.value = 1;
	alert("1개 이상을 선택해주세요");
	return false;
	}	

	document.getElementById("totalPrice").innerHTML= quantity.value*price;
	}


function goOrderViewController(){
	location.href = "OrderViewController";
	}
	

</script>
<script type="text/javascript">

 $(function(){
	
	$('#cartAddBtn').click( function() {
		var quantity = document.getElementById("quantityInput").value;
		var cart_UserID = document.getElementById("cart_UserID").value;
		var cart_ProductNum = document.getElementById("cart_ProductNum").value;
		
		$.ajax({
			url : "add.product.in.cart",
			type : "GET",
			dataType : "text",
			data :	{"cart_UserID" : cart_UserID,
				  	"cart_ProductNum" : cart_ProductNum,
				  	"cart_ProductQuantity" : quantity},
			success : function(getData) {
				console.log(getData);
				if (getData == 1) {
					console.log("성공");
					$('#spanCart').text('장바구니에 추가댐')
				}else {
					
				}
				
			}
			
		});
		
		
	});        
	
	
	
	
	
	
	      });


	
	
	
	
	

</script>
  <style type="text/css">
 
.owl-nav button {
  position: absolute;
  top: 50%;
  transform: translate(0, -50%);
  outline: none;
  height: 25px;
}
.owl-nav button svg {
  width: 25px;
  height: 25px;
}
.owl-nav button.owl-prev {
  left: 25px;
}
.owl-nav button.owl-next {
  right: 25px;
}
.owl-nav button span {
  font-size: 45px;
}
.product-name {
  font-size: 30px;
  font-weight: 500;
  line-height: 22px;
  margin-bottom: 10%;
}
.product-price-discount {
  font-size: 30px;
    font-weight: 400;
    margin-top: 7%;
}

.product-info {
  width: 100%;
}
.rate {
    float: left;
    padding: 0 10px 0 0;
}
.rate:not(:checked) > input {
    position:absolute;
    top:-9999px;
}
.rate:not(:checked) > label {
    float: right;
    width: 15px;
    overflow: hidden;
    white-space: nowrap;
    cursor: pointer;
    font-size: 21px;
    color:#ccc;
  margin-bottom: 0;
  line-height: 21px;
}
.rate:not(:checked) > label:before {
    content: '\2605';
}
.rate > input:checked ~ label {
    color: #ffc700;    
}
.rate:not(:checked) > label:hover,
.rate:not(:checked) > label:hover ~ label {
    color: #deb217;  
}
.rate > input:checked + label:hover,
.rate > input:checked + label:hover ~ label,
.rate > input:checked ~ label:hover,
.rate > input:checked ~ label:hover ~ label,
.rate > label:hover ~ input:checked ~ label {
    color: #c59b08;
}
.product-dtl p {
  font-size: 14px;
  line-height: 24px;
  color: #7a7a7a;
}
.product-dtl .form-control {
  font-size: 15px;
}
.product-dtl label {
  line-height: 16px;
  font-size: 15px;
}
.form-control:focus {
  outline: none;
  box-shadow: none;
}
.product-count {
  margin-top: 15px; 
}
.product-count .qtyminus,
.product-count .qtyplus {
  width: 34px;
    height: 34px;
    background: #212529;
    text-align: center;
    font-size: 19px;
    line-height: 36px;
    color: #fff;
    cursor: pointer;
}
.product-count .qtyminus {
  border-radius: 3px 0 0 3px; 
}
.product-count .qtyplus {
  border-radius: 0 3px 3px 0; 
}
.product-count .qty {
  width: 60px;
  text-align: center;
}
.round-black-btn {
  border-radius: 4px;
    background: #212529;
    color: #fff;
    padding: 7px 45px;
    display: inline-block;
    margin-top: 20px;
    border: solid 2px #212529; 
    transition: all 0.5s ease-in-out 0s;
}
.round-black-btn:hover,
.round-black-btn:focus {
  background: transparent;
  color: #212529;
  text-decoration: none;
}

.product-info-tabs {
  margin-top: 25px; 
}
.product-info-tabs .nav-tabs {
  border-bottom: 2px solid #d8d8d8;
}
.product-info-tabs .nav-tabs .nav-item {
  margin-bottom: 0;
}
.product-info-tabs .nav-tabs .nav-link {
  border: none; 
  border-bottom: 2px solid transparent;
  color: #323232;
}
.product-info-tabs .nav-tabs .nav-item .nav-link:hover {
  border: none; 
}
.product-info-tabs .nav-tabs .nav-item.show .nav-link, 
.product-info-tabs .nav-tabs .nav-link.active, 
.product-info-tabs .nav-tabs .nav-link.active:hover {
  border: none; 
  border-bottom: 2px solid #d8d8d8;
  font-weight: bold;
}
.product-info-tabs .tab-content .tab-pane {
  padding: 30px 20px;
  font-size: 15px;
  line-height: 24px;
  color: #7a7a7a;
}
.review-form .form-group {
  clear: both;
}
.mb-20 {
  margin-bottom: 20px;
}

.review-form .rate {
  float: none;
  display: inline-block;
}
.review-heading {
  font-size: 24px;
    font-weight: 600;
    line-height: 24px;
    margin-bottom: 6px;
    text-transform: uppercase;
    color: #000;
}
.review-form .form-control {
  font-size: 14px;
}
.review-form input.form-control {
  height: 40px;
}
.review-form textarea.form-control {
  resize: none;
}
.review-form .round-black-btn {
  text-transform: uppercase;
  cursor: pointer;
}
.productTag{
	width: 8%;
	height: 25px;
	background-color: #9BC3FF;
	color: white;
	border-radius: 10%;
	text-align: center;
	border: 0px;
	font-size: 90%;

}

#purchaseBtnDiv{
	margin-top: 10%;

}

.productInfo{
	 margin-bottom: 10%;
	 margin-top: 7%;

}

  </style>
</head>
<body>


    <div class="container">
          <div class="heading-section">
          <form action="test" id="purchaseForm">
              <h2>Product Details</h2>
              <input type="hidden" value="${Product.productNum }"id="cart_ProductNum" name="cart_ProductNum">
              <input  type="hidden" name="thumbnail" value="${Product.productThumbnail }">
						<input  type="hidden" name="name" value="${Product.productName }">
						<input  type="hidden" name="price" value="${Product.productPrice }">
					<c:choose>
					<c:when test="${sessionScope.loginMember.member_ID !=null }">
					<input type="hidden" value="${sessionScope.loginMember.member_ID }" id="cart_UserID" name="cart_UserID">
					</c:when>
					<c:when test="${sessionScope.loginMember_business.vet_ID !=null }">
					<input type="hidden" value="${sessionScope.loginMember_business.vet_ID }" id="cart_UserID" name="cart_UserID">
					</c:when>
					<c:otherwise>
					<input type="hidden" value="비회원" id="cart_UserID" name="cart_UserID">
					</c:otherwise>
					</c:choose>
          </div>
          <div class="row">
            <div class="col-md-6">
              <img src="resources/t2_yj_files/${Product.productThumbnail }"
					style="width: 500px; height: 500px">
            </div>
            <div class="col-md-6">
              <div class="product-dtl">
                <div class="product-info">
                  <div class="product-name">${Product.productName }</div>
                  <div class="reviews-counter">
                <div class="rate">
                    <input type="radio" id="star5" name="rate" value="5"/>
                    <label for="star5" title="text">5 stars</label>
                    <input type="radio" id="star4" name="rate" value="4"/>
                    <label for="star4" title="text">4 stars</label>
                    <input type="radio" id="star3" name="rate" value="3"/>
                    <label for="star3" title="text">3 stars</label>
                    <input type="radio" id="star2" name="rate" value="2"/>
                    <label for="star2" title="text">2 stars</label>
                    <input type="radio" id="star1" name="rate" value="1"/>
                    <label for="star1" title="text">1 star</label>
                  </div>
              </div>
              <c:forTokens var="item" items="${Product.productTag }" delims="!">
					<input class="productTag" value="${item }" disabled="disabled">
				</c:forTokens>
                  <div class="product-price-discount"><span>${Product.productPrice }원</span></div>
                </div>
                <div class="productInfo">
                <p>${Product.productInfo }</p>
                </div>
                <div class = "productStockDiv">
					${Product.productName}
					<input id="quantityInput" type = "number" onchange="quantityChange(this,${Product.productPrice },${Product.productStock})"
					name = "quantity" style ="width:50px" value = 1>개
					<span id = "totalPrice">${Product.productPrice }</span> 원 재고 ${Product.productStock}개<br>
				</div>
				</form>
				
				
				<div id="purchaseBtnDiv">
					<c:choose>
				<c:when test="${Product.productStock > 0}">
		
					<button onclick="goPurchasePage('${Product.productNum}')">구매하기</button>
					<button id="cartAddBtn" class = "shopDetailButton">장바구니에 추가</button>
					<button class = "shopDetailButton" onclick = "goCartView(${Product.productNum })">장바구니 바로가기 </button>
					<span id="spanCart"></span>
		
				</c:when>
				<c:otherwise>
					<button  class = "shopDetailButton">품절</button>
				</c:otherwise>
			</c:choose>
				</div>
                </div>
              </div>
            </div>
          </div>
          <div>
          <div class="product-info-tabs">
				<c:forTokens var="item" items="${Product.productImg }"
						delims="!">
						<img src="resources/t2_yj_files/${item }" style="width: 600px">
						<br>
					</c:forTokens>
		</div>
            
        </div>
      </div>
      
      <div style="text-align:center;font-size:14px;padding-bottom:20px;">Get free icon packs for your next project at <a href="http://iiicons.in/" target="_blank" style="color:#ff5e63;font-weight:bold;">www.iiicons.in</a></div>
    </div>
  </div>

</body>
</html>