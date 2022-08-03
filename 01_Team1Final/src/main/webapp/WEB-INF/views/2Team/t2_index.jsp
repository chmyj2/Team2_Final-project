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
	<style type="text/css">
	.index-main{
	display: flex;
        
    }

.index-main div{
	flex-grow: 1;
	height: 1200px;
	text-align: center;
	
    }



/* ul li태그에 리스트 스타일을 없앰 */
ul li{
	list-style: none;
	}


a {
	text-decoration: none;
	
	}
	

        
/* 글자크기를 16px 맑은 고딕 굵게하고 width넓이 700, 높이 50만큼 배경색은 #ccc, 글자색은 검정색, 라인높이50px
menu박스 가운데정렬, 글자가운데 정렬 */
        
        
#indexMenu {
	position: fixed;
	top: 0px;
    height:50px;
    background: rgb(82,129,209);
    line-height: 50px;
    margin:0 auto;
    text-align: center;
    position: sticky;
    z-index: 999;
    font-size: 18px;
    
    }
    
   
    

#indexMenu ul{
	display: inline-block;
	
	 }
        



/* menu태그 자식의 ul의 자식 li를 왼쪽정렬과 넓이 140설정 */
	
#indexMenu > ul > li {
	float:left;
	width:140px;
	position:relative;
	font-weight: 500;
	}
	


#indexMenu > ul > li > a {
  color: white;
}

	
/* 메뉴 4 들어갔을때 */
#indexMenu > ul > li > ul {
	width:350px;
	display:none;
	position: absolute;
	font-size:14px;
	background : #B8B8B8;
	
	
	
	}
	
	
#indexMenu > ul > li:hover > ul {
	
	display:flex;

	}
	
	
#indexMenu >ul>li>ul>li{
	width: 500px;
	}


#indexMenu > ul > li > ul > li:hover {
	background: #0d47a1;
	transition: ease 0.5s;
	}
		
		
#indexMenu > ul > li > ul > li > a {
  color: white;
}

.index_nav{
	padding-top: 10px;

}

.index-nav-login{
	text-align: right;
	padding-right: 25px;
	text-decoration-line : none;
	text-decoration : none;


}

.index_logo_img{
	width: 250px;
	height:170px;

}

.index-logo-title{
	font-size: 30px;
	text-decoration-line : none;
	text-decoration : none;
}




a { text-decoration:none !important }
a:hover { text-decoration:none !important }

	
	</style>
	
	
</head>
<body>
			<nav class="index_nav"><div class="index-nav-login"><a href="#">로그인</a></div></nav>
		<div class="container">
			<div class="container-fluid">
				<div class="header-top">
						<a href="#"><img class="index_logo_img" src="resources/t2_img/logo.jpg" alt="" /></a>
					</div>
					
				</div>
			</div>
	<div id="indexMenu">
        <ul>
            <li><a href="ourCollectionController">동물병원 찾기</a></li>
           <li><a href="viewProductPage">상품 판매</a></li>
            <li><a href="#">게시판</a></li>
        </ul>
</div>
	
	
	
	<%-- <jsp:include page="${contentPage }"></jsp:include> --%>
	
	
	
	
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