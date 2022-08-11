<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript">
/* 상품 디테일 페이지로 이동 */
	function gotoDetail(num) {
			location.href="get.aProductTeam1?num_PK="+num;
		}
/* 상품 카테고리별 출력 */
 		function selectACategory() {
			var categoryNum = document.getElementById('categoryNumSelect');
			var cv = categoryNum.options[categoryNum.selectedIndex].value;
			location.href="loadByCategory.go?categoryNum="+cv;
		};
		
</script>



</head>
<body>

	<div class="store_wrapper">
		<div>
			<h1>Store</h1>
		</div>



			<!-- 상품 카테고리별 출력 선택  -->
			<h2>카테고리별 출력</h2>
			<div style="color:fuchsia; display: inline-block;" >
			상품 카테고리(선택)
			<select id="categoryNumSelect" name="categoryNum" onchange="selectACategory()">
					<option hidden="hidden">전체보기</option>
					<option value="01">영양제</option>
					<option value="02">간식</option>
					<option value="03">사료</option>
			</select>
			</div>


		<!-- 상품 전체 출력 -->
		<c:forEach var="products" items="${products}">
			<div style="border: solid 1px black; width:150px;height:200px; display: inline-block;">
			<a style="font-size: 20pt;" onclick="gotoDetail(${products.num_PK})">
				<img alt="${products.name}"
					src="resources/team1ProductImgs/${products.thumbnail}">
					${products.name}
				(<fmt:setLocale value="ko_KR" /><fmt:formatNumber type="currency" value="${products.price}" />)
			</a>
			</div>
		</c:forEach>

	</div>


</body>
</html>