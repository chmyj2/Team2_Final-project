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

<div class="container" style="margin-top: 50px; margin-bottom: 50px">
    	
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수</th>
					<th>좋아요</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="b" items="${postList}">
					
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


</body>
</html>