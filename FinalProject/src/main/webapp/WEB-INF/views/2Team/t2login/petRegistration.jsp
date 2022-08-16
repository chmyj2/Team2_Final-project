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
      <div class="join-textForm">   
        <span>펫 이미지</span>
        <input name="baby_img" type="file" class="join-name" onchange="setThumbnail(event)"> 
        <img id="image" src="">
      </div>
      
      <div class="join-textForm">   
        <input name="member_ID" type="text" class="join-id" placeholder="펫이름">      
        <span id="idcheckResult"></span>
      </div>
      
      <div class="join-textForm">
        <input name="member_PW"  class="join-pw" placeholder="비밀번호">
      </div>
      
       <div class="join-textForm">
        <input name="loginPwConfirm"  class="join-pw2" placeholder="비밀번호 확인">
        <span class="pwCheckResult"></span>
      </div>
      
      <div class="join-textForm">
        <input name="member_name"  class="join-name" placeholder="이름">
      </div>
      
      <div class="join-textForm brith">
      	생일&nbsp;&nbsp;<input name="member_birth" type="date" class="join-birth" >
      </div> 
      
      <div class="join-textForm brith">
      	성별 &nbsp;&nbsp;
        <input name="member_sex" type="radio" class="join-sex" value="m" checked="checked">남자
        &nbsp;&nbsp;<input name="member_sex" type="radio" class="join-sex" value="w">여자
      </div>
      
      <div class="join-textForm">
        <input name="member_phoneNum" type="number" class="join-cellphoneNo" placeholder="전화번호">
      </div>
      
      <div class="join-textForm addr">
       주소<br>
        <input id="join_addr3Input" readonly="readonly" name="m_addr3" maxlength="5" autocomplete="off" placeholder="우편번호">
		<span id="addrSearchBtn">[검색]</span><br>
		<input id="join_addr1Input" readonly="readonly" name="m_addr1" maxlength="30" autocomplete="off" placeholder="주소"><br>
		<input id="join_addr2Input" name="m_addr2" maxlength="30" autocomplete="off" placeholder="상세주소">
      </div>
      
       <div class="join-textForm">
        <input name="member_email" type="email" id="join-email" placeholder="이메일"> 
        <button type="button" id="join_mail_check">이메일인증</button><br>
        <input placeholder="인증번호를 입력해주세요" id="join_mail_num" disabled="disabled">
        <input type="hidden" id="join_num_check" value="emailUnCheck">
      <span id="mail-check-warn"></span> <!-- 인증코드 확인 -->
      <span id="emailcheckResult"></span> <!-- 중복확인 -->
      </div>
      
      <input type="submit" class="join-btn" value="J O I N"/>
    </form>
    </div>
</body>
<script type="text/javascript">
$(document).ready(function setThumbnail(event) {
    var reader = new FileReader();

    reader.onload = function(event) {
      var img = document.createElement("baby_img");
      img.setAttribute("src", event.target.result);
      document.querySelector("div#image_container").appendChild(img);
    };

    reader.readAsDataURL(event.target.files[0]);
  });
</script>
</html>