<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="myPetPage-OutLine">
<h1>펫 정보</h1><br>
<c:choose>
<c:when test="${petInfo.baby_name != null }">

<img src="resources/t2_sj_petFiles/${petInfo.baby_img }" class="myPetPage-img"> <br><br>

<table  class="myPetPage-table">

<tr>
<td>이름</td>
<td>${petInfo.baby_name }</td>
</tr>

<tr>
<td>생일</td>
<td>${petInfo.baby_birth }</td>
</tr>

<tr>
<td>성별</td>
<td>${petInfo.baby_sex }</td>
</tr>

<tr>
<td>종류</td>
<td>${petInfo.baby_type }</td>
</tr>

<tr>
<td>품종</td>
<td>${petInfo.baby_typeDetail }</td>
</tr>

<tr>
<td>중성화</td>
<td>${petInfo.baby_neut }</td>
</tr>

</table>


<button onclick="location.href='petInfoChange.go'">펫 수정하기</button> &nbsp;&nbsp;

<button onclick="location.href='petInfoDelete'">펫 삭제하기</button> &nbsp;&nbsp;

<input type="button" onclick="history.back()" value="뒤로가기">


</c:when>
<c:otherwise>
<span class="myPetPage-txt">펫이 아직 등록되어 있지 않습니다. </span><br>
<span class="myPetPage-txt">펫등록을 하시겠습니까?</span> <br><br>

<a href="petRegistration" class="myPetPage-txt2">등록하러 가기</a>
</c:otherwise>
</c:choose>
</div>
</body>
</html>