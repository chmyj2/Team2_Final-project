<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="join_wrapper">

		<form action="member.join" method="post" 
			name="joinForm" onsubmit="return joinCheck();">

			<div id="joinTable" class="joinTable" style="color: black;">
			
				<h2 id="joinTableTitle">회원가입</h2>
				<p class="required">* 필수입력사항</p>
				
				<!-- id 입력 -->
				<input class="join_input_id" id="jm_idInput" name="member_ID" placeholder="ID *"
					maxlength="10" autocomplete="off" autofocus="autofocus">
				<p class="required_txt">10글자 이하</p>

				<!-- pw 입력 -->
				<input class="join_input_pw" name="member_PW" placeholder="Password *"
					type="password" maxlength="10" autocomplete="off">
				<p class="required_txt">숫자 하나 이상</p>
				
				<!-- pw 재확인 -->
				<input class="input_pw" name="m_pwChk" placeholder="Password Check *" type="password"
					maxlength="10" autocomplete="off">
				<br>
				
				<!-- 이름 입력 -->
					<input class="input_name"name="member_name" placeholder="Name *" maxlength="10"
						autocomplete="off">
				<br>
				
				<!-- 이메일 -->
				<input class="input_email"name="member_email" placeholder="Email *" type="email" maxlength="30"
						autocomplete="off">
				<br>

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
					<input class="input_addr" name="m_addr2" maxlength="30" autocomplete="off"	placeholder="상세주소">
				</div>
				
				<br>
				<!-- 사진 -->
				<!-- <div class="join_my_photo1">
					<span>-프로필 사진-</span> <br>
					<input class="my_photo1" name="m_photo" type="file">
				</div> -->
				<input type="hidden" name="member_linkWhere" value="1">
				<button class="join_btn">
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