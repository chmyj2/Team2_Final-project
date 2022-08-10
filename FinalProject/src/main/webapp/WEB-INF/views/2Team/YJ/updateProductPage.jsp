<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/t2_js/regProductPageJS.js"></script>
</head>
<body>


<h1>수정페이지</h1>

<div>
	<div>
		<img src="resources/t2_yj_files/${Product.productThumbnail }" style="height: 500px;width:500px">
	</div>
</div>
	<form name="form" action="product.update" method="post"enctype="multipart/form-data">
		<table>
			<tr>
				<td>카테고리</td>
				<td><select name="pet_category" id="pet_category">
    				<option value="${Product.pet_category}">동물 분류</option>
    				<option value="dog">Dog</option>
    				<option value="cat">Cat</option>
    				<option value="etc">etc</option>
					</select></td>
			</tr>
			<tr>
				<td>상품 분류</td>
				<td><select name="toy_category" id="toy_category">
    				<option value="${Product.toy_category}">상품 분류</option>
    				<option value="snack">Snack</option>
    				<option value="toy">toy</option>
					</select></td>
			</tr>
			<tr>
				<td>제품 이름</td>
				<td><input  id="productName" value="${Product.productName}" name="productName"></td>
			</tr>
			<tr>
				<td>제품 가격</td>
				<td><input type="number" id="productPrice" value="${Product.productPrice}" min="0"step="100"  name="productPrice"></td>
			</tr>
			<tr>
				<td>제품 정보</td>
				<td><textarea id="productInfo"name="productInfo">${Product.productInfo} </textarea></td>
			</tr>
			<tr>
				<td>재고</td>
				<td><input type="number" value="${Product.productStock }" id="productStock" min="0" name="productStock">
				<input type="hidden" value="${Product.productNum }"name="productNum" ></td>
			</tr>
			<tr>
				<td>진열 여부</td>
				<td>공개  <input type = "radio" checked="checked" id="onExhibition"name = "onExhibition" value= "Y">
					비공개 <input type = "radio" id="onExhibition" name = "onExhibition" value= "N"></td>
			</tr>
			<tr>
				<td>대표 사진</td>
				<td><input type="file" name="productThumbnailNew" id="productThumbnail"></td>
			</tr>
			<tr>
				<td>상세 이미지</td>
				<td><input type="file" multiple="multiple" id="productImgNew" name="productImgNew">
			</tr>
		</table>
		<table>
			<tr>
				<td>
					<table id="addTable">
						<tr>
							<td>태그</td>
						</tr>
						<tr>
							<td><input id="productTag" placeholder="태그를 입력해주세요" class="product_reg_input" name="productTag">
								<input class="erase" type=button value='삭제' onClick='removeinput_value()' style='cursor:hand'>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>

	<table>
		<tr>
			<td>
				<input class="tag_reg_btn" name="addButton" type="button" style="cursor: hand" onClick="insRow()" value="태그 추가">
			</td>
		</tr>
	</table>
	<table>
		<tr>
			<td><input class="reg_input" type="button" name="button" value="수정"
				onClick="frmCheck();" >
			</td>
		</tr>
	</table>


<h1>${Product.productTag }</h1>



</body>
</html>