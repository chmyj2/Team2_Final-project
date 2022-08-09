<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	$('#join_mail_check').click(function() {
		var email = $('#join-email').val();
		console.log(email); // 입력한 값 넘어오는지 확인
		var checkNum = $('#join_mail_num');
		
		$.ajax({
			url:"emailcheck",
			type:"GET",
			dataType :"text",
			data:{"member_email":email},
			success : function (data) {
				console.log("data : " +  data);
				checkNum.attr('disabled',false);
				code =data;
				alert('인증번호가 전송되었습니다.')
			}			
		}); //ajax끝
	});//joinCheckbtn끝
	
	$("#join_mail_num").blur(function() {
		var inputNum = $(this).val();
		var result = $('#mail-check-warn');
		
		if (inputNum == code) {
			result.html("인증번호가 일치합니다.")
			result.css('color','green');
			
		}else {
			result.html("인증번호가 불일치합니다.")
			result.css('color','red');
		}
		
	})
})


</script>
</head>
<body>
<div class="t2-join-outdiv">
<form action="doJoin" method="POST" class="joinForm" onsubmit="DoJoinForm__submit(this); return false;">
                                                                                               
      <h2>회원가입</h2>
      <div class="join-textForm">
        <input name="loginId" type="text" class="join-id" placeholder="아이디">
      </div>
      
      <div class="join-textForm">
        <input name="loginPw"  class="join-pw" placeholder="비밀번호">
      </div>
      
       <div class="join-textForm">
        <input name="loginPwConfirm"  class="join-pw" placeholder="비밀번호 확인">
      </div>
      
      <div class="join-textForm">
        <input name="name" type="password" class="join-name" placeholder="이름">
      </div>
      
      <div class="join-textForm brith">
      	생일&nbsp;&nbsp;<input name="nickname" type="date" class="join-birth" >
      </div>
      
      <div class="join-textForm brith">
      	성별 &nbsp;&nbsp;
        <input name="sex" type="radio" class="join-sex" value="m" checked="checked">남자
        &nbsp;&nbsp;<input name="sex" type="radio" class="join-sex" value="w">여자
      </div>
      
      <div class="join-textForm">
        <input name="cellphoneNo" type="number" class="join-cellphoneNo" placeholder="전화번호">
      </div>
      
      <div class="join-textForm addr">
       주소<br>
        <input id="join_addr3Input" readonly="readonly" name="m_addr3" maxlength="5" autocomplete="off" placeholder="우편번호">
		<span id="addrSearchBtn">[검색]</span><br>
		<input id="join_addr1Input" readonly="readonly" name="m_addr1" maxlength="30" autocomplete="off" placeholder="주소"><br>
		<input id="join_addr2Input" name="m_addr2" maxlength="30" autocomplete="off" placeholder="상세주소">
      </div>
      
       <div class="join-textForm">
        <input name="email" type="text" id="join-email" placeholder="이메일"> 
        <button type="button" id="join_mail_check">이메일인증</button><br>
        <input placeholder="인증번호를 입력해주세요" id="join_mail_num" disabled="disabled">
      <span id="mail-check-warn"></span>
      </div>
      
      
      <input type="submit" class="join-btn" value="J O I N"/>
    </form>
    </div>
</body>
</html>