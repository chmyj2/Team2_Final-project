<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row {
   margin: 0px auto; /*가운데 정렬*/
}
</style>
</head>
<body>
<button onclick="location.href='regProductPage.go'">운영자전용 상품등록버튼</button>${result }



<div class="login_didididiv">
	
	<ul class="menu__tabs">
			<li><a class="active" href="#item-1">전체보기</a></li>
			<li><a href="#item-2">간식</a></li>	
			<li><a href="#item-3">용품</a></li>	
		</ul>
		<section class="menu__wrapper">
			<article id="item-1" class="menu__item item-active">
				
				<div class="container-fluid">
     <div class="row">
      <c:forEach var="p" items="${Product}">
           <div class="col-md-3">
           <a href="detailPage.go?productNum=${p.productNum}"><div class="thumbnail">
                <img src="resources/t2_yj_files/${p.productThumbnail }" style="height: 300px;width:300px">
                <div class="caption">
                  <p>${fn:length(p.productName)>20?fn:substring(p.productName,0,20)+="...":p.productName }</p>
                  <p><fmt:formatNumber value="${p.productPrice }" pattern="#,###" />원</p>
                   
                </div>
            </div></a>
           </div>
         </c:forEach>
     </div>
    </div>
				
				

			</article>
			
			<article id="item-2" class="menu__item">
				
				<div class="container-fluid">
     <div class="row">
      <c:forEach var="s" items="${Snack}">
           <div class="col-md-3">
           <a href="detailPage.go?productNum=${s.productNum}"><div class="thumbnail">
                <img src="resources/t2_yj_files/${s.productThumbnail }" style="height: 300px;width:300px">
                <div class="caption">
                  <p>${fn:length(s.productName)>20?fn:substring(s.productName,0,20)+="...":s.productName }</p>
                  <p><fmt:formatNumber value="${s.productPrice }" pattern="#,###" />원</p>
                   
                </div>
            </div></a>
           </div>
         </c:forEach>
     </div>
    </div>
				
				
			</article>
			
			<article id="item-3" class="menu__item">
				
				<div class="container-fluid">
     <div class="row">
      <c:forEach var="t" items="${Toy}">
           <div class="col-md-3">
           <a href="detailPage.go?productNum=${t.productNum}"><div class="thumbnail">
                <img src="resources/t2_yj_files/${t.productThumbnail }" style="height: 300px;width:300px">
                <div class="caption">
                  <p>${fn:length(t.productName)>20?fn:substring(t.productName,0,20)+="...":t.productName }</p>
                  <p><fmt:formatNumber value="${t.productPrice }" pattern="#,###" />원</p>
                   
                </div>
            </div></a>
           </div>
         </c:forEach>
     </div>
    </div>
				
				
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
	

	

});

function changeBtn() {
	let btn = document.getElementById('checkButton');
	let disabled = btn.disabled;
	if(disabled){
	btn.disabled = false;
	}else{
	btn.disabled = true;		
	}	
}

</script>
</html>