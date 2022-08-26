<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>수정하기</h1>
	<img src="resources/t2_sj_petFiles/${petInfo.baby_img }"
		class="myPetPage-img">
		<input type="file" name="baby_img" value="${petInfo.baby_img }">
	<br>
	<br>

	<table class="myPetPage-table">

		<tr>
			<td>이름</td>
			<td>${petInfo.baby_name }</td>
		</tr>

		<tr>
			<td>생일</td>
			<td>${petInfo.baby_birth }</td>
		</tr>

		<tr>
			<td>성별</td>
			<td>${petInfo.baby_sex }</td>
		</tr>

		<tr>
			<td>종류</td>
			<td>${petInfo.baby_type }</td>
		</tr>

		<tr>
			<td>품종</td>
			<td>${petInfo.baby_typeDetail }</td>
		</tr>

		<tr>
			<td>중성화</td>
			<td>${petInfo.baby_neut }</td>
		</tr>

	</table>


	<button onclick="location.href='#'">저장하기</button>
	&nbsp;&nbsp;
	<input type="button" onclick="history.back()" value="뒤로가기">
</body>
</html>