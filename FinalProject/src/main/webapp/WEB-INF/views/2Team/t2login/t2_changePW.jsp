<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="PWChange-outline">
<h1>비밀번호 변경하기</h1><br>
<input class="validCheck" type="hidden" id="join_PWCheck" value="PWUnCheck"> 
<input class="validCheck" type="hidden"  id="join_PWCheck2" value="PWUnCheck"> 

<form action="pwChange.do" method="post" name="pwChange" onsubmit="return memberPWChange()">

<input name="member_PW" placeholder="비밀번호" id="pw1" type="password" ><br>
<span class="pwChange-Guide">＊5자 이상 영어,숫자만 포함해주세요</span>
<br>
<span style="font-size: 2pt;" id="result"></span><br><br>

<input placeholder="비밀번호 재 확인" id="pw2" type="password" > <br>
<span id="result3"></span>
<br><br>

<button>변경하기</button>
</form>



</div>
</body>
</html>