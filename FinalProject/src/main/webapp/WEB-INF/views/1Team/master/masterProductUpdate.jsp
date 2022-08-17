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
        $(function() {
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
        }
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#addBtn").click(function() {
			var master_category = $("#mater_category").val();
			var productName1 = $("#productName1").val();
			var productPrice1 = $("#productPrice1").val();
			var productOption1 = $("#productOption1").val();
			var productImg = $("productImg").val();
			
			if (productName1 == "") {
				alert("상품명을 입력해주세요")
				productName1.focus();
			} else if (productPrice1 == "") {
				alert("상품가격을 입력해주세요")
				productPrice1.focus();
			} else if (productOption1 == "") {
				alert("상품옵션을 입력해주세요")
				productOption1.focus();
			} else if (productImg =="") {
				alert("상품 이미지를 등록해주세요")
				productImg.focus();
			} else if (master_category == "") {
				alert("상품 카테고리를 선택해주세요")
				master_category.focus();
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
            <form id="master_update_form" enctype="multipart/form-data" method="post" action="">
			<div class="master_product_update_tbl">
				<div>
					<h3>상품카테고리</h3>
					<select name="master_category" id="master_category">
						<option value="">----Select----</option>
						<option value="dog">Dog</option>
						<option value="cat">Cat</option>
					</select>
				</div>
				
				<div>
					<h3>상품사진</h3>
					<input class="master_product_update_img_select" type="file"
						name="productImg" id="productImg"> <br> <img
						id="view" src="" alt="product Img">
				</div>
				<div>
					<span>상품명1</span> <input type="text" name="productName1"
						id="productName1">
				</div>
				<div>
					<span>상품명2</span> <input type="text" name="productName2"
						id="productName2">
				</div>
				<br>
				<div>
					<span>상품가격1</span> <input type="text" name="productPrice1"
						id="productPrice1">
				</div>
				<div>
					<span>상품가격2</span> <input type="text" name="productPrice2"
						id="productPrice2">
				</div>
				<br>
				<div>
					<span>상품옵션1</span> <input type="text" name="productOption1"
						id="productOption1">
				</div>
				<div>
					<span>상품옵션2</span> <input type="text" name="productOption2"
						id="productOption2">
				</div>
				<br> <input type="button" value="등록"
					class="master_product_update_btn">
			</div>
		</form>
    </div>
    
</body>
</html>