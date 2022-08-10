<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<script type="text/javascript" src="resources/js/jQuery.js"></script>
	<script type="text/javascript" src="resources/js/forProducts.js"></script>
	
<body>	
	
	<table border="1">
		<c:forEach var="products" items="${products}">
			<tr> 
				<td><img alt="product_img" src="resources/img/${products.thumbnail}"></td>
				<td>${products.name}</td>
				<td>${products.num_PK}
					<button value="${products.num_PK}">장바구니 넣기</button>
					<button value="${products.num_PK}">상품 삭제하기</button>
					<button value="${products.num_PK}">상품 수정하기</button>					
				</td>
				<td>${products.categoryNum }</td>
			</tr>	
		</c:forEach>	
	</table>
	
	<!-- ------------------------------------------ -->
	<form action="shopManager.upload" method="post" enctype="multipart/form-data">
		<h2>관리자 상품등록 </h2>
		<button>등록합시다</button> 등록결과: ${result}
		<table border="3">
			<tr><td>상품명 <input name="name" id="name"></td></tr>
			<tr><td>상품판매가격 <input name="price" id="price"></td></tr>
			<tr><td>상품설명 <input name="contents" id="contents"> </td></tr>
			<tr><td>상품태그 <input name="tag" id="tag">(!로 구분)</td></tr>
			<tr><td>상품 썸네일 <input type="file" name="thumbnail" id="thumbnail"></td></tr>
			<tr><td>상품 이미지1 <input type="file" name="img1" id="img1"></td></tr>
			<tr><td>상품 이미지2 <input type="file" name="img2" id="img2"></td></tr>
			<tr><td>상품 이미지3 <input type="file" name="img3" id="img3"></td></tr>
			<tr><td>상품코드(5자리 숫자) <input type="text" name="num_PK" id="num_PK"></td></tr>
			<tr><td>
			상품 카테고리(선택)
				<select name="categoryNum">
					<option value="01">영양제</option>
					<option value="02">간식</option>
					<option value="03">사료</option>
				</select>
			</td></tr>
			<tr><td>상품재고 <input name="stock" id="stock">개</td></tr>
			<tr><td>상품 진열여부(선택)
				<select name="onsale" id="onsale">
					<option value="open">공개</option>
					<option value="close">비공개</option>
				</select>
			</td></tr>
			
		</table>
	</form>
	<!-- ------------------------------------------ -->
	<h2>모든 상품 불러오기</h2>
	<button onclick="location.href='shopManager.loadAll'">Load All Products</button>
	<!-- ------------------------------------------ -->	
	<h2>카테고리별 출력</h2>
			<div style="color:fuchsia; display: inline-block;" >
			상품 카테고리(선택)
			<select id="categoryNumSelect" name="categoryNum" onchange="selectACategory()">
					<option value="01">영양제</option>
					<option value="02">간식</option>
					<option value="03">사료</option>
			</select>
			</div>
	<!-- ------------------------------------------ -->
	<h2>상품 이름 검색</h2>
		<form action="searchProducts.byWord">
		검색어(포함검색):<input name="searchWord" id="searchWord">
		<button>검색합니다</button>
		</form>
	

</body>
</html>