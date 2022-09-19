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
		<!-- login 후에는 다시 login창 안뜨게 #으로 막아뒀어요. -->
			<li class="login_area"><a href="#"> 
				<img class="icon_login" src="resources/img/LOGIN.png"></a>
				<ul class="mypage_dropdown">
					<li><a href="member.info">MY PAGE</a></li>
					<li><a href="Purchased.Info?Order_User_ID=${sessionScope.loginMember.member_ID }">ORDER</a></li>
					<li><a href="pet.info">MY PET</a></li>
					<li><a href="member.logout">LOGOUT</a></li>
				</ul>
			</li>
			<li><a href="bag"><img class="icon_bag"src="resources/img/shop.png"></a></li>
		</ul>
</body>
</html>