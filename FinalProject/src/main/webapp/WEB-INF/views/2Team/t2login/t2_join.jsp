<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="t2-join-outdiv">
<form action="doJoin" method="POST" class="joinForm" onsubmit="DoJoinForm__submit(this); return false;">
                                                                                               
      <h2>회원가입</h2>
      <div class="join-textForm">
        <input name="loginId" type="text" class="join-id" placeholder="아이디">
      </div>
      
      <div class="join-textForm">
        <input name="loginPw"  class="join-pw" placeholder="비밀번호">
      </div>
      
       <div class="join-textForm">
        <input name="loginPwConfirm"  class="join-pw" placeholder="비밀번호 확인">
      </div>
      
      <div class="join-textForm">
        <input name="name" type="password" class="join-name" placeholder="이름">
      </div>
      
      <div class="join-textForm brith">
      	생일&nbsp;&nbsp;<input name="nickname" type="date" class="join-birth" >
      </div>
      
      <div class="join-textForm brith">
      	성별 &nbsp;&nbsp;
        <input name="sex" type="radio" class="join-sex" value="m" checked="checked">남자
        &nbsp;&nbsp;<input name="sex" type="radio" class="join-sex" value="w">여자
      </div>
      
      <div class="join-textForm">
        <input name="cellphoneNo" type="number" class="join-cellphoneNo" placeholder="전화번호">
      </div>
      
      <div class="join-textForm addr">
       주소<br>
        <input id="join_addr3Input" readonly="readonly" name="m_addr3" maxlength="5" autocomplete="off" placeholder="우편번호">
		<span id="addrSearchBtn">[검색]</span><br>
		<input id="join_addr1Input" readonly="readonly" name="m_addr1" maxlength="30" autocomplete="off" placeholder="주소"><br>
		<input id="join_addr2Input" name="m_addr2" maxlength="30" autocomplete="off" placeholder="상세주소">
      </div>
      
       <div class="join-textForm">
        <input name="email" type="text" class="join-email" placeholder="이메일">
      </div>
      
      
      <input type="submit" class="join-btn" value="J O I N"/>
    </form>
    </div>
</body>
</html>