<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function selectAll(selectAll)  {
	var checkboxes = document.getElementsByName('cart');
  	
	checkboxes.forEach((checkbox) => {
		checkbox.checked = selectAll.checked;
  })
};


$(function(){
	$(".paymentBtn").click(function() {
		
		var totalPrice = document.getElementById("totalPrice").innerHTML ;
		alert(totalPrice);
		
		$('input', $('.divTableBody')).each(function(i, e){
		    
		       //thisCategory = e.value + '!'
		    });
		
		
		
	})
	/* $(document).on("click", ".paymentBtn", function(){
    $('input', $('.categoryList')).each(function(i, e){
    
       //thisCategory = e.value + '!'
    });
    $(this).click(function() {
    let thisCategory = $(this).parent().find('input').val() + '!'
    alert(thisCategory);
    var diaryUserId = document.getElementById("diaryUserId").value;
    location.href="category.delete?thisCategory=" + thisCategory + "&diaryUserId=" + diaryUserId;
    });      
    
    
 alert("asd");
    
 }); */ 
 
 
 
 
 
});


</script>
<style type="text/css">

div.minimalistBlack {
  border: 3px solid red;
  width: 100%;
  text-align: left;
  border-collapse: collapse;
}
.divTable.minimalistBlack .divTableCell, .divTable.minimalistBlack .divTableHead {
  border: 1px solid #000000;
  padding: 5px 4px;
}
.divTable.minimalistBlack .divTableBody .divTableCell {
  font-size: 13px;
}
.divTable.minimalistBlack .divTableHeading {
  background: #CFCFCF;
  background: -moz-linear-gradient(top, #dbdbdb 0%, #d3d3d3 66%, #CFCFCF 100%);
  background: -webkit-linear-gradient(top, #dbdbdb 0%, #d3d3d3 66%, #CFCFCF 100%);
  background: linear-gradient(to bottom, #dbdbdb 0%, #d3d3d3 66%, #CFCFCF 100%);
  border-bottom: 3px solid #000000;
}
.divTable.minimalistBlack .divTableHeading .divTableHead {
  font-size: 15px;
  font-weight: bold;
  color: #000000;
  text-align: center;
}

/* DivTable.com */
.divTable{ display: table; }
.divTableRow { display: table-row; }
.divTableHeading { display: table-header-group;}
.divTableCell, .divTableHead { display: table-cell;}
.divTableHeading { display: table-header-group;}
.divTableFoot { display: table-footer-group;}
.divTableBody { display: table-row-group;}



</style>
</head>
<body>

<h1>장바구니</h1>
<div style="margin: 50px;">

<div style=" margin-top: 20px;border: 3px solid #000000;">
      	<div>상품 정보</div>
      </div>
      
      <div class="divTable minimalistBlack">
      	<div class="divTableHeading">
    		<div class="divTableRow">
    		<div class="divTableHead" style="width: 110px"><input type='checkbox' name='cart' onclick='selectAll(this)'/>Select All</div>
    		<div class="divTableHead">Product</div>
    		<div class="divTableHead">Product Info</div>
    		<div class="divTableHead">수량</div>
    		<div class="divTableHead">배송비</div>
    		<div class="divTableHead">주문금액</div>
    		</div>
  		</div>
  		
<c:forEach items="${Product }" var="p">
  		<div class="divTableBody">
    		<div class="divTableRow">
      			<div class="divTableCell"><input name='cart' type="checkbox"></div>
      			<div class="divTableCell"style="width: 100px"><img src="resources/t2_yj_files/${p.productThumbnail }" style="height: 100px;width:100px"></div>
      			<div class="divTableCell">${p.productPrice }원</div>
      			<div class="divTableCell">${p.cart_ProductQuantity }개</div>
      			<div class="divTableCell">2500원</div>
      			<div class="divTableCell"><span id="totalPrice">${p.productPrice * p.cart_ProductQuantity + 2500}</span>원</div>
      		</div>
  		</div>
  		
      			
</c:forEach>
      		</div>
      		 <div style="background-color: blue"><button class="paymentBtn">결재하기</button></div>

</div>




</body>
</html>