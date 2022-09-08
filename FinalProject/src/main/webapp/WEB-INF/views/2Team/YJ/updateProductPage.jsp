<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/t2_js/regProductPageJS.js"></script>
<link href='resources/t2_css/productReg.css' rel="stylesheet" type="text/css">
</head>
<body>
	<div style="margin: 50px; ">
		<h1 class="regTxt">수정페이지</h1>
	</div>

	<div class="regDiv">
		<div>
			<div style="text-align: center;" class="regTxt">상품 이름 : ${Product.productName }</div>
			<div style="text-align: center;margin: 20px;"><img src="resources/t2_yj_files/${Product.productThumbnail }" style="height: 300px;width:300px;"></div> 
		</div>
	<form name="form" action="product.update" method="post"enctype="multipart/form-data">
		<table class="regTbl">
			<tr >
				<td  class="regTr">카테고리</td>
				<td><select name="pet_category" id="pet_category">
    				<option value="${Product.pet_category }">동물 분류</option>
    				<option value="dog">Dog</option>
    				<option value="cat">Cat</option>
    				<option value="etc">etc</option>
					</select></td>
			</tr>
			<tr>
				<td class="regTr">상품 분류</td>
				<td><select name="toy_category" id="toy_category">
    				<option value="${Product.toy_category }">상품 분류</option>
    				<option value="snack">Snack</option>
    				<option value="toy">toy</option>
					</select></td>
			</tr>
			<tr>
				<td class="regTr">제품 이름</td>
				<td><input id="productName" class="regInput" value="${Product.productName }" name="productName"></td>
			</tr>
			<tr>
				<td class="regTr">제품 가격</td>
				<td><input type="number" value="${Product.productPrice }" class="regInput" id="productPrice" min="0"step="100" name="productPrice"></td>
			</tr>
			<tr>
				<td class="regTr">제품 정보</td>
				<td><textarea id="productInfo" class="regInfo" name="productInfo">${Product.productInfo }</textarea></td>
				<td><input type="hidden" name="productNum" value="${Product.productNum }"> </td>
			</tr>
			<tr>
				<td class="regTr">재고</td>
				<td><input type="number" id="productStock" value="${Product.productStock }" class="regInput" min="0" name="productStock"></td>
			</tr>
			<tr>
				<td class="regTr">진열 여부</td>
				<td>공개  <input type = "radio"  id="onExhibition" name="onExhibition" checked="checked" value= "Y">
					비공개 <input type = "radio" id="onExhibition" name="onExhibition" value= "N"></td>
			</tr>
			<tr>
				<td class="regTr">대표 사진</td>
				<td><input type="file" name="productThumbnail" id="productThumbnail"></td>
			</tr>
			<tr>
				<td class="regTr">상세 이미지</td>
				<td><input type="file" multiple="multiple" id="productImg" name="productImg">
			</tr>
		</table>
		<table>
			<tr>
				<td>
					<table id="addTable">
						<tr>
							<td class="regTr">태그</td>
						</tr>
						<tr>
							<td class="regTr"><input id="productTag" class="regInput" name="productTag">
							<input class="DeleteBtn" type=button value='삭제' onClick='removeinput_value()' ></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>

	<table>
		<tr>
			<td>
				<input name="addButton" type="button" class="addTag" onClick="insRow()" value="태그 추가">
			</td>
		</tr>
	</table>
	<table>
		<tr>
			<td><input type="button" class="confirmBtn" name="button" value="등록"
				onClick="frmCheck();" >
			</td>
		</tr>
	</table>
</div>





</body>
</html>