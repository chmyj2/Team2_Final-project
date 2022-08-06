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
	
	<ul class="menu__tabs">
			<li><a  href="#item-1"><i class="fa fa-user"></i> 개인</a></li>
			<li><a class="active" href="#item-2"><i class="fa fa-building"></i> 기업</a></li>	
		</ul>
		<section class="menu__wrapper">
			<article id="item-1" class="menu__item ">
				<h3>개인</h3>
				
				<form action="t2LoginDO" method="post" name="loginForm">

		<div class="login_txt">
			<h2 class="login_h2">Welcome!</h2>
			<div class="login-social">
				<a href=""><i class="fa fa-kakao">kakao</i></a>
				<a href=""><i class="fa fa-naver">naver</i></a>
				<a href=""><i class="fa fa-google-plus"></i></a>
							</div>
			
			<label class="login_label"> <span>ID</span> 
			<input class="login_input" name="member_ID" />
			</label> <label class="login_label"> <span>Password</span> 
			<input class="login_input" name="member_PW" />
			</label>
			<span class="pw_alert">${r}</span>
			<input type="checkbox" id="login_idSave">아이디 기억하기
			<button class="forgot-pass" type="button"  style="font-size: 12px;" onclick="location.href='t2join' ">회원가입</button>
			<p class="forgot-pass"  style="font-size: 12px;">아이디를 잊으셨나요?</p>
			<p class="forgot-pass"  style="font-size: 12px;">비밀번호를 잊으셨나요?</p>
			<div class="box bg-1">
			<input type="submit" class="login-btn" value="L o g i n"/>
			</div>
		</div>
</form>

			</article>
			
			<article id="item-2" class="menu__item item-active">
				<h3>기업</h3>
			<form action="t2LoginDO.business" method="post" name="loginForm">

		<div class="login_txt">
			<h2 class="login_h2">Welcome!</h2>
			
			<label class="login_label"> <span>ID</span> 
			<input class="login_input" name="vet_ID" />
			</label> <label class="login_label"> <span>Password</span> 
			<input class="login_input" name="vet_PW" />
			</label>
			<span class="pw_alert">${rb}</span>
			<input type="checkbox" id="login_idSave">아이디 기억하기
			<p class="forgot-pass"  style="font-size: 12px;">회원가입</p>
			<p class="forgot-pass"  style="font-size: 12px;">아이디를 잊으셨나요?</p>
			<p class="forgot-pass"  style="font-size: 12px;">비밀번호를 잊으셨나요?</p>
			<div class="box bg-1">
			<input type="submit" class="login-btn" value="L o g i n"/>
			</div>
		</div>
</form>
			</article>


		</section>
		
	
</div>
</body>
<script type="text/javascript">
$(function() {

	// Menu Tabular
	var $menu_tabs = $('.menu__tabs li a'); 
	$menu_tabs.on('click', function(e) {
		e.preventDefault();
		$menu_tabs.removeClass('active');
		$(this).addClass('active');

		$('.menu__item').fadeOut(300);
		$(this.hash).delay(300).fadeIn();
	});
	

	

});</script>
</html>