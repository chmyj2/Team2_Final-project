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
<div>

<c:choose>
<c:when test="${tellID.member_linkWhere == 1 }">
<div>
회원님의 아이디는 <span>${tellID.member_ID }</span> 입니다.
</div>
</c:when>
<c:when test="${tellID.member_linkWhere == 2 || tellID.member_linkWhere== 3}">

소셜 로그인로 가입하셨습니다. 
소셜 로그인 기능을 이용해주세요.

</c:when>
<c:otherwise>
${result }
가입이력이 없는 회원입니다.

</c:otherwise>
</c:choose>

</div>

</body>
</html>