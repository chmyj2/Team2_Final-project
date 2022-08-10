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
<style type="text/css">
/* .insert {
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
} */
</style>
</head>
<body>


<h1>등록페이지</h1>
<h1>${result }</h1>
<form name="form" action="Product.upload" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>카테고리</td>
				<td><select name="pet_category" id="pet_category">
    				<option value="">동물 분류</option>
    				<option value="dog">Dog</option>
    				<option value="cat">Cat</option>
    				<option value="etc">etc</option>
					</select></td>
			</tr>
			<tr>
				<td>상품 분류</td>
				<td><select name="toy_category" id="toy_category">
    				<option value="">상품 분류</option>
    				<option value="snack">Snack</option>
    				<option value="toy">toy</option>
					</select></td>
			</tr>
			<tr>
				<td>제품 이름</td>
				<td><input id="productName" name="productName"></td>
			</tr>
			<tr>
				<td>제품 가격</td>
				<td><input type="number" id="productPrice" min="0"step="100" name="productPrice"></td>
			</tr>
			<tr>
				<td>제품 정보</td>
				<td><textarea id="productInfo" name="productInfo"></textarea></td>
			</tr>
			<tr>
				<td>재고</td>
				<td><input type="number" id="productStock" min="0" name="productStock"></td>
			</tr>
			<tr>
				<td>진열 여부</td>
				<td>공개  <input type = "radio"  id="onExhibition" name="onExhibition" value= "Y">
					비공개 <input type = "radio" id="onExhibition" name="onExhibition" value= "N"></td>
			</tr>
			<tr>
				<td>대표 사진</td>
				<td><input type="file" name="productThumbnail" id="productThumbnail"></td>
			</tr>
			<tr>
				<td>상세 이미지</td>
				<td><input type="file" multiple="multiple" id="productImg" name="productImg">
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
							<td><input id="productTag" class="product_reg_input" name="productTag">
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
			<td><input class="reg_input" type="button" name="button" value="등록"
				onClick="frmCheck();" >
			</td>
		</tr>
	</table>



	 <div class="container-fluid">
     <div class="row">
      <c:forEach var="p" items="${Product}">
           <div class="col-md-3">
          <div class="thumbnail">
                <img src="resources/t2_yj_files/${p.productThumbnail }" style="height: 300px;width:300px">
                <div class="caption">
                	<p>${fn:length(p.productName)>20?fn:substring(p.productName,0,20)+="...":p.productName }</p>
                	<p>가격 <fmt:formatNumber value="${p.productPrice }" pattern="#,###" />원</p>
                	<p>재고 <fmt:formatNumber value="${p.productStock }" pattern="#,###" />개</p>
                	<button onclick="location.href='update.product.go?productNum=${p.productNum}'">수정</button>
					<button onclick="productDelete(${p.productNum},'${p.productThumbnail}','${p.productImg}')">삭제</button>
                </div>
            </div>
           </div>
         </c:forEach>
     </div>
    </div>

	



</body>
</html>