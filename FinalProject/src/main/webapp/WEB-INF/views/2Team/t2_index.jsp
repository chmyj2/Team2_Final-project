<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
	<meta charset="UTF-8">
	<title>Medirev</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<link rel="icon" href="favicon.png" type="image/png">
	<!-- Include Bootstrap CSS -->
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
	<!-- Include Font Awesome CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	<!-- Include Font Awesome CSS -->
	<link href='https://fonts.googleapis.com/css?family=Oswald:400,700|Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
	<!-- Include Medirev CSS -->
	<link href='resources/t2_css/style.css' rel='stylesheet' type='text/css'>
	<!-- SLIDER REVOLUTION 4.x CSS SETTINGS -->
	<link rel="stylesheet" type="text/css" href="css/settings.css" media="screen" />

	<link href='resources/t2_css/hospital_main.css' rel='stylesheet' type='text/css'> 
	<!-- Hospital CSS  -->
	<script type="text/javascript" src="resources/t2_js/jQuery.js"></script>
	<!-- jQuery JAVA SCRIPT -->

<<<<<<< HEAD
=======
<<<<<<< HEAD

=======
>>>>>>> a6e383e10a5af733dc112961ca35a5259eea6dd4
>>>>>>> BestSujin_email
	<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
	<link rel="stylesheet" href="resources/t2_css/t2_login.css">
	<!-- 주소 js -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="resources/t2_js/login_function.js"></script>

</head>
<body>
			<nav class="index_nav"><div class="index-nav-login"><jsp:include page="${loginPage }"></jsp:include></div></nav>
		<div class="container">
			<div class="container-fluid">
				<div class="header-top">
						<a href="team2Main"><img class="index_logo_img" src="resources/t2_img/logo.jpg" alt="" /></a>
					</div>
					
				</div>
			</div>
	<div id="indexMenu">
        <ul>
            <li><a href="hospitalGo">동물병원 찾기</a></li>
           <li><a href="viewProductPage.go">상품 판매</a></li>
            <li class="t2-indexDropdown">
            	<a href="#" class="t2-indexDropbtn">게시판</a>
            	<ul class="t2-indexDropdown-content">
            	<li><a href="team2.boardlist?board_category=1">강아지</a></li>                     
            	<li><a href="team2.boardlist?board_category=2">고양이</a></li>                 
           		<li><a href="team2.boardlist?board_category=3">etc</a></li>                 
            </ul>
            </li>
        </ul>
</div>
	
	
	

	<jsp:include page="${contentPage }"></jsp:include>

	
	
	
	
	<section class="footer">
		<div class="widget">
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-md-offset-half col-sm-4 col-xs-12 single-widget">
						<h2 class="widget-title">HOSPITAL ADDRESS</h2>
						<div class="widget-inner">
							<p>E44, Design Street, Web Corner Melbourne - 005</p>
							<ul>
								<li>Monday - Friday</li>
								<li>8.00 - 18.00</li>
								<li>Saturday</li>
								<li>8.00 - 18.00</li>
								<li>Sunday</li>
								<li>8.00 - 18.00</li>
							</ul>
						</div>
					</div>
					<div class="col-md-3 col-md-offset-1  col-sm-4 col-xs-12 single-widget">
						<h2 class="widget-title">QUICK LINKS</h2>
						<div class="widget-inner">
							<ul class="footer-menu">
								<li><a href="">Doctors</a></li>
								<li><a href="">Services</a></li>
								<li><a href="">Gallery</a></li>
								<li><a href="">News</a></li>
								<li><a href="">Terms of Use</a></li>
								<li><a href="">Privacy Policy</a></li>
								<li><a href="">Desclaimer</a></li>
								<li><a href="">Sitemap</a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-3 col-md-offset-1  col-sm-4 col-xs-12 single-widget">
						<h2 class="widget-title">SIGNUP FOR NEWSLETTER</h2>
						<div class="widget-inner">
							
							<div class="clearfix"></div>
							<div class="social footer">
								<a href=""><i class="fa fa-twitter"></i></a>
								<a href=""><i class="fa fa-instagram"></i></a>
								<a href=""><i class="fa fa-google-plus"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="copyright text-center">
			<div class="container">
				<div class="row">
					<p class="copyright">Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a></p>
				</div>
			</div>
		</div>
	</section>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
    <script type="text/javascript" src="js/jquery.themepunch.tools.min.js"></script>   
    <script type="text/javascript" src="js/jquery.themepunch.revolution.min.js"></script>
	<!-- Waypoint -->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
	<!-- Include Medirev JavaScript -->
	<script src="js/script.js"></script>
</body>
</html>