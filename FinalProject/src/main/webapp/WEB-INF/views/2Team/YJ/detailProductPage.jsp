<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">



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
				
				<div style="display: flex;">
					<div class="product-price">${Product.productPrice }원</div>
					<div><input type='button' onclick='count("plus")' value='+'/></div>
					<div></div><input type='button' onclick='count("minus")' value='-'/></div>
					<div id='result'>0</div>
  				</div>
				</div>

			</div>
		</div>

	<button onclick="location.href='purchasePage.go?productNum=${Product.productNum }&member_ID=sessionID'">구매하기</button>




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