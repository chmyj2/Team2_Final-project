<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mater 상품등록 페이지</title>
<script src="http://madalla.kr/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
        //----썸네일 미리보기---- 
       /*  $(function() {
            $("#productImg").on('change', function(){
            readURL(this);
            });
        });
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                $('#view').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        } */
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#addBtn").click(function() {
			var product_category = $("#product_category").val();
			var product_title = $("#product_title").val();
			var product_price = $("#product_price").val();
			var product_stock = $("#product_stock").val();
			var product_thumnail = $("product_thumnail").val();
			
			if (product_title == "") {
				alert("상품명을 입력해주세요")
				product_title.focus();
			} else if (product_price == "") {
				alert("상품가격을 입력해주세요")
				product_price.focus();
			} else if (product_stock == "") {
				alert("상품 수량을 입력해주세요")
				product_stock.focus();
			} else if (product_stock =="") {
				alert("상품 이미지를 등록해주세요")
				product_stock.focus();
			} else if (product_category == "") {
				alert("상품 카테고리를 선택해주세요")
				product_category.focus();
			}
			// 상품 정보 전송
			// 상품 등록 버튼 클릭 이벤트 발생시 폼 안의 유효성 검사 후 서버로 전송
			document.master_update_form.action = "${path}/enter.team1StoreForDog"
			document.master_update_form.submit();
		});
	});
</script>
</head>
<body>
    <div class="master_product_update_wrap">
            <h2>STORE 상품 등록</h2>
            <form action="master.create" id="master_update_form" enctype="multipart/form-data" method="POST">
			<div class="master_product_update_tbl">
				<div>
					<h3>카테고리</h3>
					<select name="product_category" id="master_category">
						<option>----Select----</option>
						<option value="dog">Dog</option>
						<option value="cat">Cat</option>
					</select>
				</div>
				<div>
					<h3>상품분류</h3>
					<select name="product_sub_category" id="master_category">
						<option>----Select----</option>
						<option value="food">food</option>
						<option value="product">product</option>
					</select>
				</div>
				
				
				<div>
					<h3>상품사진</h3>
					<input class="master_product_update_img_select" type="file"
						name="product_thumnail" id="productImg"> <br> <img
						id="view" src="" alt="product Img">
				</div>
				<div>
					<h3>상품디테일사진</h3>
					<input class="master_product_update_img_select" type="file"
						name="product_detail" id="productImg" multiple="multiple">
				</div>
				<div>
					<span>상품명1</span> <input type="text" name="product_title"
						id="product_title">
				</div>
				<div>
					<span>상품명2</span> <input type="text" name="product_title2"
						id="product_title2">
				</div>
				<br>
				<div>
					<span>상품가격1</span> <input type="text" name="product_price"
						id="product_price">
				</div>
				<div>
					<span>상품수량</span> <input type="text" name="product_stock"
						id="product_stock">
				</div>
				<br>
				<div>
					<span>상품설명<textarea id="product_info" name="product_info" rows="4" cols="50"></textarea></span>
				</div>
				<div>
					<span>제조사</span> <input type="text" name="product_manufactor"
						id="product_manufactor" placeholder="상품가격 2 옵션(kg)">
				</div>
				<br> 
				<button	class="master_product_update_btn">등록</button>
			</div>
		</form>
    </div>
    
</body>
</html>