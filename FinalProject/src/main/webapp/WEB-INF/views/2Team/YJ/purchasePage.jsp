<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
      $(function(){
        $('#sameAddressControl').click(function(){
          var same = this.checked;
          $('#billAddress').val(same ? $('#shipAddress').text():'');
          $('#billCity').val(same ? $('#shipCity').text():'');
          $('#billState').val(same ? $('#shipState').text():'');
          $('#billZip').val(same ? $('#shipZip').val():'');
          if(same == true){
          		$('#billingAddress input').filter('input:text')
    	  		.attr('readonly',true)
     	 		.css('opacity', 0.5);
     		 }else{
     		   $('#billingAddress input').filter('input:text').attr('readonly',false)
     	 		.css('opacity', 1);
     		 }
        });
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

<h1>구매페이지</h1>


<c:choose>
	<c:when test="${sessionScope.loginMember !=null }">
<fieldset>
<div style="margin: 50px;">
      <form name="testForm">
      <div style=" margin-bottom: 20px;border: 3px solid #000000;">
      	<div>Order / Payment</div>
      </div>
      <div style=" margin-top: 20px;border: 3px solid #000000;">
      	<div>회원 정보</div>
      </div>
      <div class="divTable minimalistBlack" id="shippingAddress">
      	<div class="divTableHeading">
    		<div class="divTableRow">
    		<div class="divTableHead">Recipient Info</div>
    		<div class="divTableHead">주문자 정보</div>
    		</div>
  		</div>
  		<div class="divTableBody">
    		<div class="divTableRow">
      			<div class="divTableCell">주문자</div>
      			<div class="divTableCell"><span name="shipAddress" id="shipAddress">${sessionScope.loginMember.member_ID }님</span></div>
      		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">휴대전화</div>
      			<div class="divTableCell"><span name="shipCity" id="shipCity">${sessionScope.loginMember.member_phoneNum }</span></div>
    		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">주소</div>
      			<div class="divTableCell"><span name="shipState" id="shipState">${sessionScope.loginMember.member_address }</span></div>
    		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">배송 시 메모</div>
      			<div class="divTableCell"> <input type="text" name="shipZip" id="shipZip"/></div>
    		</div>
  	</div>
	</div>
	
	
	<div style=" margin-top: 20px;border: 3px solid #000000;">
      	<div>배송 정보
      	<input type="checkbox" id="sameAddressControl"/>회원정보와 동일합니다.</div>
      </div>
      <div class="divTable minimalistBlack" id="billingAddress">
      
      	<div class="divTableHeading">
    		<div class="divTableRow">
    		<div class="divTableHead">Orderer Info</div>
    		<div class="divTableHead">주문자 정보</div>
    		</div>
  		</div>
  		<div class="divTableBody">
    		<div class="divTableRow">
      			<div class="divTableCell">수령인</div>
      			<div class="divTableCell"><input type="text" name="billAddress"
                     id="billAddress"/></div>
      		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">휴대전화</div>
      			<div class="divTableCell"><input type="text" name="billCity" id="billCity"/></div>
    		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">배송지 주소</div>
      			<div class="divTableCell"><input type="text" name="billState" id="billState"/></div>
    		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">배송 시 메모</div>
      			<div class="divTableCell"><input type="text" name="billZip" id="billZip"/></div>
    		</div>
    	
  	</div>
  	
  	</div>
	
	
	
	
      
      <div style=" margin-top: 20px;border: 3px solid #000000;">
      	<div>상품 정보</div>
      </div>
      
      <div class="divTable minimalistBlack">
      	<div class="divTableHeading">
    		<div class="divTableRow">
    		<div class="divTableHead">Product</div>
    		<div class="divTableHead">Product Info</div>
    		<div class="divTableHead">수량</div>
    		<div class="divTableHead">배송비</div>
    		<div class="divTableHead">주문금액</div>
    		</div>
  		</div>
  		<div class="divTableBody">
    		<div class="divTableRow">
      			<div class="divTableCell"style="width: 100px"><img src="resources/t2_yj_files/${Product.productThumbnail }" style="height: 100px;width:100px"></div>
      			<div class="divTableCell">${Product.productPrice }원</div>
      			<div class="divTableCell">${quanId }개</div>
      			<div class="divTableCell">2500원</div>
      			<div class="divTableCell"><span>${Product.productPrice * quanId + 2500}원</span></div>
      		</div>
  		</div>
  		
	</div>
      <div style="background-color: blue"><button>결재하기</button></div>
      </form>
</div>
</fieldset>
	</c:when>
	<c:when test="${sessionScope.loginMember_business !=null }">
      <%-- <span class="loginOK-dropbtn">${sessionScope.loginMember_business.vet_ID }님</span>
      <span class="loginOK-dropbtn">${sessionScope.loginMember_business.vet_address }님</span>
      <span class="loginOK-dropbtn">${sessionScope.loginMember_business.vet_phoneNum }님</span> --%>
      
      <div style="margin: 50px;">

      <%-- <span>${sessionScope.loginMember.member_ID }님</span>
      <span>${sessionScope.loginMember.member_name }님</span>
      <span>${sessionScope.loginMember.member_phoneNum }님</span>
      <span>${sessionScope.loginMember.member_address }님</span>
      <span>${sessionScope.loginMember.member_email }님</span> --%>


<div style="margin: 50px;">
      
      <div style=" margin-bottom: 20px;border: 3px solid #000000;">
      	<div>Order / Payment</div>
      </div>
      <div style=" margin-top: 20px;border: 3px solid #000000;">
      	<div>배송지 정보</div>
      </div>
      <div class="divTable minimalistBlack">
      	<div class="divTableHeading">
    		<div class="divTableRow">
    		<div class="divTableHead">Recipient Info</div>
    		<div class="divTableHead">주문자 정보</div>
    		</div>
  		</div>
  		<div class="divTableBody">
    		<div class="divTableRow">
      			<div class="divTableCell">주문자</div>
      			<div class="divTableCell">${sessionScope.loginMember_business.vet_ID }님</div>
      		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">휴대전화</div>
      			<div class="divTableCell">${sessionScope.loginMember_business.vet_phoneNum }</div>
    		</div>
  	</div>
	</div>
	
	
	<div style=" margin-top: 20px;border: 3px solid #000000;">
      	<div>배송 정보</div>
      </div>
      <div class="divTable minimalistBlack">
      	<div class="divTableHeading">
    		<div class="divTableRow">
    		<div class="divTableHead">Orderer Info</div>
    		<div class="divTableHead">주문자 정보</div>
    		</div>
  		</div>
  		<div class="divTableBody">
    		<div class="divTableRow">
      			<div class="divTableCell">수령인</div>
      			<div class="divTableCell">${sessionScope.loginMember.member_ID }님</div>
      		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">휴대전화</div>
      			<div class="divTableCell">${sessionScope.loginMember.member_phoneNum }</div>
    		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">배송지 주소</div>
      			<div class="divTableCell">${sessionScope.loginMember.member_address }</div>
    		</div>
    		<div class="divTableRow">
      			<div class="divTableCell">배송 메모</div>
      			<div class="divTableCell"><input placeholder="배송 시 요청사항을 입력해주세요" style="width: 100%"></div>
    		</div>
  	</div>
	</div>
	
	
	
	<div style="border: 3px solid blue;">
    	<div><button>정보 수정</button> </div>
    </div>
      
      <div style=" margin-top: 20px;border: 3px solid #000000;">
      	<div>상품 정보</div>
      </div>
      
      <div class="divTable minimalistBlack">
      	<div class="divTableHeading">
    		<div class="divTableRow">
    		<div class="divTableHead">Product</div>
    		<div class="divTableHead">Product Info</div>
    		<div class="divTableHead">수량</div>
    		<div class="divTableHead">배송비</div>
    		<div class="divTableHead">주문금액</div>
    		</div>
  		</div>
  		<div class="divTableBody">
    		<div class="divTableRow">
      			<div class="divTableCell"style="width: 100px"><img src="resources/t2_yj_files/${Product.productThumbnail }" style="height: 100px;width:100px"></div>
      			<div class="divTableCell">${Product.productPrice }원</div>
      			<div class="divTableCell">${quanId }개</div>
      			<div class="divTableCell">2500원</div>
      			<div class="divTableCell"><span>${Product.productPrice * quanId + 2500}원</span></div>
      		</div>
  		</div>
  		
  		
      			<div class="divTableCell">${sessionScope.loginMember.member_ID }님</div>
      			<div class="divTableCell">${sessionScope.loginMember.member_ID }님</div>
      			<div class="divTableCell">${sessionScope.loginMember.member_ID }님</div>
      			<div class="divTableCell">${sessionScope.loginMember.member_ID }님</div>
      		</div>
  		</div>
  		
	</div>
      
      
</div>
      
      

	</c:when>
	<c:otherwise>
      <span class="loginOK-dropbtn">${sessionScope.loginMember_business.vet_ID }님</span>
      <span class="loginOK-dropbtn">${sessionScope.loginMember_business.vet_address }님</span>
      <span class="loginOK-dropbtn">${sessionScope.loginMember_business.vet_phoneNum }님</span>
	</c:otherwise>
</c:choose>





</body>
</html>