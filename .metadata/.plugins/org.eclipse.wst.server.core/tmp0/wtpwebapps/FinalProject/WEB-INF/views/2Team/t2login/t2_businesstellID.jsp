<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="tellId-outline">

<c:choose>
<c:when test="${ID != null }">

<div class="tellId-tellIdDiv">
회원님의 아이디는  <label>${ID}</label> 입니다.

</div>
<br><br>
<a href="t2LoginGO">로그인 하러가기</a>

</c:when>

<c:otherwise>

<div class="tellId-tellIdDiv">
${result }
</div>
<br><br>

<a onclick="location.href='acceptgo?member=2'">회원가입하러 가기</a>

</c:otherwise>
</c:choose>






</div>

</body>
</html>