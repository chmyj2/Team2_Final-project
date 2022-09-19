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
</head>
<body>
    <div class="order_info_wrap">
    
    <h1>주문내역</h1>
    
            <article id="item-1" class="menu__item item-active">
    
                <div class="container-fluid">
                    <div class="row">
                        <c:forEach var="o" items="${orders}">
                            <div class="col-md-3">
                                <a href="get.aProductTeam1?product_num=${o.order_ProductNum}"><div
                                        class="thumbnail">
                                        <img src="resources/reviewFile/${o.order_thumbnail }"
                                            style="height: 300px; width: 300px">
                                        <div class="caption">
                                            <p>주문일: ${o.order_Date}</p>
                                            <p>진행상태: ${o.order_PaymentState}</p>
                                            <p>
                                                상품가격:
                                                <fmt:formatNumber value="${o.order_TotalPrice }"
                                                    pattern="#,###" />
                                                원
                                            </p>
                                        </div>
                                    </div> </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </article>
    
    
        </div>
    <%-- <c:forEach items="${orders}" var="o">
        <h1>${o.order_Num }</h1>
    </c:forEach>
     --%>
    </body>
</html>