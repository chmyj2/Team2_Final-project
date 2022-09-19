<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>


<script type="text/javascript">

	$(function() {
		/* 글 눌렀을 때 토글 */
		$(".adopt_cont").click(function() {
		$(".adopt_cont_drop").toggle();
		});
		/* x버튼으로 닫기 */
		$("#x_button").click(function() {
			$(".adopt_cont_drop").hide();
		});
	});
	</script>
<body>
	<div class="adopt_gallary_wrap">
		<ul class="board_header">
			<h2>ADOPT</h2>
		</ul>
		<div class="adopt_header_wrap">
			<ul class="adopt_cont">
				<li><img id="adopt_img" src="resources/img/contact_dona.jpg"
					alt=""></li>
				<ul class="adopt_text">
					<li>관리번호 : {adopt_num}</li>
					<li>종류 : 개</li>
					<li>품종 : 믹스</li>
					<li>성별 : 여</li>
					<li>발견장소 : 용호1동 솔밭놀이터</li>
				</ul>
			</ul>
			<ul class="adopt_cont">
				<li><img id="adopt_img" src="resources/img/contact_dona.jpg"
					alt=""></li>
				<ul class="adopt_text">
					<li>관리번호 : {adopt_num}</li>
					<li>종류 : 개</li>
					<li>품종 : 믹스</li>
					<li>성별 : 여</li>
					<li>발견장소 : 용호1동 솔밭놀이터</li>
				</ul>
			</ul>
			<ul class="adopt_cont">
				<li><img id="adopt_img" src="resources/img/contact_dona.jpg"
					alt=""></li>
				<ul class="adopt_text">
					<li>관리번호 : {adopt_num}</li>
					<li>종류 : 개</li>
					<li>품종 : 믹스</li>
					<li>성별 : 여</li>
					<li>발견장소 : 용호1동 솔밭놀이터</li>
				</ul>
			</ul>
		</div>
		
		
		
		<!-- ------------------ -->
		<div class="adopt_cont_drop" style="display:none;" >
			<button id="x_button">X</button>
			<h1>제목</h1>
			<ul class="adopt_cont_drop_txt">
				<img src="resources/img/contact_dona.jpg" alt="">
				<li>분양동물: 강아지 / 믹스</li>
				<li>성별 : 여</li>
				<li>분양지역: 전라남도</li>
				<li>책임비 : 무료분양</li>
				<li>등록인 : ID</li>
				<li>E-mail :</li>
			</ul>
			<ul class="adopt_cont_drop_textarea">
				<li>솔밭 놀이터에서 3일전에 발견했어요.</li>
			</ul>
		</div>

	</div>



</body>
</html>