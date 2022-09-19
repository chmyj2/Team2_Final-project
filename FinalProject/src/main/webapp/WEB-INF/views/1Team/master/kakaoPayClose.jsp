<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
</head>
<body>
<div class="pay_wrapper">
	<img class="pay_complete" src="resources/img/about2.png">
	<p>Thank you for purchase!</p>
	<button class="pay_btn" onclick="check()">결제 완료</button>
</div>

</body>
<script type="text/javascript">
function check() {
	opener.parent.orderInsert();
	window.close();
	}

</script>
</html>