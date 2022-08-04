<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>board</h1>
${r}
<table>
<tr>
  <td>pk</td>  <td>title</td>
</tr>

<c:forEach var="b" items="${posts}">
<tr>
  <td>${b.board_num}</td>  <td>${b.board_title}</td>
</tr>
</c:forEach>

</table>


</body>
</html>