<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<table border="1">
	<tr>
		<td rowspan="11"><img src="resources/t2_yj_files/${Product.productThumbnail }" style="height: 500px;width:500px"></td>
	</tr>
	<tr>
		<td class="">상품이름</td>
	</tr>
	<tr>
		<td class=""><h1>${Product.productName }</h1></td>
	</tr>
	<%-- <tr>
		<td class=">${star } <fmt:formatNumber value="${starpoint.score }" pattern="0.00" /> </td>
	</tr> --%>
	<tr>
		<td class="">
			<c:forTokens var="item" items="${Product.productInfo }" delims="\n">
				${item }<br>
			</c:forTokens></td>
	</tr>
	<tr>
		<td class="drink_detail_page_title">가격</td>
	</tr>
	<tr>
		<td class=""><h1>${Product.productPrice }원</h1></td>
	</tr>
	<tr>
		<td class=""><h1>재고</h1></td>
	</tr>
	<tr>
		<td class=""><h1>${Product.productStock }개</h1></td>
	</tr>
	<tr>
		<td class="drink_detail_page_title">태그</td>
	</tr>
	<tr>
		<td class="drink_detail_page_txt">
			<c:forTokens var="item" items="${Product.productTag }" delims="!">
				${item}<br>
			</c:forTokens>
		</td>
	</tr>
</table>

		



<table>
	<tr>
		<td><c:forTokens var="item" items="${Product.productImg }" delims="!">
				<img src="resources/t2_yj_files/${item }" style="width:600px"><br>
			</c:forTokens>
		</td>
	</tr>
</table>
	



</body>
</html>