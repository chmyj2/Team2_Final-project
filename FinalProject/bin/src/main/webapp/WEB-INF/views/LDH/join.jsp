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

		<form action="member.join" method="post" enctype="multipart/form-data"
			name="joinForm" onsubmit="return joinCheck();">

			<div id="joinTable" class="joinTable" style="color: black;">
			
				<h2 id="joinTableTitle">회원가입</h2>
				<p class="required">* 필수입력사항</p>
				
				<!-- id 입력 -->
				<input class="join_input_id" id="jm_idInput" name="m_id" placeholder="ID *"
					maxlength="10" autocomplete="off" autofocus="autofocus">
				<p class="required_txt">10글자 이하</p>

				<!-- pw 입력 -->
				
				<input class="join_input_pw" name="m_pw" placeholder="Password *"
					type="password" maxlength="10" autocomplete="off">
				<p class="required_txt">숫자 하나 이상</p>
				
				<!-- pw 재확인 -->
				<input class="input_pw" name="m_pwChk" placeholder="Password Check *" type="password"
					maxlength="10" autocomplete="off">
				<br>
				
				<!-- 이름 입력 -->
					<input class="input_name"name="m_name" placeholder="Name *" maxlength="10"
						autocomplete="off">
				<br>
				<!-- 주소 -->
					<input class="input_addr1" id="jm_addr3Input" readonly="readonly" name="m_addr3"
							maxlength="5" autocomplete="off" placeholder="우편번호"> 
					<span class="search_addr" id="addrSearchBtn" style="margin-left:-5px">
							검색</span><br> 
					<input class="input_addr" id="jm_addr1Input" readonly="readonly" name="m_addr1"
							maxlength="30" autocomplete="off" placeholder="주소"><br> 
					<input class="input_addr" name="m_addr2" maxlength="30" autocomplete="off"	placeholder="상세주소">
				
				<!-- 사진 -->
				<div class="join_my_photo1">
					<span>-프로필 사진-</span> <br>
					<input class="my_photo1" name="m_photo" type="file">
				</div>
				
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