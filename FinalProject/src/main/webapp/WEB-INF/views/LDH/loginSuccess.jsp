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
		
		<ul>
			<li class="login_area"><a href="loginandjoin.go"> 
				<img class="icon_login" src="resources/img/LOGIN.png"></a>
				<ul class="mypage_dropdown">
					<li><a href="member.info">MY PAGE</a></li>
					<li><a href="#">MY PET</a></li>
					<li><a href="member.logout">LOGOUT</a></li>
				</ul>
			</li>
			<li class="login_area">
			<a href="loginandjoin.go"> 
			<img class="icon_login" src="resources/img/LOGIN.png">
			</a>
				<ul class="mypage_dropdown">
					<li><a href="member.info">내 정보</a></li>
					<li><a href="#">나의 펫 정보</a></li>
					<li><a href="member.logout">logout</a></li>
				</ul>
			<li><a href="bag"><img class="icon_bag"src="resources/img/shop.png"></a></li>
		</ul>
</body>
</html>