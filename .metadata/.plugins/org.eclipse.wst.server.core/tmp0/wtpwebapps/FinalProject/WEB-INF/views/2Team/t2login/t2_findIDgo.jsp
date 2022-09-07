<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="findID-outline">
		<div class="findID-email">
		
		<form action="findID.DO" method="POST" name="findID" onsubmit="return memberfindID()">
		<fieldset>
		<legend>e-mail로 찾기</legend>
		
		<table>
		<tr class="findID-email-tr">
		<td class="findID-email-td">이름</td>
		<td><input name="member_name" type="text" id="name"></td>
		</tr>
		
		<tr class="findID-email-tr">
		<td class="findID-email-td">email</td>
		<td><input name="member_email" type="email" id="email"></td>
		</tr>
		</table><br>
		
		
		<button>찾기</button>
		
		</fieldset>
		</form>
		</div>
		
		<div class="findID-line"></div>
		
		<div class="findID-phoneNum">
		<form action="findID.DO" method="POST" name="findID2" onsubmit="return IDfindbyphone()">
		<fieldset>
		<legend>전화번호로 찾기</legend>
		
		<table>
		
		<tr class="findID-phoneNum-tr">
		<td class="findID-phoneNum-td">이름</td>
		<td><input name="member_name" type="text" id="name"></td>
		</tr>
		
		<tr class="findID-phoneNum-tr">
		<td class="findID-phoneNum-td">전화번호</td>
		<td><input name="member_phoneNum" type="number" id="phoneNum"></td>
		</tr>
		
		</table><br>
		
		
		<button>찾기</button>
		
		</fieldset>
		</form>
		
		</div>
	
	</div>
</body>
</html>