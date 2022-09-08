<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='resources/t2_css/order_lookup.css' rel="stylesheet" type="text/css">
<script type="text/javascript">

function orderDelete(order_PK,ID) {
	
	  if (!confirm("배송 완료 건은 주문 조회에서 삭제됩니다.")) {
          alert("취소를 누르셨습니다.");
      } else {
          alert("삭제되었습니다.");
          location.href='deleteMy_order?Order_PK=' + order_PK + '&Order_User_ID='+ ID + '&nowPage=1&cntPerPage=8';
      }
	
}


</script>
</head>
<body>
<div style="margin: 50px;">
	<header id="site-header">
		<div class="Txt">
			<h1>주문 조회</h1>
		</div>
	</header>


<c:if test="${empty orders}">
	<div class="empty_txt" >
		<div class="emptyTxt">
			주문 내역이 없습니다.
		</div>
		<div class="go_back">
			<a href="team2Main">메인으로 돌아가기</a>
		</div>
	</div>
</c:if>



<div style="display:flex; margin-top: 50px;">
	<div class="thumbnailDiv">
		<c:forEach items="${orders }" var="o">
		<c:forTokens var="thumbnail" items="${o.thumbnail }" delims="!">
				<div class="">
					<img src="resources/t2_yj_files/${thumbnail }" class="thumbnailImg">
				</div>
		</c:forTokens>
		</c:forEach>
	</div>	
	<div>
		<c:forEach items="${orders }" var="o">
		<c:forTokens var="price" items="${o.product_Price }" delims="!">
			<div class="orderInfo">
				<div>
					<span class="orderDate">상품 주문일 : ${o.order_Date }</span><br>
					<span class="orderDate">주문 상태 : ${o.order_DeliverState }</span><br>
					<span class="orderDate">상품 가격 : ${price }</span><br>
				</div>
			</div>
		</c:forTokens>
		</c:forEach>
	</div>	
	<div>
		<c:forEach items="${orders }" var="o">
		<c:forTokens var="Order_ProductNum" items="${o.order_ProductNum }" delims="!">
			<div style="display: flex;">
				<div class="orderInfo">	
				<div class="deliveyrDiv">
					<c:choose>
					<c:when test="${sessionScope.loginMember !=null }">
        			<span><button class="deliveyrCompleted" onclick="orderDelete('${o.order_PK }','${sessionScope.loginMember.member_ID }')">배송 완료</button></span>
					</c:when>
					<c:otherwise>
        			<span ><button class="deliveyrCompleted" onclick="orderDelete('${o.order_PK }','${sessionScope.loginMember_business.vet_ID }')">배송 완료</button></span>
					</c:otherwise>
					</c:choose>
					</div>
				</div>
			</div>
		</c:forTokens>
		</c:forEach>
	</div>
</div>




<div style="text-align: center; margin-top: 15px; font-size: 10pt;">
        <c:if test="${PagingDTO.startPage != 1 }">
            <a href="lookUpOrder?Order_User_ID=${sessionScope.loginMember.member_ID }&nowPage=${PagingDTO.startPage - 1}&cntPerPage=${PagingDTO.cntPerPage }">&lt;</a>
        </c:if>
        <c:forEach begin="${PagingDTO.startPage }" end="${PagingDTO.endPage }" var="p">
            <c:choose>
                <c:when test="${p == PagingDTO.nowPage }">
                    <b>${p }</b>
                </c:when>
                <c:when test="${p != PagingDTO.nowPage }">
                    <a href="lookUpOrder?Order_User_ID=${sessionScope.loginMember.member_ID }&nowPage=${p }&cntPerPage=${PagingDTO.cntPerPage }">${p }</a>
                </c:when>
            </c:choose>
        </c:forEach>
        <c:if test="${PagingDTO.endPage != PagingDTO.lastPage }">
            <a href="lookUpOrder?Order_User_ID=${sessionScope.loginMember.member_ID }&nowPage=${PagingDTO.endPage + 1}&cntPerPage=${PagingDTO.cntPerPage }">&gt;</a>
        </c:if>
    </div>
</div>


</body>
</html>