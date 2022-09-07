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
<body>
    
	<div class="container">
    	
    	<div class="row">
    	<form action="team2.boardlist">
    		<div style="text-align: center;">
    			<input type="text" id="searchInput" name="search" placeholder="Search for title..">
    			<input type="hidden" name="board_category" value="${param.board_category}">
    			<button id="searchBtn" class="btn btn-success btn-sm">완료</button>
    		</div>
    		
    	</form>
		</div>
		
		<div>
			<a id="writeBtn" href='team2.createPostPage?board_category=${param.board_category}' class="btn btn-success writeBtn" style="float: right;">글쓰기</a>
		</div>
		
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th><a href="team2.boardlist?board_category=${param.board_category}&sort=0">날짜</a></th>
					<th><a href="team2.boardlist?board_category=${param.board_category}&sort=1">조회수</a></th>
					<th><a href="team2.boardlist?board_category=${param.board_category}&sort=2">좋아요</a></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="b" items="${posts}">
					
					<tr onclick="location.href='post.detail?board_num=${b.board_num}'">
						<td>${b.board_num}</td>
						<td style="width: 40%;">${b.board_title}</td>
						<td>${b.board_member_id}</td>
						<td><fmt:formatDate value="${b.board_date}" pattern="yy-MM-dd HH:mm"/></td>
						<td>${b.board_count}</td>
						<td>${b.board_like}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr>
		
	</div>
	
			<ul class="pagination pagination-sm" style="padding-left: 40%;padding-bottom: 20px;">
				<!-- <li class="page-item active" aria-current="page"> <span class="page-link">1</span> </li> -->
			<c:forEach var="i" begin="1" end="${r}">
				<li class="page-item"><a class="page-link" href="team2.boardlist?board_category=${param.board_category}&vpage=${i}&search=${search}&sort=${sort}">${i}</a> </li>
			</c:forEach>
			</ul>

      
      <input id="loginCheckId" type="hidden" value="${sessionScope.loginMember.member_ID}">
      
</body>
</html>