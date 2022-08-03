<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>
<script type="text/javascript" src="resources/t2_js/regProductPageJS.js"></script>
<style type="text/css">
.insert {
    padding: 20px 30px;
    display: block;
    width: 400px;
    margin: 5vh auto;
    height: 280px;
    border: 1px solid #dbdbdb;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.insert .file-list {
    height: 200px;
    overflow: auto;
    border: 1px solid #989898;
    padding: 10px;
}
.insert .file-list .filebox p {
    font-size: 14px;
    margin-top: 10px;
    display: inline-block;
}
.insert .file-list .filebox .delete i{
    color: #ff5353;
    margin-left: 5px;
}
</style>
</head>
<body>
<div class="">
		<form action="Search_drinkController" id="searchProduct" onsubmit="return CheckSubmit()" method="post">  
			<div>
				<input  class="" id="" name="" placeholder="SEARCH">
				<input id="" type="submit" value="검색">
			</div>
		</form>
	</div>

<h1>등록페이지</h1>

<form name="form" action="productInforeg" method="post"enctype="multipart/form-data">
		<table>
			<tr>
				<td>카테고리</td>
				<td><select name="pets" id="pet_category">
    				<option value="">동물 분류</option>
    				<option value="dog">Dog</option>
    				<option value="cat">Cat</option>
    				<option value="etc">etc</option>
					</select></td>
			</tr>
			<tr>
				<td>상품 분류</td>
				<td><select name="pets" id="product_category">
    				<option value="">상품 분류</option>
    				<option value="snack">Snack</option>
    				<option value="toy">toy</option>
					</select></td>
			</tr>
			<tr>
				<td>제품 이름</td>
				<td><input  id="productName" class="" name="productName"></td>
			</tr>
			<tr>
				<td>제품 가격</td>
				<td><input type="number" id="productPrice" min="0"step="100" class="" name="productPrice"></td>
			</tr>
			<tr>
				<td>제품 정보</td>
				<td><textarea id="productInfo"name="productInfo"></textarea></td>
			</tr>
			<tr>
				<td>재고</td>
				<td><input type="number" id="productStock" min="0" class="" name="productStock"></td>
			</tr>
			<tr>
				<td>진열 여부</td>
				<td>공개  <input type = "radio"  id="onExhibition"name = "onExhibition" value= "Y">
					비공개 <input type = "radio" id="onExhibition" name = "onExhibition" value= "N"></td>
			</tr>
			<tr>
				<td>대표 사진</td>
				<td><input type="file" name="productThumbnail" id="productThumbnail"></td>
			</tr>
			<tr>
				<td>상세 이미지</td>
				<td><div class="insert"><input type="file" onchange="addFile(this);" multiple />
   				<div class="file-list"></div></div></td>
			</tr>
		</table>
		<!-- <table>
			<tr>
				<td> -->
					<table id="addTable">
						<tr style="color: ">
							<td>태그</td>
						</tr>
						<tr>
							<td><input id="productTag" class="product_reg_input" name="productTag">
								<input class="erase" type=button value='삭제' onClick='removeinput_value()' style='cursor:hand'>
							</td>
						</tr>
					</table>
				<!-- </td>
			</tr>
		</table> -->
	</form>

	<table>
		<tr>
			<td>
				<input class="ingredient_txt_reg_btn" name="addButton" type="button" style="cursor: hand" onClick="insRow()" value="재료 추가">
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<td><input class="reg_input" type="button" name="button" value="등록"
				onClick="frmCheck();" >
			</td>
		</tr>
	</table>




</body>
</html>