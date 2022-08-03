<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<br>
	<form action="member.join"
		method="post" enctype="multipart/form-data"
		name="joinForm" onsubmit="return joinCheck();">
		<table id="joinTable">
			<tr>
				<td id="joinTableTitle" colspan="2" align="center">
					회원가입
				</td>
			</tr>
			<tr>
				<td class="td1">이름</td>
				<td class="td2"><input id="practice_member_name" name="member_name" placeholder="필수, 영어/숫자만" maxlength="10" autocomplete="off" autofocus="autofocus"></td>
			</tr>
			<tr>
				<td class="td1">생년월일</td>
				<td class="td2"><input name="member_name" placeholder="필수, 숫자 하나이상 반드시" type="password" maxlength="10" autocomplete="off"></td>
			</tr>
			<tr>
				<td class="td1">성별</td>
				<td class="td2"><input name="member_sex" placeholder="필수, 숫자 하나이상 반드시" type="password" maxlength="10" autocomplete="off"></td>
			</tr>
			<tr>
				<td class="td1">전화번호</td>
				<td class="td2"><input name="member_phoneNum" placeholder="필수" maxlength="10" autocomplete="off"></td>
			</tr>
			<tr>
				<td class="td1">주소</td>
				<td class="td2">
					<input id="practice_member_Address3" readonly="readonly" name="member_Address3" maxlength="5" autocomplete="off" placeholder="우편번호">
					<span id="addrSearchBtn">[검색]</span><br>
					<input id="practice_member_Address" readonly="readonly" name="member_Address1" maxlength="30" autocomplete="off" placeholder="주소"><br>
					<input name="member_Address2" maxlength="30" autocomplete="off" placeholder="상세주소">
				</td>
			</tr>
			<tr>
				<td class="td1">이메일</td>
				<td class="td2"><input name="member_eMail" placeholder="필수"></td>
			</tr>
			<tr>
				<td class="td1">정보동의</td>
				<td class="td2"><input name="member_paper" placeholder="필수"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" style="background-color: #FFFFFF;">
					<button>가입</button>
				</td>
			</tr>
		</table>
	</form>


</body>
</html>