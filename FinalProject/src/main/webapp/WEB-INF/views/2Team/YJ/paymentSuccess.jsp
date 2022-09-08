<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='resources/t2_css/paymentSuccess.css' rel="stylesheet" type="text/css">
<script type="text/javascript">
$(function() {
	
	window.open("openTeam1",'kakaoPay','width=400, height=600,left=1000,top=400');
	

});



function openTeam1() {
	
	location.href='team1Main';
	
}
	
</script>
</head>
<body>
	
	<div class="receipt">
	<div>
		<div class="text">구매해주셔서<br>&nbsp;감사합니다.</div>
	</div>
	<div id="dog_Class">
<div class="dog">
  <div class="dog-body">
    <div class="dog-tail">
      <div class="dog-tail">
        <div class="dog-tail">
          <div class="dog-tail">
            <div class="dog-tail">
              <div class="dog-tail">
                <div class="dog-tail">
                  <div class="dog-tail"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="dog-torso"></div>
  <div class="dog-head">
    <div class="dog-ears">
      <div class="dog-ear"></div>
      <div class="dog-ear"></div>
    </div>
    <div class="dog-eyes">
      <div class="dog-eye"></div>
      <div class="dog-eye"></div>
    </div>
    <div class="dog-muzzle">
      <div class="dog-tongue"></div>
    </div>
  </div>
</div>

<div class="ball" tabindex="0"></div>
</div>
  <div class="receipt-list">
    <div class="receipt-item">
      <div class="receipt-label">주문번호</div>
      <div class="receipt-value">${order.order_Num }</div>
    </div>
    <div class="receipt-item">
      <div class="receipt-label">주문 일자</div>
      <div class="receipt-value">${order.order_Date }</div>
    </div>
     <div class="receipt-item">
      <div class="receipt-label">
      <c:choose>
			<c:when test="${sessionScope.loginMember !=null }">
				<a onclick="location.href='lookUpOrder?Order_User_ID=${sessionScope.loginMember.member_ID }&nowPage=1&cntPerPage=4'">주문조회</a>
			</c:when>
			<c:otherwise>
				<a onclick="location.href='lookUpOrder?Order_User_ID=${sessionScope.loginMember_business.vet_ID }&nowPage=1&cntPerPage=4'">주문조회</a>
			</c:otherwise>
		</c:choose>
		</div>
      <div class="receipt-value"></div>
    </div>
    <div class="receipt-item">
      <div class="receipt-label"><a href="team2Main">홈으로</a></div>
    </div>
    <div class="receipt-item">
      <div class="receipt-label"><a href="viewAllProductPage.go?onExhibition=Y&nowPage=1&cntPerPage=16">이어서 쇼핑하기</a></div>
    </div>
  </div>
</div>



	

</body>
</html>