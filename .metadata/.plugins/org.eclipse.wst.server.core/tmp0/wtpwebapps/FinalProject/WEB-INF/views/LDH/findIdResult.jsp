<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/loginAndJoin.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#loginBtn").click(function(){
			location.href='loginandjoin.go';
		})
	})
</script>
<title>Insert title here</title>
</head>
<body>
<div class="w3-content w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>아이디 찾기 검색결과</h3>
			</div>
			<div>
			<c:choose>
			<c:when test="${sessionScope.loginMember.member_linkWhere == 1 }">
			     <h5>
					${ id }
				</h5>
			</c:when>
			
			<c:otherwise>
			${sessionScope.loginMember.member_email }
			<h3>해당 이메일은 소셜로그인 가입 회원입니다.</h3>
			</c:otherwise>
			</c:choose>
				

				<p class="w3-center">
					<button type="button" id=loginBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">Login</button>
					<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
				</p>
			</div>
		</div>
	</div>
</body>
</html>