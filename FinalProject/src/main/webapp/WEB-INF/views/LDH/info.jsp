<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

$(function() {
	
	$("#file").on('change',function() {
 	 var fileName = $("#file").val();
  	$(".upload-name").val(fileName);
	});
	
});

</script>
</head>
<body>

<div class="join_wrapper">

        <form action="member.update" method="post" enctype="multipart/form-data"
         name="updateMemberForm" onsubmit="return updateMemberCheck();">
            
            <div id="updateTable">
            	<h2 id="joinTableTitle">회원정보 수정</h2>
            	
            		<!-- id -->
                    <input readonly="readonly" value="${sessionScope.loginMember.member_ID }" name="jm_id" id="updateMemberIDInput">
                	<br>
                	
                	<c:choose>
                	<c:when test="${sessionScope.loginMember.member_linkWhere == 1 }">
                	<!-- pw  -->
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
                    <input class="join_input_pw" value="${sessionScope.loginMember.member_PW }" name="jm_pw" placeholder="Password *" type="password" maxlength="10" autocomplete="off" >
=======
                    <input class="join_input_pw" value="${sessionScope.loginMember.member_PW }" name="jm_pw" placeholder="Password *" type="password" maxlength="10" autocomplete="off">
                   <!--  <img src="resources/img/update.png"> -->
>>>>>>> 78da7b1 (2022/08/11 커밋)
=======
                    <input class="join_input_pw" value="${sessionScope.loginMember.member_PW }" name="jm_pw" placeholder="Password *" type="password" maxlength="10" autocomplete="off" >
>>>>>>> a456549 (아이디 기억, 로그인, 로그아웃, 회원정보 수정, 회원탈퇴 기능 구현)
=======
                    <input class="join_input_pw" value="${sessionScope.loginMember.member_PW }" name="jm_pw" placeholder="Password *" type="password" maxlength="10" autocomplete="off" >
>>>>>>> d3707ba24bffcf1b4bed1164e787137b007d297e
                	<p class="required_txt">* 숫자 하나 이상</p>
                	
                	<!-- pw 재확인 -->
                    <input class="input_pw" value="${sessionScope.loginMember.member_PW }" name="jm_pwChk" placeholder="Password Check *" type="password" maxlength="10" autocomplete="off">
                	<br>
                </c:when>
                
                <c:otherwise>
                    <input class="join_input_pw" value=" " name="jm_pw" placeholder="Password *" type="hidden" maxlength="10" autocomplete="off" >
                
                </c:otherwise>
                
                
                
               	</c:choose>
               	
               	
                	<!-- 이름  -->
                    <input class="input_name" value="${sessionScope.loginMember.member_name }" name="jm_name" placeholder="Name *" maxlength="10" autocomplete="off">
<<<<<<< HEAD
                	<br>

                	<!-- phoneNum -->
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
                    <input class="join-cellphoneNo" value="${sessionScope.loginMember.member_phoneNum }" name="jm_pNum" placeholder="Phone Number *" type="text" maxlength="10" autocomplete="off">
<<<<<<< HEAD
=======
>>>>>>> 78da7b1 (2022/08/11 커밋)
=======
                    <input class="join-cellphoneNo" value="${sessionScope.loginMember.member_phoneNum }" name="jm_pNum"  placeholder="Phone Number *" type="text" maxlength="13" autocomplete="off">
>>>>>>> c2b1de990a62ea9d1caea6945342771736319d52
=======
                    <input class="join-cellphoneNo" value="${sessionScope.loginMember.member_phoneNum }" name="jm_pNum" id="telInput" placeholder="Phone Number *" type="text" maxlength="13" autocomplete="off">
>>>>>>> af8b8efb1348f40938db88e9ce6fd586a2641319
=======
                    <input class="join-cellphoneNo" value="${sessionScope.loginMember.member_phoneNum }" name="jm_pNum"  placeholder="Phone Number *" type="text" maxlength="13" autocomplete="off">

>>>>>>> 0ef69b535f9131587775c5625a7cb3593b170c47
                	<br>

<<<<<<< HEAD
                	<!-- phoneNum -->
                    <input class="join-cellphoneNo" value="${sessionScope.loginMember.member_phoneNum }" name="jm_pNum" placeholder="Phone Number *" type="text" maxlength="10" autocomplete="off">
=======
>>>>>>> d3707ba24bffcf1b4bed1164e787137b007d297e
                	<br>
=======
>>>>>>> 3c7aac14b5df00e1e791e78734e602f2e19acd20
                	
                	<!-- 주소  -->
                        <input class="input_addr1" id="jm_addr3Input" readonly="readonly" value="${addr[2] }"  name="jm_addr3" maxlength="5" autocomplete="off" placeholder="우편번호">
                        <span class="search_addr" id="addrSearchBtn">검색</span>
                        <br>
                        <input class="input_addr" id="jm_addr1Input" readonly="readonly" value="${addr[0] }"  name="jm_addr1" maxlength="30" autocomplete="off" placeholder="주소"><br>
                        <input class="input_addr" value="${addr[1] }"  name="jm_addr2" maxlength="30" autocomplete="off" placeholder="상세주소">
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
                           <br>
                           
=======
                
>>>>>>> 78da7b1 (2022/08/11 커밋)
=======
                           <br>
                           
>>>>>>> a456549 (아이디 기억, 로그인, 로그아웃, 회원정보 수정, 회원탈퇴 기능 구현)
=======
                           <br>
                           
>>>>>>> d3707ba24bffcf1b4bed1164e787137b007d297e
                	<!-- email -->
                    <input class="input_email" value="${sessionScope.loginMember.member_email }" name="jm_email" placeholder="Email *" type="text" maxlength="10" autocomplete="off">
                	<br>
                	
                	
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
                	
=======
                	<%-- <!-- 프로필 사진 -->
                    <div class="join_my_photo">
                    <span>-프로필 사진 변경-</span> <br>
                        <img src="resources/files/${sessionScope.loginMember.m_photo }" id="updateMemberPhoto"><br>
                    	<!-- <input class="upload-name" value="첨부파일" placeholder="첨부파일"> -->
                    	<label for ="file">파일찾기</label>
                        <input name="jm_photo" type="file" id="file">
                    </div> --%>
>>>>>>> 78da7b1 (2022/08/11 커밋)
=======
>>>>>>> 3c7aac14b5df00e1e791e78734e602f2e19acd20
=======
                	
>>>>>>> a456549 (아이디 기억, 로그인, 로그아웃, 회원정보 수정, 회원탈퇴 기능 구현)
=======
                	
>>>>>>> d3707ba24bffcf1b4bed1164e787137b007d297e
=======

>>>>>>> 09b9aa5e3af66a574ff7b734d4ed2f5d4a22dff2
                
                <div>
                    <div class="update_box">
                        <button class="update_btn" >수정</button><br>
                        <button class="delete_account_btn" onclick="bye();" type="button">탈퇴</button>
                    </div>
                </div>
                
                <div class="join_img">
					<img class="update_img_pet" src="resources/img/update_dog.png">
				</div>
                
                
            </div>
        </form>
            </div>
</body>
</html>