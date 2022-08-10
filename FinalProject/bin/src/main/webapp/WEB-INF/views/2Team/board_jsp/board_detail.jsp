<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="likeCheck(${p.board_num},'${sessionScope.loginMember.member_ID}')">
	
<div class="container" style="margin-top: 50px">
  
  <div class="row">
   
    <div class="col">
     <span style="font-size: 30px;">title: ${p.board_title}</span>
    	<p class="text-right">
    		<fmt:formatDate value="${p.board_date}" pattern="yyyy-MM-dd HH:mm"/>  
    		 &nbsp;&nbsp; 조회수:${p.board_count}
    	</p>
     <hr>
    </div>
  
  
    <div class="col">
      ${p.board_txt}
      <br>
	  <button 
	  onclick="getBoardLike(${p.board_num},'${sessionScope.loginMember.member_ID }')"
	  id="like_btn" type="button" class="btn btn-default btn-sm center-block">${p.board_like} 좋아요
	  </button>      
	  <hr>
    </div>
        
        <button class="btn btn-primary"
        	onclick="location.href='post.updatePage?board_num=${p.board_num}&board_category=${p.board_category}'">수정</button>
    	<button class="btn btn-primary"
    	 	onclick="location.href='post.delete?board_num=${p.board_num}&board_category=${p.board_category}'">삭제</button>
    	 
    </div>

</div>

</body>
</html>