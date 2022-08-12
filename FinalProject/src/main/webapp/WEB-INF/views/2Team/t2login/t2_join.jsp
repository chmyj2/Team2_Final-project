<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<div class="t2-join-outdiv">
<form action="joinDo" method="POST" class="joinForm" name="joinForm"> <!-- onsubmit="return joinCheck()"  -->
                                                                                               
      <h2>회원가입</h2>
      <div class="join-textForm">
        <input name="member_ID" type="text" class="join-id" placeholder="아이디">
        <span id="idcheckResult"></span>
      </div>
      
      <div class="join-textForm">
        <input name="member_PW"  class="join-pw" placeholder="비밀번호">
      </div>
      
       <div class="join-textForm">
        <input name="loginPwConfirm"  class="join-pw2" placeholder="비밀번호 확인">
        <span class="pwCheckResult"></span>
      </div>
      
      <div class="join-textForm">
        <input name="member_name"  class="join-name" placeholder="이름">
      </div>
      
      <div class="join-textForm brith">
      	생일&nbsp;&nbsp;<input name="member_birth" type="date" class="join-birth" >
      </div> 
      
      <div class="join-textForm brith">
      	성별 &nbsp;&nbsp;
        <input name="member_sex" type="radio" class="join-sex" value="m" checked="checked">남자
        &nbsp;&nbsp;<input name="member_sex" type="radio" class="join-sex" value="w">여자
      </div>
      
      <div class="join-textForm">
        <input name="member_phoneNum" type="number" class="join-cellphoneNo" placeholder="전화번호">
      </div>
      
      <div class="join-textForm addr">
       주소<br>
        <input id="join_addr3Input" readonly="readonly" name="m_addr3" maxlength="5" autocomplete="off" placeholder="우편번호">
		<span id="addrSearchBtn">[검색]</span><br>
		<input id="join_addr1Input" readonly="readonly" name="m_addr1" maxlength="30" autocomplete="off" placeholder="주소"><br>
		<input id="join_addr2Input" name="m_addr2" maxlength="30" autocomplete="off" placeholder="상세주소">
      </div>
      
       <div class="join-textForm">
        <input name="member_email" type="email" id="join-email" placeholder="이메일"> 
        <button type="button" id="join_mail_check">이메일인증</button><br>
        <input placeholder="인증번호를 입력해주세요" id="join_mail_num" disabled="disabled">
        <input type="hidden" id="join_num_check" value="emailUnCheck">
      <span id="mail-check-warn"></span>
      <span id="emailcheckResult"></span>
      </div>
      
      
      <input type="submit" class="join-btn" value="J O I N"/>
    </form>
    </div>
    <script type="text/javascript">
  var naver_id_login = new naver_id_login("BuwruEVQIqPoVW9Sc3Uo", "http://localhost/main/joingo");
  // 접근 토큰 값 출력
  alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('age'));
  }
</script>
</body>
</html>