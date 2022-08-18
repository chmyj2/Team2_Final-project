<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="text-align: center;">
		<h2>회원정보 수정</h2>
		<label>ID</label> <input type="text" readonly="readonly"
			value="${sessionScope.loginMember.member_ID }" style="border: none;"><br>

		<label>이름</label> <input type="text" 
			value="${sessionScope.loginMember.member_name }" ><br>

		<label>생일</label> <input type="text" 
			value="${sessionScope.loginMember.member_birth }" ><br>

		<label>성별</label> <input type="text" 
			value="${sessionScope.loginMember.member_sex }" ><br>

		<label>전화번호</label>
		<input type="text"  value="${sessionScope.loginMember.member_phoneNum }" ><br> 
		
		<label>주소</label> 
		 <input id="join_addr3Input" readonly="readonly" name="m_addr3" maxlength="5" autocomplete="off" placeholder="우편번호">
		<span id="addrSearchBtn">[검색]</span><br>
		<input id="join_addr1Input" readonly="readonly" name="m_addr1" maxlength="30" autocomplete="off" placeholder="주소"><br>
		<input id="join_addr2Input" name="m_addr2" maxlength="30" autocomplete="off" placeholder="상세주소">
		<br> 
		
		<label>이메일</label> 
		<input type="text"  value="${sessionScope.loginMember.member_email }" >
		<button type="button" id="join_mail_check">이메일인증</button><br>
        <input placeholder="인증번호를 입력해주세요" id="join_mail_num" disabled="disabled">
        <input type="hidden" id="join_num_check" value="emailUnCheck">
      <span id="mail-check-warn"></span> <!-- 인증코드 확인 -->
      <span id="emailcheckResult"></span> <!-- 중복확인 --><br>

		<br>
		
		<input type="button" value="등록하기" id="modify" onclick="location.href='#'"> 
		
	
		
	</div>
</body>
</html>