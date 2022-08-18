<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h2>회원정보</h2>
		<label>ID</label> <input type="text" readonly="readonly"
			value="${sessionScope.loginMember.member_ID }" style="border: none;"><br>

		<label>이름</label> <input type="text" readonly="readonly"
			value="${sessionScope.loginMember.member_name }" style="border: none;"><br>

		<label>생일</label> <input type="text" readonly="readonly"
			value="${sessionScope.loginMember.member_birth }" style="border: none;"><br>

		<label>성별</label> <input type="text" readonly="readonly"
			value="${sessionScope.loginMember.member_sex }" style="border: none;"><br>

		<label>전화번호</label>
		<input type="text" readonly="readonly" value="${sessionScope.loginMember.member_phoneNum }" style="border: none;"><br> 
		
		<label>주소</label> 
		<input type="text" readonly="readonly" value="${sessionScope.loginMember.member_address }" style="border: none; width: 300px;"><br> 
		
		<label>이메일</label> 
		<input type="text" readonly="readonly" value="${sessionScope.loginMember.member_email }"  style="border: none;"><br>

		<br>
		
		<input type="button" value="수정하기" id="modify" onclick="location.href='myinformation.chgae'"> 
		<input type="button" value="펫 관리하기"> 
		<input type="button" value="비밀번호바꾸기"> 
		<input type="button" value="탈퇴하기">
	
		
	</div>
</body>
</html>