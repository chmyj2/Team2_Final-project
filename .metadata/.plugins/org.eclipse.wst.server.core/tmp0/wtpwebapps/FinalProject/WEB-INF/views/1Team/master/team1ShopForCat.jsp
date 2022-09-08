<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
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

});


</script>
<style type="text/css">
html {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

*, 
*:before, 
*:after {
	/* margin: 0; */
	padding: 0;
	-webkit-box-sizing: inherit;
	-moz-box-sizing: inherit;
	box-sizing: inherit;
}

/*--------------------------
* MENU TABS
---------------------------*/
.menu__tabs {
	list-style: none;
	overflow: hidden;
}
.menu__tabs li {
	float: left;
	margin-right: 2px;
	font-size: 1.3em;
}
.menu__tabs a {
	padding: 1em;
	background: #333b48;
	display: inline-block;
	color: #FFF;
	text-decoration: none;
	-webkit-border-radius: 4px 4px 0 0;
	-moz-border-radius: 4px 4px 0 0;
	border-radius: 4px 4px 0 0;
	-webkit-transition: all 0.3s ease;
	-o-transition: all 0.3s ease;
	transition: all 0.3s ease;
	-webkit-box-shadow: inset 0 -2px 5px rgba(0,0,0,0.2);
	-moz-box-shadow: inset 0 -2px 5px rgba(0,0,0,0.2);
	box-shadow: inset 0 -2px 5px rgba(0,0,0,0.2);
}
.menu__tabs a:hover {
	background: #515a68;
}
.menu__tabs a.active {
	color: #333b48;
	background: #FFF;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
}
.menu__tabs a.active i {color: #80cbb7;}
.menu__tabs a i {
	margin-right: 3px;
	color: #aaaaaa;
}

/*--------------------------
* MENU WRAPPER
---------------------------*/
.menu {
	margin: 55px auto;
	width: 80%;
	max-width: 600px;
	position: relative;
}
.menu__wrapper {
	padding: 2em;
	position: relative;
	z-index: 400;
/* 	background: #FFF; */
	min-height: 300px;
	-webkit-border-radius: 0 4px 4px 4px;
	-moz-border-radius: 0 4px 4px 4px;
	border-radius: 0 4px 4px 4px;
}
.menu--shadow {
	position: absolute;
	z-index: 300;
	bottom: -5px;
	height: 25px;
	width: 100%;
}
.menu--shadow:after,
.menu--shadow:before {
	content: '';
	display: block;
	width: 50%;
	height: 25px;
	position: absolute;
	left: 0;
	background: rgba(0,0,0,0.2);
	-webkit-border-radius: 25px;
	-moz-border-radius: 25px;
	border-radius: 25px;
	-webkit-box-shadow: 0 0 15px 5px rgba(0,0,0,0.25);
	-moz-box-shadow: 0 0 15px 5px rgba(0,0,0,0.25);
	box-shadow: 0 0 15px 5px rgba(0,0,0,0.25);
	-webkit-transform: scale(0.8) rotate(-4deg);
	-ms-transform: scale(0.8) rotate(-4deg);
	-o-transform: scale(0.8) rotate(-4deg);
	transform: scale(0.8) rotate(-4deg);
}
.menu--shadow:after {
	right: 0;
	left: auto;
	-webkit-transform: scale(0.8) rotate(4deg);
	-ms-transform: scale(0.8) rotate(4deg);
	-o-transform: scale(0.8) rotate(4deg);
	transform: scale(0.8) rotate(4deg);
}
.menu__wrapper .menu__item {
	line-height: 1.3;
	color: #76716f;
	display: none;
}
.menu__wrapper .menu__item.item-active {
	display: block;
}
.menu__wrapper .menu__item h3 {
	font-size: 1.8em;
	color: #333b48;
	border-bottom: 1px solid #d9d9d9;
	padding-bottom: 5px;
	margin-bottom: 12px;
}
.menu__wrapper .menu__item p {
	/* font-size: 1.3em;
	line-height: 1.6em;
	color: #76716f; */
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- <script type="text/javascript">
/* 상품 디테일 페이지로 이동 */
	function gotoDetail(num) {
			location.href="enter.productDetail"?num_PK="+num;
		}
/* 상품 카테고리별 출력 */
 		function selectACategory() {
			var categoryNum = document.getElementById('categoryNumSelect');
			var cv = categoryNum.options[categoryNum.selectedIndex].value;
			location.href="get.team1byCategory?categoryNum="+cv;
		};		
</script> -->

</head>
<body>
 <div class="store_wrap">
        <div class="store_header">
            <div class="store_for_dog">
                <img class="store_for_dog_img" src="resources/img/about3.png" alt="">
            </div>
            <h2>
                <a href="#">FOR DOG</a>
            </h2>
        </div>
    
        <!-- 카테고리/제조사별 3개정도? 
                로얄캐닌/네츄럴코어/ANF-->
        <!-- 자견용(퍼피)/성견용(어덜트)/노령견용(시니어)/전연령용
                각 DB 5개 정도씩? -->

                <div class="store_new_products_txt">
                    <h2>* DRY FOOD FOR DOG *</h2>
                    <p>From raw materials for dogs to other well-being pet foods</p>
                </div>
                <div class="login_didididiv">
	
    <!-- 카테고리 탭 -->
	<ul class="menu__tabs">
			<li><a class="active" href="#item-1">전체보기</a></li>
			<li><a href="#item-2">사료</a></li>	
			<li><a href="#item-3">장난감</a></li>	
		</ul>
		
		
		<section class="menu__wrapper">
			
			<!-- 전체보기 -->
			<article id="item-1" class="menu__item item-active">
				<div class="container-fluid">
     <div class="row">
      <c:forEach var="p" items="${products}">
           <div class="col-md-3">
           <a href="get.aProductTeam1?product_num=${p.product_num}"><div class="thumbnail">
                <img src="resources/reviewFile/${p.product_thumnail }" style="height: 300px;width:300px">
                <div class="caption">
                  <p>${fn:length(p.product_title)>20?fn:substring(p.product_title,0,20)+="...":p.product_title }</p>
                  <p><fmt:formatNumber value="${p.product_price }" pattern="#,###" />원</p>
                </div>
            </div></a>
           </div>
         </c:forEach>
     </div>
    </div>
			</article>
			
			
			<!-- 사료&간식 -->
			<article id="item-2" class="menu__item">
				
				<div class="container-fluid">
     <div class="row">
      <c:forEach var="s" items="${foods}">
           <div class="col-md-3">
           <a href="get.aProductTeam1?product_num=${s.product_num}"><div class="thumbnail">
                <img src="resources/reviewFile/${s.product_thumnail }"style="height: 300px;width:300px">
                <div class="caption">
                  <p>${fn:length(s.product_title)>20?fn:substring(s.product_title,0,20)+="...":s.product_title }</p>
                  <p><fmt:formatNumber value="${s.product_price }" pattern="#,###" />원</p>
                   
                </div>
            </div></a>
           </div>
         </c:forEach>
     </div>
    </div>
				
				
			</article>
			
			<!-- 용품(장난감) -->
			<article id="item-3" class="menu__item">
				
				<div class="container-fluid">
     <div class="row">
      <c:forEach var="t" items="${toys}">
           <div class="col-md-3">
           <a href="get.aProductTeam1?product_num=${t.product_num}"><div class="thumbnail">
                <img src="resources/reviewFile/${t.product_thumnail }" style="height: 300px;width:300px">
                <div class="caption">
                  <p>${fn:length(t.product_title)>20?fn:substring(t.product_title,0,20)+="...":t.product_title }</p>
                  <p><fmt:formatNumber value="${t.product_price }" pattern="#,###" />원</p>
                   
                </div>
            </div></a>
           </div>
         </c:forEach>
     </div>
    </div>
			</article>


		</section>
		
	
</div>
 </div>


                <!-- 제조사별/연령별 체크박스 -->
               <!--  <div class="store_for_dog_category_wrap">
                    <div class="store_foe_dog_category_select">
                        <div class="store_for_dog_categoty_row">
                            <strong>By Company</strong>
                            <input type="checkbox" name="royal_canin" value="royal_canin">Royal Canin
                            <input type="checkbox" name="natural_core" value="natural_core">Natural Core
                            <input type="checkbox" name="anf" value="anf">ANF
                        </div>
                        <br>
                        <div class="store_for_dog_category_col">
                            <strong>By Age</strong>
                            <input type="checkbox" name="puppy" value="puppy">Puppy
                            <input type="checkbox" name="adult" value="adult">Adult
                            <input type="checkbox" name="senior" value="senior">Senior
                        </div>
                    </div>
                    영양제링크

                    
                </div> -->
        
       <!--  <div class="store_new_products">

            <div class="store_new_products_img">
                <div class="store_new_products_ANF">
               -->
            
           <!-- 상품 리스트 보여주기 -->
   <%--  <div class="row">
      <c:forEach var="p" items="${products}">
           <div class="col-md-3">
           <a href="get.aProductTeam1?product_num=${p.product_num}"><div class="thumbnail">
                <img src="resources/reviewFile/${p.product_thumnail }" style="height: 300px;width:300px">
                <div class="caption">
                   <h2> ${fn:length(s.product_title)>20?fn:substring(p.product_title,0,20)+="...":p.product_title }</h2> 
                  <p><fmt:formatNumber value="${p.product_price }" pattern="#,###" />원</p>
                   
                </div>
            </div></a>
           </div>
         </c:forEach>
     </div>
     
            </div>
     
    </div>
            
            
            
        </div> --%>
   

	<!-- <div class="store_wrapper">
			상품 카테고리별 출력 선택 
			<h2>카테고리별 출력</h2>
			<div style="color:fuchsia; display: inline-block;" >
			상품 카테고리(선택)
			<select id="categoryNumSelect" name="categoryNum" onchange="selectACategory()">
					<option hidden="hidden">전체보기</option>
					<option value="01">영양제</option>
					<option value="02">간식</option>
					<option value="03">사료</option>
			</select>
			</div>			 -->
			
			<!-- store format  -->
			<%-- <c:forEach var="products" items="${products}">
			<div class="store_new_products_ANF" onclick="gotoDetail(${products.num_PK})">
                    <img src="resources/team1ProductImgs/${products.thumbnail}" alt="${products.name}">
                    <h2>${products.name}</h2>
                    <p>${products.name}</p>
                    <span>0.0kg 
                        <strong><fmt:setLocale value="ko_KR" /><fmt:formatNumber type="currency" value="${products.price}" /></strong>
                    </span><br>
           </div>
			</c:forEach> --%>
	<!-- </div> -->
</body>
</html>