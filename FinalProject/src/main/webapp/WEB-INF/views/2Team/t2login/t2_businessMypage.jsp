<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="memberInfoPage-outline">
		<h2>사업자 회원정보</h2>
		
		<table class="memberInfoPage-table">
		
		<tr class="memberInfoPage-tr">
		<td>ID</td>
		<td>${sessionScope.loginMember_business.vet_ID }</td>
		</tr>
		
		<tr class="memberInfoPage-tr">
		<td>사업자 번호</td>
		<td>${sessionScope.loginMember_business.vet_businessNum }</td>
		</tr>
		
		<tr class="memberInfoPage-tr">
		<td>전화번호</td>
		<td>${sessionScope.loginMember_business.vet_phoneNum }</td>
		</tr>
		
		<tr class="memberInfoPage-tr">
		<td>주소</td>
		<td>${addr[2]} ${addr[0]} ${addr[1]}</td>
		</tr>
		
		
		</table>
		
		
		<input type="button" value="수정하기" id="modify" onclick="location.href='businessInfoChange.go'"> 
		
		<input type="button" value="비밀번호바꾸기" onclick="location.href='businessPWchange.go'"> 
		
		<input type="button" value="탈퇴하기" onclick="location.href='#'">
	
		
	</div>
</body>
</html>