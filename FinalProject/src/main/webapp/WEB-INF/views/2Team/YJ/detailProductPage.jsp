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
<link href='resources/t2_css/shopDetailPage.css' rel="stylesheet" type="text/css">
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
					console.log("成功");
					alert("カートに追加しました。")
				}else {
					alert("ログイン後にご利用ください。")
				}
			}
		});
	});
　　});


function soldOut() {
	alert("売り切れの商品です。");
}


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
              </div>
              <c:forTokens var="item" items="${Product.productTag }" delims="!">
					<input class="productTag" value="${item }" disabled="disabled">
				</c:forTokens>
                  <div class="product-price-discount"><span>${Product.productPrice }₩</span></div>
                </div>
                <div class="productInfo">
                <p>${Product.productInfo }</p>
                </div>
                <div class = "productStockDiv">
					${Product.productName}
					<input id="quantityInput" type = "number" onchange="quantityChange(this,${Product.productPrice },${Product.productStock})"
					name = "quantity" style ="width:50px" value = 1>個
					<span id = "totalPrice">${Product.productPrice }</span>&nbsp;&nbsp;&nbsp;在庫 ${Product.productStock}個<br>
				</div>
				</form>
				
				
				<div id="purchaseBtnDiv">
					<c:choose>
				<c:when test="${Product.productStock > 0}">
					<a onclick="goPurchasePage('${Product.productNum}')" class="button">購入する</a>
					<a id="cartAddBtn" class="button reverse dark">カートに追加</a>
					<a onclick = "goCartView(${Product.productNum})" class="button fast white">カートを見る</a>
		
				</c:when>
				<c:otherwise>
					<button onclick="soldOut()" class="soldOutBtn">売り切れ</button>
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
    </div>
  </div>

</body>
</html>