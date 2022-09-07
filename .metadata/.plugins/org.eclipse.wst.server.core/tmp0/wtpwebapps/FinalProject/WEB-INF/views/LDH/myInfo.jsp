<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table id="loginSuccessTable">
		<tr>
			<td rowspan="2" style="width: 70px;">
			<%-- <img src="resources/files/${sessionScope.loginMember.m_photo }"></td> --%>
			<td style="height: 20px;">${sessionScope.loginMember.member_ID }</td>
		</tr>
		<tr>
			<td align="right" valign="top">(${sessionScope.loginMember.member_name })</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<!-- <button onclick="goMemberInfo()">내 정보</button> -->
				<!--    <a href="member.info"><img class="icon_login" src="resources/img/LOGIN.png"></a> -->
				<button onclick="logout()">로그아웃</button>
			</td>
		<tr>
	</table>

</body>
</html>