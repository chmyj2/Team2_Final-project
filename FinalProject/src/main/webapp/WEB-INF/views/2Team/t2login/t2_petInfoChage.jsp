<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="petInfoChange-outline">
		<h1>수정하기</h1>
		<img src="resources/t2_sj_petFiles/${petInfo.baby_img }"
			class="myPetPage-img" id="image"><br>
		<br> <input type="file" name="baby_img"
			value="${petInfo.baby_img }" id="baby_img">

		<table class="myPetPage-table">

			<tr>
				<td>이름</td>
				<td><input name="baby_name" value="${petInfo.baby_name }"
					style="width: 100px;"></td>
			</tr>

			<tr>
				<td>생일</td>
				<td><input type="date" name="baby_birth"
					value="${petInfo.baby_birth }"></td>
			</tr>

			<tr>
				<td>성별</td>
				<c:choose>
					<c:when test="${petInfo.baby_sex == 'm'}">

						<td><input type="radio" name="baby_sex" value="m"
							checked="checked">남아 &nbsp;&nbsp; <input type="radio"
							name="baby_sex" value="w">여아</td>

					</c:when>
					<c:otherwise>

						<td><input type="radio" name="baby_sex" value="m">남아
							&nbsp;&nbsp; <input type="radio" name="baby_sex" value="w"
							checked="checked">여아</td>

					</c:otherwise>
				</c:choose>
			</tr>

			<tr>
				<td>종류</td>
				<c:choose>
					<c:when test="${petInfo.baby_type == 'dog'}">

						<td>
						<input type="radio" name="baby_type" value="dog" checked="checked">강아지
						<input type="radio" name="baby_type" value="cat"> 고양이
						<input type="radio" name="baby_type" value="etc"> 그 외
						</td>

					</c:when>
					<c:when test="${petInfo.baby_type == 'cat' }">
						<td>
						<input type="radio" name="baby_type" value="dog" >강아지
						<input type="radio" name="baby_type" value="cat" checked="checked"> 고양이
						<input type="radio" name="baby_type" value="etc"> 그 외
						</td>
					</c:when>
					<c:otherwise>
						<td>
						<input type="radio" name="baby_type" value="dog">강아지
						<input type="radio" name="baby_type" value="cat"> 고양이
						<input type="radio" name="baby_type" value="etc" checked="checked"> 그 외
						</td>
					</c:otherwise>
				</c:choose>
			</tr>

			<tr>
				<td>품종</td>
				<td><input name="baby_typeDetail" value="${petInfo.baby_typeDetail }">
				</td>
			</tr>

			<tr>
				<td>중성화</td>
				<c:choose>
				<c:when test="${petInfo.baby_neut =='yes' }">
				<td>
				<input type="radio" name="baby_neut" value="yes" checked="checked">함
				<input type="radio" name="baby_neut" value="no">안함
				</td>
				</c:when>
				<c:otherwise>
				<td>
				<input type="radio" name="baby_neut" value="yes" >함
				<input type="radio" name="baby_neut" value="no" checked="checked">안함
				</td>
				</c:otherwise>
				</c:choose>
				
			</tr>

		</table>


		<button onclick="location.href='#'">저장하기</button>
		&nbsp;&nbsp; <input type="button" onclick="history.back()"
			value="뒤로가기">
	</div>
</body>
<script type="text/javascript">
	document.getElementById("baby_img").onchange = function() {
		var reader = new FileReader();

		reader.onload = function(e) {
			// get loaded data and render thumbnail.

			document.getElementById("image").src = e.target.result;
		};

		// read the image file as a data URL.
		reader.readAsDataURL(this.files[0]);
	};
</script>
</html>