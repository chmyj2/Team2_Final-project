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
</head>
<body>
    <div class="container">
          <div class="heading-section">
          <form action="purchasePage.go" id="purchaseForm">
              <h2>Product Details</h2>
              <input type="hidden" value="${Product.productNum }"id="cart_ProductNum" name="productNum">
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