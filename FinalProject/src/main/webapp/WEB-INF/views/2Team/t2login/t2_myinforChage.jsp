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
<div style="text-align: center;">
<form action="myinforChange.do" method="post">
		<h2>회원정보 수정</h2>
		<label>ID</label> <input name="member_ID" type="text" readonly="readonly"
			value="${sessionScope.loginMember.member_ID }" style="border: none;"><br>

		<label>이름</label> <input name="member_name" type="text" 
			value="${sessionScope.loginMember.member_name }" ><br>

		<label>생일</label> <input name="member_birth" type="date" 
			value="${sessionScope.loginMember.member_birth }" ><br>

		<label>성별</label> 
		<c:choose>
		<c:when test="${sessionScope.loginMember.member_sex =='m'}">
		<input name="member_sex" type="radio" class="join-sex" value="m"  checked="checked">남자
        &nbsp;&nbsp;<input name="member_sex" type="radio" class="join-sex" value="w">여자<br>
		</c:when>
		<c:otherwise>
		<input name="member_sex" type="radio" class="join-sex" value="m"  >남자
        &nbsp;&nbsp;<input name="member_sex" type="radio" class="join-sex" value="w" checked="checked">여자<br>
		</c:otherwise>
		</c:choose>

		<label>전화번호</label>
		<input name="member_phoneNum" type="text"  value="${sessionScope.loginMember.member_phoneNum }" ><br> 
		
		<label>주소</label> 
		 <input id="join_addr3Input" readonly="readonly" name="m_addr3" maxlength="5" autocomplete="off" placeholder="우편번호" value="${addr[2] }">
		<span id="addrSearchBtn">[검색]</span><br>
		<input id="join_addr1Input" readonly="readonly" name="m_addr1" maxlength="30" autocomplete="off" placeholder="주소" value="${addr[0] }"><br>
		<input id="join_addr2Input" name="m_addr2" maxlength="30" autocomplete="off" placeholder="상세주소" value="${addr[1] }">
		<br> 
		
		<label>이메일</label> 
		<input name="member_email" type="email" id="join-email"  value="${sessionScope.loginMember.member_email }" >
		<button type="button" id="join_mail_check">이메일인증</button><br>
        <input placeholder="인증번호를 입력해주세요" id="join_mail_num" disabled="disabled">
        <input type="hidden" id="join_num_check" value="emailUnCheck">
      <span id="mail-check-warn"></span> <!-- 인증코드 확인 -->
      <span id="emailcheckResult"></span> <!-- 중복확인 --><br>

		<br>
		
		<c:choose>
		<c:when test="${sessionScope.loginMember.member_linkWhere != 1 && sessionScope.loginMember.member_paper =='비동의' }">
		
		<label class="agree" for="agree">
		<input type="checkbox" id="agree" onchange="agree1()">정보 수집하는 것을 동의합니다
		</label><br>
		<input type="hidden" name="member_paper" value="동의">
		<button id="join_btn" disabled="disabled">등록하기</button>
		
		</c:when>
		
		<c:otherwise>
		
		<input type="hidden" name="member_paper" value="동의">
		<button>등록하기</button>	
			
		</c:otherwise>
		</c:choose>
		
		
	</form>
		
	</div>
</body>
<script type="text/javascript">
	function agree1() {
		let btn = document.getElementById('join_btn');
		let a = document.getElementById('join_btn').disabled;
		if (a) {
			btn.disabled = false;
		} else {
			btn.disabled = true;

		}
	}
</script>
</html>