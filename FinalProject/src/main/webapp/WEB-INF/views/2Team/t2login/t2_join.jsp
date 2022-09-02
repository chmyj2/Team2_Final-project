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
<div class="t2-join-outdiv">
<form action="joinDo" method="POST" class="joinForm" name="joinForm" onsubmit="return joinCheck()"> 
        <input class="validCheck" type="hidden" id="join_IDCheck" value="IDUnCheck">    
        <input class="validCheck" type="hidden" id="join_emailCheckNum" value="emailUnCheck">                                                                                   
        <input class="validCheck" type="hidden" id="join_PWCheck" value="PWUnCheck">                                                                                   
      <h2>회원가입</h2>
      <div class="join-textForm">   
      	<span class="jointxt">*필수 5자 이상 영어 숫자 포함</span>  
        <input name="member_ID" type="text" class="join-id" placeholder="아이디" id="joinMember_ID">      
        <span id="idcheckResult"></span> <br>
        <span id="IDValidCheck"></span>
      </div>
      
      <div class="join-textForm">
      	<span class="jointxt">*필수 5자 이상 영어 숫자 포함</span>
        <input name="member_PW"  class="join-pw" placeholder="비밀번호" id="joinMember_PW">
        <span id="PWCheckResult"></span>
      </div>
      
       <div class="join-textForm">
        <input name="loginPwConfirm"  class="join-pw2" placeholder="비밀번호 확인">
        <span class="pwCheckResult"></span>
      </div>
      
      <div class="join-textForm">
      <span class="jointxt-only">*필수</span>
        <input name="member_name"  class="join-name" placeholder="이름">
      </div>
      
      <div class="join-textForm brith">
      <span class="jointxt-only-birth">*필수</span><br>
      	생일&nbsp;&nbsp;<input name="member_birth" type="date" class="join-birth" >
      </div> 
      
      <div class="join-textForm brith">
      	성별 &nbsp;&nbsp;
        <input name="member_sex" type="radio" class="join-sex" value="m" checked="checked">남자
        &nbsp;&nbsp;<input name="member_sex" type="radio" class="join-sex" value="w">여자
      </div>
      
      <div class="join-textForm">
      	<span class="jointxt">*필수 숫자만 입력해주세요</span>
        <input name="member_phoneNum" type="number" class="join-cellphoneNo" placeholder="전화번호">
      </div>
      
      <div class="join-textForm addr">
      <span class="jointxt-only-addr">*필수</span><br>
       주소<br>
        <input id="join_addr3Input" readonly="readonly" name="m_addr3" maxlength="5" autocomplete="off" placeholder="우편번호">
		<span id="addrSearchBtn">[검색]</span><br>
		<input id="join_addr1Input" readonly="readonly" name="m_addr1" maxlength="30" autocomplete="off" placeholder="주소"><br>
		<input id="join_addr2Input" name="m_addr2" maxlength="30" autocomplete="off" placeholder="상세주소">
      </div>
      
       <div class="join-textForm">
       <span class="jointxt-only">*필수</span><br>
        <input name="member_email" type="email" id="join-email" placeholder="이메일"> 
        <button type="button" id="join_mail_check">이메일인증</button><br>
        <input placeholder="인증번호를 입력해주세요" id="join_mail_num" type="hidden"> <br>
      <span id="mail-check-warn"></span> <!-- 인증코드 확인 -->
      <span id="emailcheckResult"></span> <!-- 중복확인 -->
      </div>
      
      <input type="hidden" name="member_linkWhere" value="1">
      <input type="hidden" name="member_paper" value="동의">
      <input type="submit" class="join-btn" value="J O I N"/>
    </form>
    </div>
</body>
</html>