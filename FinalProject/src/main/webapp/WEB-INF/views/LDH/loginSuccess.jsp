<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<!-- login 후  나타나는 drop페이지  CSS는 적용시켜놨어요. -->

		<div class="login_dropdown">

		<a href="#" class="dropbtn">
		<img class="icon_login" src="resources/img/LOGIN.png">
		</a>

		<div class="dropdown-content">
			<p>
				<button onclick="goMemberInfo()">내 정보</button>
			</p>
			<p>
				<a href="myTextC">나의 펫 정보</a>
			</p>
			<p>
				<button onclick="logout()">logout</button>
			</p>
		</div>
	</div>
</body>
</html>