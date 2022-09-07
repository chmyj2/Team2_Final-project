<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="PWChange-outline">
<h1>비밀번호 변경하기</h1><br>

<form action="pwChange.do" method="post" name="pwChange">


<input name="member_PW" placeholder="비밀번호" id="pw1"><br>
<span class="pwChange-Guide">＊5자 이상 영어,숫자만 포함해주세요</span>
<br>
<span style="font-size: 2pt;" id="result"></span><br><br>
<input placeholder="비밀번호 재 확인" id="pw2"> <br>
<span id="result2"></span>
<br><br>

<button>변경하기</button>
</form>



</div>
</body>
<script type="text/javascript">
$(function() {
	$('#pw1').keyup(function() {
		let pw1 = $('#pw1').val();
		
		if(pw1.length<5){
			$('#result').text('5자 이하입니다.');
			$('#result').css('color','red');
			
		}else{
			$('#result').text('');
		}
		
		
		
	})
	
	$('#pw2').keyup(function() {
		let pw1 = $('#pw1').val();
		let pw2 = $('#pw2').val();
		
		if (pw2 != pw1) {
			$('#result2').text('일치하지않습니다.');			
			$('#result2').css('font-size','2pt');
			$('#result2').css('color','red');
		}else{
			$('#result2').text('');
		}
	})
	
})
</script>
</html>