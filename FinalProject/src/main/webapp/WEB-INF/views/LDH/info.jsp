<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                	
                	<!-- pw  -->
                    <input class="join_input_pw" value="${sessionScope.loginMember.member_PW }" name="jm_pw" placeholder="Password *" type="password" maxlength="10" autocomplete="off">
                   <!--  <img src="resources/img/update.png"> -->
                	<p class="required_txt">* 숫자 하나 이상</p>
                	
                	<!-- pw 재확인 -->
                    <input class="input_pw" value="${sessionScope.loginMember.member_PW }" name="jm_pwChk" placeholder="Password Check *" type="password" maxlength="10" autocomplete="off">
                	<br>

                	<!-- 이름  -->
                    <input class="input_name" value="${sessionScope.loginMember.member_name }" name="jm_name" placeholder="Name *" maxlength="10" autocomplete="off">
                	<br>

                	<!-- phoneNum -->
                    <input class="input_pn" value="${sessionScope.loginMember.member_phoneNum }" name="jm_pNum" placeholder="Phone Number *" type="text" maxlength="10" autocomplete="off">
                	<br>
                	
                	
                	<!-- 주소  -->
                        <input class="input_addr1" id="jm_addr3Input" readonly="readonly" value="${addr[2] }"  name="jm_addr3" maxlength="5" autocomplete="off" placeholder="우편번호">
                        <span class="search_addr" id="addrSearchBtn">검색</span>
                        <br>
                        <input class="input_addr" id="jm_addr1Input" readonly="readonly" value="${addr[0] }"  name="jm_addr1" maxlength="30" autocomplete="off" placeholder="주소"><br>
                        <input class="input_addr" value="${addr[1] }"  name="jm_addr2" maxlength="30" autocomplete="off" placeholder="상세주소">
                
                	<!-- email -->
                    <input class="input_email" value="${sessionScope.loginMember.member_email }" name="jm_email" placeholder="Email *" type="text" maxlength="10" autocomplete="off">
                	<br>
                	
                	
                	<%-- <!-- 프로필 사진 -->
                    <div class="join_my_photo">
                    <span>-프로필 사진 변경-</span> <br>
                        <img src="resources/files/${sessionScope.loginMember.m_photo }" id="updateMemberPhoto"><br>
                    	<!-- <input class="upload-name" value="첨부파일" placeholder="첨부파일"> -->
                    	<label for ="file">파일찾기</label>
                        <input name="jm_photo" type="file" id="file">
                    </div> --%>
                
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
                <!-- 임시로 로그아웃 버튼좀 생성 할게요 YK -->
                <button class="join_btn" onclick="logout()">logout(임시)</button>
            </div>
</body>
</html>