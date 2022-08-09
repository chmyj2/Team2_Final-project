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
	<h1>board</h1>


	<div class="container">
		<div>
			<a href='team2.createPostPage?board_category=${param.board_category}' class="btn btn-success">글쓰기</a>
		</div>
		
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="b" items="${posts}">
					
					<tr onclick="location.href='post.detail?board_num=${b.board_num}'">
						<td>${b.board_num}</td>
						<td>${b.board_title}</td>
						<td>${b.board_member_id}</td>
						<td><fmt:formatDate value="${b.board_date}" pattern="yyyy-MM-dd HH:mm"/></td>
						<td>${b.board_count}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


		<nav aria-label="...">
			<ul class="pagination pagination-sm">
				<!-- <li class="page-item active" aria-current="page"> <span class="page-link">1</span> </li> -->
			<c:forEach var="i" begin="1" end="${r}">
				<li class="page-item"> <a class="page-link" href="team2.boardlist?board_category=${param.board_category}&vpage=${i}">${i}</a> </li>
			</c:forEach>
			</ul>
		</nav>
	</div>


</body>
</html>