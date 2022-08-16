<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="t2-join-outdiv">
<form action="#" method="POST" class="joinForm" name="joinForm"> <!-- onsubmit="return joinCheck()"  -->
                                                                                               
      <h2>펫 등록하기</h2>
      <div class="join-textForm brith">   
        	펫 이미지
        
        <input name="baby_img" type="file" class="join-name" id="baby_img"> 
        <img id="image" style="width: 80px;height: 80px;">
      </div>
      
      <div class="join-textForm">   
        <input name="baby_name" type="text" class="join-id" placeholder="펫이름">      
        <span id="idcheckResult"></span>
      </div>
      
      
      <div class="join-textForm brith">
        <input name="baby_weight" type="number" class="join-name" placeholder="몸무게" style="width: 80px;">kg
      </div>
      
      <div class="join-textForm brith">
      	생일&nbsp;&nbsp;<input name="baby_birth" type="date" class="join-birth" >
      </div> 
      
      <div class="join-textForm brith">
      	성별 &nbsp;&nbsp;
        <input name="baby_sex" type="radio" class="join-sex" value="m" checked="checked">남아
        &nbsp;&nbsp;<input name="baby_sex" type="radio" class="join-sex" value="w">여아
      </div>
      
      <div class="join-textForm brith">
      	종류 &nbsp;&nbsp;
        <input name="baby_type" type="radio" class="join-sex" value="dog" checked="checked">강아지
        &nbsp;&nbsp;<input name="baby_type" type="radio" class="join-sex" value="cat">고양이
        &nbsp;&nbsp;<input name="baby_type" type="radio" class="join-sex" value="etc">그 외
      </div>
      
      <div class="join-textForm brith">
      	품종 &nbsp;&nbsp;
        <input name="member_phoneNum" class="join-cellphoneNo" placeholder="품종" style="width: 250px;">
      </div>
      
       <div class="join-textForm brith">
      	중성화 &nbsp;&nbsp;
        <input name="baby_sex" type="radio" class="join-sex" value="yse" checked="checked">함
        &nbsp;&nbsp;<input name="baby_sex" type="radio" class="join-sex" value="no">안함
      </div>
      
      
      <input type="submit" class="join-btn" value="J O I N"/>
    </form>
    </div>
</body>
<script type="text/javascript">
document.getElementById("baby_img").onchange = function () {
    var reader = new FileReader();

    reader.onload = function (e) {
        // get loaded data and render thumbnail.
        document.getElementById("image").src = e.target.result;
    };

    // read the image file as a data URL.
    reader.readAsDataURL(this.files[0]);
};
</script>
</html>