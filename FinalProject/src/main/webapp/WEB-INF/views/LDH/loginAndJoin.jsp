<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
  <div class="welcome">

    <!-- SIGN IN -->
        <h1>SIGN IN</h1>
        <span id="resultArea">${result }</span>
        <form class="more-padding" autocomplete="off" action="member.login"  method="post" onsubmit="return frm_check();" name="loginForm" >
          <input class="input_id"  name="member_ID" id="userID" placeholder="ID"><br>
          <input class="input_pw" name="member_PW" id="pwd" type="password" placeholder="Password">
          <div class="checkbox">
            <input type="checkbox" id="remember" /><label for="remember">remember me</label>
          </div>
          <div class="find_info">
              <a href="">아이디 찾기</a> |
              <a href="">비밀번호찾기</a>
          </div>

        <button  class="login_btn">로그인</button>
        <button type="button" class="signUp_btn"  onclick="goJoin()">회원가입</button>
 		<a id="custom-login-btn" href="javascript:loginWithKakao()">
        <button  class="signUp_kakao_btn">카카오 연결</button>
    	</a>


    <button class="api-btn" onclick="kakaoLogout()">로그아웃</button>
    
<hr class="login_hr">
        <button class="non_members_check_order">비회원 주문조회</button>
        </form>

	
        <!-- <h1>회원가입</h1>
        <form autocomplete="off" action="loginandjoin.go">
          <input type="text" placeholder="username"><br>
          <input type="email" placeholder="email"><br>
          <input type="password" placeholder="password"><br>
          <input type="password" placeholder="confirm password"><br>
          <button class="button submit">create account </button>
        </form> -->

      </div>

    </div>


    
    
    <!-- White Space -->
    

</body>
</html>