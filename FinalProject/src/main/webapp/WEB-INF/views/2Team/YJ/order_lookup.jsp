<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='resources/t2_css/order_lookup.css' rel="stylesheet" type="text/css">
<script type="text/javascript">

function orderDelete(order_PK) {
	
	  if (!confirm("注文履歴から削除されます。")) {
        alert("キャンセルしました。");
    } else {
        alert("削除されました。");
        location.href='deleteMy_order?Order_PK=' + order_PK;
    }
	
}


</script>
</head>
<body>
<div style="margin: 50px;">
	<header id="site-header">
		<div class="Txt">
			<h1>注文状態</h1>
		</div>
	</header>

<c:if test="${empty orders}">

	<div class="empty_txt" >
		<div class="emptyTxt">
			注文履歴がありません。
		</div>
		<div class="go_back">
			<a href="team2Main">メインに戻る</a>
		</div>
	</div>

</c:if>
	<div class="container-fluid">
    <div class="row">
    	<c:forEach var="o" items="${orders}">
        	<div class="col-md-3">
        	<form action="UpdateDeliverState">
        		<div class="thumbnail">
                <div class="caption">
                	<p>注文ID : ${o.order_User_ID }</p>
                	<select name="Order_DeliverState" id="">
    				<option value="${o.order_DeliverState}">${o.order_DeliverState}</option>
    				<option value="出荷完了">出荷完了</option>
    				<option value="入荷中">入荷中</option>
    				<option value="配送準備中">配送準備中</option>
    				<option value="配達完了">配達完了</option>
					</select>
                	<p>注文状態 : ${o.order_DeliverState}</p>
                	<p>お支払い状況 : ${o.order_PaymentState}</p>
                	<p>総価格 : <fmt:formatNumber pattern="#,###" value="${o.order_TotalPrice}"/>원</p>
                	<p>注文日 : <fmt:formatDate type="date" dateStyle="medium" value="${o.order_Date}"/></p>
                	<input type="hidden" name="Order_PK" value="${o.order_PK}">
                	<input type="hidden" name="nowPage" value="1">
                	<input type="hidden" name="cntPerPage" value="8">
                	<button class="comfirmBtn">登録</button>
                	<button type="button" class="comfirmBtn" onclick="orderDelete('${o.order_PK}')">削除</button>
                </div>
            </div>
            </form>
           </div>
         </c:forEach>
     </div>
    </div>
    </div>
     
	<div style="text-align: center; margin-top: 15px; font-size: 10pt;">
        <c:if test="${PagingDTO.startPage != 1 }">
            <a href="orderInquiry.go?nowPage=${PagingDTO.startPage - 1}&cntPerPage=${PagingDTO.cntPerPage }">&lt;</a>
        </c:if>
        <c:forEach begin="${PagingDTO.startPage }" end="${PagingDTO.endPage }" var="p">
            <c:choose>
                <c:when test="${p == PagingDTO.nowPage }">
                    <b>${p }</b>
                </c:when>
                <c:when test="${p != PagingDTO.nowPage }">
                    <a href="orderInquiry.go?nowPage=${p }&cntPerPage=${PagingDTO.cntPerPage }">${p }</a>
                </c:when>
            </c:choose>
        </c:forEach>
        <c:if test="${PagingDTO.endPage != PagingDTO.lastPage }">
            <a href="orderInquiry.go?nowPage=${PagingDTO.endPage + 1}&cntPerPage=${PagingDTO.cntPerPage }">&gt;</a>
        </c:if>
    </div>		

</div>	
	
	
        
	

</body>
</html>