<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>
<script type="text/javascript" src="resources/t2_js/regProductPageJS.js"></script>
	<link href='resources/t2_css/productReg.css' rel="stylesheet" type="text/css">
</head>
<body>

<div style="margin: 50px;">
<h1 class="regTxt">登録ページ</h1>
<h1>${result }</h1>
<form name="form" action="Product.upload" method="post" enctype="multipart/form-data">
	<div class="regDiv">
		<table class="regTbl">
			<tr >
				<td  class="regTr">カテゴリー</td>
				<td><select name="pet_category" id="pet_category">
    				<option value="1">動物分類</option>
    				<option value="dog">Dog</option>
    				<option value="cat">Cat</option>
    				<option value="etc">etc</option>
					</select></td>
			</tr>
			<tr>
				<td class="regTr">カテゴリー</td>
				<td><select name="toy_category" id="toy_category">
    				<option value="1">商品分類</option>
    				<option value="snack">Snack</option>
    				<option value="toy">Toy</option>
					</select></td>
			</tr>
			<tr>
				<td class="regTr">商品名</td>
				<td><input id="productName" class="regInput" name="productName"></td>
			</tr>
			<tr>
				<td class="regTr">商品価格</td>
				<td><input type="number" placeholder="数字で入力してください。" class="regInput" id="productPrice" min="0"step="100" name="productPrice"></td>
			</tr>
			<tr>
				<td class="regTr">商品情報</td>
				<td><textarea id="productInfo" class="regInfo" name="productInfo"></textarea></td>
			</tr>
			<tr>
				<td class="regTr">在庫</td>
				<td><input type="number" id="productStock" placeholder="数字で入力してください。" class="regInput" min="0" name="productStock"></td>
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
</div>


	 <div class="container-fluid">
     <div class="row">
      <c:forEach var="p" items="${Product}">
           <div class="col-md-3">
          <div class="thumbnail">
                <img src="resources/t2_yj_files/${p.productThumbnail }" style="height: 300px;width:300px">
                <div class="caption">
                	<p>${fn:length(p.productName)>20?fn:substring(p.productName,0,20)+="...":p.productName }</p>
                	<p>価格 <fmt:formatNumber value="${p.productPrice }" pattern="#,###" />₩</p>
                	<p>在庫 <fmt:formatNumber value="${p.productStock }" pattern="#,###" />個</p>
                	<button class="updateBtn" onclick="location.href='update.product.go?productNum=${p.productNum}'">修正</button>
					<button class="deleteBtn" onclick="productDelete(${p.productNum},'${p.productThumbnail}','${p.productImg}')">削除</button>
                </div>
            </div>
           </div>
         </c:forEach>
     </div>
    </div>
</div>




</body>
</html>