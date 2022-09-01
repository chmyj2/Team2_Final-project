<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	$(function(){
		
		$("#jm_idInput").keyup(function() {
			$.ajax({
				url : "check_id.do",
				type : "POST",
				data : {id : $("#jm_idInput").val()},
				success : function(result) {
					if (result == 1) {
						$("#id_check").html("중복된 아이디가 있습니다.");
						$("#joinBtn").attr("disabled", "disabled");
					} else {
						$("#id_check").html("");
						$("#joinBtn").removeAttr("disabled");
					}
				},
			})
		});
		
		$("#member_email").keyup(function(){
			$.ajax({
				url : "check_email.do",
				type : "POST",
				data : {
					email : $("#member_email").val()
				},
				success : function(result) {
					if (result == 1) {
						$("#email_check").html("중복된 이메일이 있습니다.");
					} else {
						$("#email_check").html("");
					}
				},
			})
		});
	})
</script>
<script>
/**
 *  회원가입 관련 처리
 */
 
 function fn_join(){
	var f = $('#joinForm');
	var formData = f.serialize();
		
	$.ajax({
		type : "POST",
		url : "/join",
		data : formData,
		success: function(data){
			if(data == "Y"){
				alert("회원가입이 완료되었습니다.");	
				location.href="/"
			}else{
				alert("회원가입에 실패하였습니다.");
			}
		},
		error: function(data){
			alert("회원가입 에러 발생!");
			console.log(data);
		}
	});
 }
 
 $(function() { 
 	
 	var email_auth_cd = '';
 
	$('#joinBtn').click(function(){
		
		if($('#jm_idInput').val() == ""){
			alert("아이디를 입력해주세요.");
			return false;
		}
		
		
		if($('#member_PW').val() == ""){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		
		if($('#member_PW').val() != $('#m_pwChk').val()){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		
		if($('#email_auth_key').val() != email_auth_cd){
			alert("인증번호가 일치하지 않습니다.");
			return false;
		}
	
		fn_join();
	});
	
	$(".email_auth_btn").click(function(){	     	 
    	 var email = $('#member_email').val();
    	 
    	 if(email == ''){
    	 	alert("이메일을 입력해주세요.");
    	 	return false;
    	 }
    	 
    	 $.ajax({
			type : "POST",
			url : "/emailAuth",
			data : {email : email},
			success: function(data){
				alert("인증번호가 발송되었습니다.");
				email_auth_cd = data;
			},
			error: function(data){
				alert("메일 발송에 실패했습니다.");
			}
		}); 
	});
	
	$('#jm_idInput').focusout(function(){
		var id = $('#jm_idInput').val();
	
		$.ajax({
			type : "POST",
			url : "/idCheck",
			data : {id : id},
			success: function(data){
				console.log(data);
				if(data == "Y"){
					$('#id_check').removeClass("dpn");
				}else{
					$('#id_check').addClass("dpn");
				}
			},
			error: function(data){
			}
		}); 
	});
	
 });
 </script>
<title>Insert title here</title>
</head>
<body>
	<div class="join_wrapper">

		<form action="member.join" method="post" 
			name="joinForm" id="joinForm" onsubmit="return joinCheck();">

			<div id="joinTable" class="joinTable" style="color: black;">
			
				<h2 id="joinTableTitle">회원가입</h2>
				<p class="required">* 필수입력사항</p>
				
				<!-- id 입력 -->
				<input class="join_input_id" id="jm_idInput" name="member_ID" placeholder="ID *"
					maxlength="10" autocomplete="off" autofocus="autofocus">
					<br>
					<span id="id_check" class="dpn"></span>
				<p class="required_txt">10글자 이하</p>

				<!-- pw 입력 -->
				<input class="join_input_pw" name="member_PW" id="member_PW" placeholder="Password *"
					type="password" maxlength="10" autocomplete="off">
				<p class="required_txt">숫자 하나 이상</p>
				
				<!-- pw 재확인 -->
				<input class="input_pw" name="m_pwChk" id="m_pwChk" placeholder="Password Check *" type="password"
					maxlength="10" autocomplete="off">
				<br>
				
				<!-- 이름 입력 -->
					<input class="input_name" name="member_name" placeholder="Name *" maxlength="10"
						autocomplete="off">
				<br>
				
				<!-- 이메일 -->
				<input class="input_email"name="member_email"id="member_email" placeholder="Email *" type="email" maxlength="30"
						autocomplete="off">
						<button type="button" id="email_auth_btn" class="email_auth_btn">인증번호 받기</button>
						<br>
				<span id="email_check" class="w3-text-red"></span>
				<br>
               <input type="text" placeholder="인증번호 입력" id="email_auth_key">
               
                <!-- 생년월일 입력 -->
				<div class="join-textForm brith">
					<input class="input_birth" name="member_birth" type="date" class="join-birth" >
					<p class="required_txt"> 생년월일 </p>
				</div>

                <!-- 성별 체크 -->
				<div class="join-textForm brith">
					성별 &nbsp;&nbsp; <input name="member_sex" type="radio"
						class="join-sex" value="m" checked="checked">남자
					&nbsp;&nbsp;<input name="member_sex" type="radio" class="join-sex"
						value="w">여자
				</div>

                <!-- 전화번호 입력 -->
				<div class="join-textForm">
					<input name="member_phoneNum" type="number"
						class="join-cellphoneNo" placeholder="PhoneNumber">
				</div>

				<!-- 주소 -->
				<div class="join-textForm addr">  <!-- 동훈이 추가함  -->
					<input class="input_addr1" id="jm_addr3Input" readonly="readonly" name="m_addr3"
							maxlength="5" autocomplete="off" placeholder="우편번호"> 
					<span class="search_addr" id="addrSearchBtn" style="margin-left:-5px">
							검색</span><br> 
					<input class="input_addr" id="jm_addr1Input" readonly="readonly" name="m_addr1"
							maxlength="30" autocomplete="off" placeholder="주소"><br> 
					<input class="input_addr" name="m_addr2" maxlength="30" autocomplete="off"	placeholder="상세주소  *">
				</div>
				
				<br>
				<!-- 사진 -->
				<!-- <div class="join_my_photo1">
					<span>-프로필 사진-</span> <br>
					<input class="my_photo1" name="m_photo" type="file">
				</div> -->
				<input type="hidden" name="member_linkWhere" value="1">
				<button class="join_btn" id="joinBtn">
				<span>가입</span>
				</button>
				<div class="join_img">
					<img class="join_img_pet" src="resources/img/about2.png" alt="">
				</div>
			</div>
		</form>
	</div>
</body>
</html>