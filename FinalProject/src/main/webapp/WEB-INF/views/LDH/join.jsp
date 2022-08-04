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

			<div id="joinTable" class="joinTable">
				<h2 id="joinTableTitle">회원가입</h2>
				<!-- id 입력 -->
				<input class="join_input_id" id="jm_idInput" name="m_id" placeholder="ID"
					maxlength="10" autocomplete="off" autofocus="autofocus">
				<p>필수, 10글자 이하</p>

				<!-- pw 입력 -->
				<input class="join_input_pw" name="m_pw" placeholder="Password"
					type="password" maxlength="10" autocomplete="off">
				<p>필수, 숫자 하나 이상</p>
				<!-- pw 재확인 -->
				<input class="input_pw" name="m_pwChk" placeholder="Password Check" type="password"
					maxlength="10" autocomplete="off">
				<br>
				<!-- 이름 입력 -->
					<input class="input_name"name="m_name" placeholder="Name" maxlength="10"
						autocomplete="off">
					<p>필수</p>
				<!-- 주소 -->
					<input class="input_addr1" id="jm_addr3Input" readonly="readonly" name="m_addr3"
							maxlength="5" autocomplete="off" placeholder="우편번호"> 
					<span id="addrSearchBtn" style="margin-left:-5px">[검색]</span><br> 
					<input class="input_addr" id="jm_addr1Input" readonly="readonly" name="m_addr1"
							maxlength="30" autocomplete="off" placeholder="주소"><br> 
					<input class="input_addr" name="m_addr2" maxlength="30" autocomplete="off"	placeholder="상세주소">
				<!-- 사진 -->
				<div class="td1">사진</div>
				<div class="td2">
					<input name="m_photo" type="file">
				</div>
				<button class="join_btn">가입</button>
			</div>
		</form>
	</div>
</body>
</html>