<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function goPurchasePage(productNum) {
	var quanId = document.getElementById("quantityInput");
	location.href="purchasePage.go?productNum=" + productNum + "&quanId=" + quanId.value;
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
					$('#span').text('장바구니에 추가댐')
				}else {
					
				}
				
			}
			
		});
		
		
	});        
	
	
	
	
	
	
	      });


	
	
	
	
	

</script>
</head>
<body>
	<div style="margin: 50px">
		<div style="margin-bottom: 30px; border: 3px solid #000000;">
			<div>${Product.productName }</div>
		</div>

		<div style="display: flex">
			<div>
				<img src="resources/t2_yj_files/${Product.productThumbnail }"
					style="width: 500px; height: 500px">
			</div>
			<div style="background-color: yellow; width: 500px">
				<div>
					Product Info<span>제품정보</span>
				</div>
				<div style="display: flex; background-color: skyblue">
					<div>제품이름</div>
					<div>${Product.productName }</div>
				</div>
				<div style="display: flex; background-color: pink">
					<div>별점</div>
					<div>*****</div>
				</div>
				<div style="background-color: skyblue">
					<div>
						<c:forTokens var="item" items="${Product.productTag }" delims="!">
					${item}
				</c:forTokens>
					</div>
				</div>
				<div>
					Price Info<span>가격정보</span>
					<input type="hidden" value="${Product.productNum }"id="cart_ProductNum" name="cart_ProductNum">
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
				<div style="display: flex; background-color: pink">
					<div>가격</div>
					<div>${Product.productPrice }</div>
				</div>
				<div>
					Delivery Info<span>배송정보</span>
				</div>
				<div style="background-color: pink">
					<div style="display: flex;">
						<div>출고 정보</div>
						<div>9월 23일</div>
					</div>
					<div style="display: flex;">
						<div>배송 방법</div>
						<div>국내 배송 / MZ대한통운</div>
					</div>
				</div>

				<div style="background-color: skyblue">
					<div style="display: flex;">
						<div>수량</div>
						<div>9월 23일</div>
					</div>
					<div style="display: flex;">
						<div>배송 방법</div>
						<div>국내 배송 / MZ대한통운</div>
					</div>
				</div>
				
				<div class = "productStockDiv">
					${Product.productName}
					<input id="quantityInput" type = "number" onchange="quantityChange(this,${Product.productPrice },${Product.productStock})"
					name = "cart_ProductQuantity" style ="width:50px" value = 1>개
					<span id = "totalPrice">${Product.productPrice }</span> 원 재고 ${Product.productStock}개<br>
				</div>
				
			<c:choose>
				<c:when test="${Product.productStock > 0}">
		
					<button onclick="goPurchasePage('${Product.productNum}')">구매하기</button>
					<button id="cartAddBtn" class = "shopDetailButton">장바구니에 추가</button>
					<span id="span"></span>
					<button class = "shopDetailButton" onclick = "goCartView(${Product.productNum })">장바구니 바로가기 </button>
		
				</c:when>
				<c:otherwise>
					<button  class = "shopDetailButton">품절</button>
				</c:otherwise>
			</c:choose>
				
				
				
  				</div>
				</div>

			</div>
		</div>

				
		
	
		
		
		



		<table>
			<tr>
				<td><c:forTokens var="item" items="${Product.productImg }"
						delims="!">
						<img src="resources/t2_yj_files/${item }" style="width: 600px">
						<br>
					</c:forTokens></td>
			</tr>
		</table>
</body>
</html>