<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!--add cart-->
	<script type="text/javascript">
	$(function() {
		/* click button addcart */
		// 서버로 전송할 데이터
		const form = {
			m_id : '${sessionScope.loginMember.m_id }',
			Num_PK :'${products.num_PK}',
			Cart_ProductQuantity : ''
		} 
	 
	 // click Add Cart	
	 	$("#cart_btn").on("click", function(e){
	
		}	 
/* --READY------------ */	
});
		
		
		
		
	});
	</script>
	<!-- --------------------------------------------- -->
</head>
<body>

	<div class="store_wrapper">
		<div>
			<h1>Store</h1>
		</div>
		<!-- ---------------------------------------------- -->
		<div>
		<c:forEach var="products" items="${products}">
			<div style="border: solid 1px black; display:inline-block;">
				<div><img alt="product_img" src="resources/team1ProductImgs/${products.thumbnail}"></div>
				<div>
					${products.name} <br>
					(<fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${products.price}"/>)
				</div>
				<div><button id="cart_btn" value="${products.num_PK}" onclick="">ADD CART</button></div>
			</div>
		</c:forEach>
		</div>
		<!-- ---------------------------------------------- -->
		









		<div>
			<img alt="" src="">
			<img alt="" src="">
			<img alt="" src="">
			<img alt="" src="">
			<img alt="" src=""> 
		</div>
	</div>
	
	
	
	
	
	
	
</body>
</html>