<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="PWChangeBefore-outline">
<form action="pwchangeBefore.check" method="post">

<h1>비밀번호 확인</h1> <br>

<input name="member_PW" placeholder="비밀번호" type="password"> <br>
<span class="PWChangeBefore-result"  >${result} </span><br><br>

<button>확인</button>

</form>
</div>
</body>
</html>