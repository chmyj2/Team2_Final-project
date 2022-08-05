<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/t2_css/t2_login.css">
</head>
<body class="login_body">

	
	<div class="login_didididiv">
	<form action="DoLoginController" method="post" name="loginForm" onsubmit="return login_call()">

		<div class="login_txt">
			<h2 class="login_h2">Welcome!</h2>
			
			<label class="login_label"> <span>ID</span> 
			<input class="login_input" name="id" />
			</label> <label class="login_label"> <span>Password</span> 
			<input class="login_input" name="pw" />
			</label>
			<span class="pw_alert">${r}</span>
			<p class="forgot-pass" onclick="#">아이디를 잊으셨나요?</p>
			<p class="forgot-pass" onclick="#">비밀번호를 잊으셨나요?</p>
			<div class="box bg-1">
			<button class="button button--nina button--text-thick button--text-upper button--size-s" data-text="LOGIN">
			<span>H</span><span>E</span><span>L</span><span>L</span><span>O</span>
			</button>
			</div>
		</div>


</form>
	
</div>

</body>
</html>