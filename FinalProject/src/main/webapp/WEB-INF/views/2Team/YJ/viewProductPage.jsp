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
<%-- <c:if test="${sessionScope.accountInfo.user_id eq 'ADMIN' }">
		<div><button onclick="location.href='regProductPage'">운영자전용 상품등록버튼</button></div>
	</c:if> --%>

<button onclick="location.href='regProductPage.go'">운영자전용 상품등록버튼</button>${result }

 <div class="container-fluid">
     <div class="row">
      <c:forEach var="p" items="${Product}">
           <div class="col-md-3">
           <a href="detail.go?productNum=${p.productNum}"><div class="thumbnail">
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

</body>
</html>