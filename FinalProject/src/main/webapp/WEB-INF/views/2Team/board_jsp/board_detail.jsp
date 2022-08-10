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

<input id="memberID" type="hidden" value="${sessionScope.loginMember.member_ID}">	
<input id="boardNum" type="hidden" value="${p.board_num}">		
	
	
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
	  
	  <div class="float-right">
	        <button class="btn btn-warning modBtn"
        			onclick="location.href='post.updatePage?board_num=${p.board_num}&board_category=${p.board_category}'">
        			<i class="fa fa-edit"></i>수정
        	</button>
    	   
    	    <button class="btn btn-danger delBtn"
    	 			onclick="location.href='post.delete?board_num=${p.board_num}&board_category=${p.board_category}'">
    	 			<i class="fa fa-trash"></i>삭제
    	 	</button>
	  
	  </div>
	  
	  
    </div>
    </div>

</div>



<div class="container" style="margin-top: 50px; margin-bottom: 50px;">
  
    <div class="row">
      <div class="col-sm-8">
        <input id="commentTXT" class="form-control input-sm" type="text" placeholder="댓글 입력...">
      </div>
      
      <div class="col-sm-1">
      <button type="button" id="commentBtn" class="btn btn-primary btn-sm btn-block">
        	<i class="fa fa-save"></i> 작성
      </button>
      </div>
    
    </div>

</div>





</body>
</html>