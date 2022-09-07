<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="reserve-lookup-div">
        <div class="reserve-lookup-menutab-div">
         <section class="reserve-lookup-section">
              <div class="reserve-div-inner">
                  <div class="reserve-lookup-info-place-1">
                      <ul class="reserve-lookup-info-list1">
            
                              <span class="reserve-lookup-info-list-title">동물병원</span>
                    
                          </ul>
                  </div>
                  <div class="reserve-lookup-info-place-2">
                      <ul class="reserve-lookup-info-list2">
            
                            <span class="reserve-lookup-info-list-title">예약일시</span>				  				
                         		  				
                        					  			
                         			  			
                      </ul>
                  </div>
                  <div class="reserve-lookup-info-place-3">
                      <ul class="reserve-lookup-info-list3">
            
                            <span class="reserve-lookup-info-list-title">동물이름/생년월일</span>				  				
                         		  				
                        					  			
                         			  			
                      </ul>
                  </div>
                  <div class="reserve-lookup-info-place-4">
                      <ul class="reserve-lookup-info-list4">
            
                            <span class="reserve-lookup-info-list-title">예약신청일</span>				  				
                         		  				
                        					  			
                         			  			
                      </ul>
                  </div>
                  <div class="reserve-lookup-info-place-5">
                      <ul class="reserve-lookup-info-list5">
            
                            <span class="reserve-lookup-info-list-title">문의</span>				  				
                         		  				
                        					  			
                         			  			
                      </ul>
                  </div>
                  <div class="reserve-lookup-info-place-6">
                      <ul class="reserve-lookup-info-list6">
            
                            <span class="reserve-lookup-info-list-title">취소</span>				  				
                         		  				
                        					  			
                         			  			
                      </ul>
                  </div>
               </div>
     
         </section>
         <div>
         <c:forEach items="${reserveView}" var="r">
        		<div class=""> 
        			<span> ${r.reserve_hospitalName}</span> 
        		</div>
        		<div>
        			<span>${r.reserve_date }</span>
        		</div>
        		<div>
        			<span>${r.reserve_petName}</span> 
        		</div>
        		<div> 
        			<span>${r.reserve_petBirth}</span>
        		</div>
        		<div > 
        			<span><fmt:formatDate type="date" dateStyle="medium" value="${r.reserve_writing_date}"/></span>
        		</div>
        </c:forEach>
        </div>   
        </div>
        
        
     
		
	</div>

</body>
</html>