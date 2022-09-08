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
	<div class="container-fluid" style="margin-top: 100px; text-align: center;font-size: 1.3em;">
     <div class="row">
      <c:forEach var="p" items="${Product}">
           <div class="col-md-3">
           <a href="detailPage.go?productNum=${p.productNum}"><div class="thumbnail" >
                <img src="resources/t2_yj_files/${p.productThumbnail }" style="height: 300px;width:300px">
                <div class="caption"  style="font-weight: 100;font-size: 130%;">
                  <p>${fn:length(p.productName)>20?fn:substring(p.productName,0,20)+="...":p.productName }</p>
                  <p><fmt:formatNumber value="${p.productPrice }" pattern="#,###" />원</p>
                </div>
            </div></a>
           </div>
         </c:forEach>
     </div>
    </div>
    
    
    <div style="text-align: center; margin-top: 15px; font-size: 10pt;">
        <c:if test="${PagingDTO.startPage != 1 }">
            <a href="viewAllProductPage.go?onExhibition=Y&nowPage=${PagingDTO.startPage - 1}&cntPerPage=${PagingDTO.cntPerPage }">&lt;</a>
        </c:if>
        <c:forEach begin="${PagingDTO.startPage }" end="${PagingDTO.endPage }" var="p">
            <c:choose>
                <c:when test="${p == PagingDTO.nowPage }">
                    <b>${p }</b>
                </c:when>
                <c:when test="${p != PagingDTO.nowPage }">
                    <a href="viewAllProductPage.go?onExhibition=Y&nowPage=${p }&cntPerPage=${PagingDTO.cntPerPage }">${p }</a>
                </c:when>
            </c:choose>
        </c:forEach>
        <c:if test="${PagingDTO.endPage != PagingDTO.lastPage }">
            <a href="viewAllProductPage.go?onExhibition=Y&nowPage=${PagingDTO.endPage + 1}&cntPerPage=${PagingDTO.cntPerPage }">&gt;</a>
        </c:if>
    </div>


</body>
</html>