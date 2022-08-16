<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://madalla.kr/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
       /* --썸네일 미리보기---- */
        $(function() {
            $("#myPet_info_photo").on('change', function(){
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
	$(function() {
    	$('input[type=file]').on('change',function(){
    		if(window.FileReader){
        		var filename = $(this)[0].files[0].name;
    		} else {
        		var filename = $(this).val().split('/').pop().split('\\').pop();
    		}
    	$(this).siblings('label').text(filename);
});
});

</script>
</head>
<body>
    <div class="myPet_info_wrap">
    
        <div class="myPet_info_update">
            <h2>My Pet</h2>
            
            <!-- 펫 사진 -->
            <div class="myPet_info_photo_wrap">
                <p>PHOTO</p>
                <input class="myPet_info_photo_name" value="파일선택" disabled="disabled">
                <label for="myPet_info_photo">UPLOAD</label>
                <input class="myPet_info_photo" name="" id="myPet_info_photo" type="file">
                <br>
                <img id="view" src="resources/img/pet_sample.jpg" alt="Pet Img">
            </div>
            
            <!-- 펫 이름 -->
            <div>
                <label for="myPet_info_name">NAME</label>
                <br>
                <input class="myPet_info_name" placeholder="Pet Name">
            </div>
            
            <!-- 펫 생년월일 -->
            <div class="myPet_info_birth_wrap">
                <label for="mtPet_info_birth">BIRTHDAY</label>
                <br>
                <input class="myPet_info_birth" type="date">
            </div>
            
            <!-- 펫 성별 -->
            <div>
                <label for="myPet_info_sex">SEX</label>
                <br>
              	  남<input class="myPet_info_sex" type="radio" name="pet_sex">
                	여<input class="myPet_info_sex" type="radio" name="pet_sex">
            </div>
            <div>
                <button class="myPet_info_update_btn"
                onclick="">UPDATE</button>
            </div>
        </div>
    </div>
    
</body>
</html>