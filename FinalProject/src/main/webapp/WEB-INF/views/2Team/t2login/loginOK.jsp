<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/t2_css/t2_login.css">
</head>
<body>
<div class="loginOK-dropdown" >
      <span class="loginOK-dropbtn">${sessionScope.loginMember.member_ID }님</span>
      <div class="loginOK-dropdown-content">
        <a href="#">내 정보</a>
        <a href="#">장바구니</a>
        <a href="#">예약확인</a>
        <a href="t2logout">로그아웃</a>
      </div>
    </div> 

</body>
</html>