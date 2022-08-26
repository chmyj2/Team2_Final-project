<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/t2_js/jQuery.js"></script>
</head>
<body>
<button onclick="check()">결재완료</button>
</body>
<script type="text/javascript">
function check() {
	opener.parent.deletANDINsert();
	//window.close();
	}

</script>
</html>