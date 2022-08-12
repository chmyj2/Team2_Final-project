<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    		<div class="divTableHead">수령자 정보</div>
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