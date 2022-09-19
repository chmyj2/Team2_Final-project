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
		<h1 class="regTxt">修正ページ</h1>
	</div>

	<div class="regDiv">
		<div>
			<div style="text-align: center;" class="regTxt">商品名 : ${Product.productName }</div>
			<div style="text-align: center;margin: 20px;"><img src="resources/t2_yj_files/${Product.productThumbnail }" style="height: 300px;width:300px;"></div> 
		</div>
	<form name="form" action="product.update" method="post"enctype="multipart/form-data">
		<table class="regTbl">
			<tr >
				<td  class="regTr">カテゴリー</td>
				<td><select name="pet_category" id="pet_category">
    				<option value="${Product.pet_category }">動物分類</option>
    				<option value="dog">Dog</option>
    				<option value="cat">Cat</option>
    				<option value="etc">ETC</option>
					</select></td>
			</tr>
			<tr>
				<td class="regTr">カテゴリー</td>
				<td><select name="toy_category" id="toy_category">
    				<option value="${Product.toy_category }">商品分類</option>
    				<option value="snack">Snack</option>
    				<option value="toy">Toy</option>
					</select></td>
			</tr>
			<tr>
				<td class="regTr">商品名</td>
				<td><input id="productName" class="regInput" value="${Product.productName }" name="productName"></td>
			</tr>
			<tr>
				<td class="regTr">商品価格</td>
				<td><input type="number" value="${Product.productPrice }" class="regInput" id="productPrice" min="0"step="100" name="productPrice"></td>
			</tr>
			<tr>
				<td class="regTr">商品情報</td>
				<td><textarea id="productInfo" class="regInfo" name="productInfo">${Product.productInfo }</textarea></td>
				<td><input type="hidden" name="productNum" value="${Product.productNum }"> </td>
			</tr>
			<tr>
				<td class="regTr">在庫</td>
				<td><input type="number" id="productStock" value="${Product.productStock }" class="regInput" min="0" name="productStock"></td>
			</tr>
			<tr>
				<td class="regTr">陳列</td>
				<td>陳列  <input type = "radio"  id="onExhibition" name="onExhibition" checked="checked" value= "Y">
					非陳列 <input type = "radio" id="onExhibition" name="onExhibition" value= "N"></td>
			</tr>
			<tr>
				<td class="regTr">代表イメージ</td>
				<td><input type="file" name="productThumbnail" id="productThumbnail"></td>
			</tr>
			<tr>
				<td class="regTr">ディテールイメージ</td>
				<td><input type="file" multiple="multiple" id="productImg" name="productImg">
			</tr>
		</table>
		<table>
			<tr>
				<td>
					<table id="addTable">
						<tr>
							<td class="regTr">タグ</td>
						</tr>
						<tr>
							<td class="regTr"><input id="productTag" class="regInput" name="productTag">
							<input class="DeleteBtn" type=button value='削除' onClick='removeinput_value()' ></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>

	<table>
		<tr>
			<td>
				<input name="addButton" type="button" class="addTag" onClick="insRow()" value="タグを追加">
			</td>
		</tr>
	</table>
	<table>
		<tr>
			<td><input type="button" class="confirmBtn" name="button" value="登録"
				onClick="frmCheck();" >
			</td>
		</tr>
	</table>
</div>





</body>
</html>