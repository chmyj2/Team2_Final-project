<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/t2_js/jQuery.js"></script>
<link href="resources/t2_css/payment.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="success-page">
   <img  src="http://share.ashiknesin.com/green-checkmark.png" class="center" alt="" />
				<button onclick="check()" class="SuccessBtn">결제완료</button>
</div>
</div>


<div class="dog">
  <div class="heart heart--1"></div>
  <div class="heart heart--2"></div>
  <div class="heart heart--3"></div>
  <div class="heart heart--4"></div>
  <div class="head">
      <div class="year year--left"></div>
      <div class="year year--right"></div>
      <div class="nose"></div>  
    <div class="face">
      <div class="eye eye--left"></div>
      <div class="eye eye--right"></div>
      <div class="mouth"></div>
    </div>
  </div>
  <div class="body">
    <div class="cheast"></div>
    <div class="back"></div>
    <div class="legs">
      <div class="legs__front legs__front--left"></div>
      <div class="legs__front legs__front--right"></div>
      <div class="legs__back legs__back--left"></div>
      <div class="legs__back legs__back--right"></div>
    </div>
    <div class="tail"></div>
  </div>
</div>




</body>
<script type="text/javascript">
function check() {
	opener.parent.deletANDINsert();
	window.close();
	}

</script>
</html>