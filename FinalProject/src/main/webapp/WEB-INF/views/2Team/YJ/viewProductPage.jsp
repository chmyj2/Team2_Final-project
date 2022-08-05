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
<%-- <c:if test="${sessionScope.accountInfo.user_id eq 'ADMIN' }">
		<div><button onclick="location.href='regProductPage'">운영자전용 상품등록버튼</button></div>
	</c:if> --%>

<button onclick="location.href='regProductPage'">운영자전용 상품등록버튼</button>

</body>
</html>