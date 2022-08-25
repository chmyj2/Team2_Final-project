function logincheckCall() {
//	로그인 개인용 유효성 검사
	let ID = document.loginForm.member_ID;
	let PW = document.loginForm.member_PW;
	
	if(isEmpty(ID)){
		alert("아이디를 입력해주세요");
		ID.focus();
		ID.value="";
		
		return false;
	}
	if(isEmpty(PW)){
		alert("비밀번호를 입력해주세요");
		PW.focus();
		PW.value="";
		
		return false;
	}
	
	return true;
}

function loginCheck_business() {
	let ID = document.loginFormBusiness.vet_ID;
	let PW = document.loginFormBusiness.vet_PW;
	
	if(isEmpty(ID)){
		alert("아이디를 입력해주세요");
		ID.focus();
		ID.value="";
		
		return false;
	}
	if(isEmpty(PW)){
		alert("비밀번호를 입력해주세요");
		PW.focus();
		PW.value="";
		
		return false;
	}
	
	return true;
}

function joinCheck() {
	//개인용 회원가입 유효성 검사
	let ID = document.joinForm.member_ID;
	let PW = document.joinForm.member_PW;
	let name = document.joinForm.member_name;
	let date = document.joinForm.member_birth;
	let phone =document.joinForm.member_phoneNum;
	let addr1 =document.joinForm.m_addr1;
	let addr2 =document.joinForm.m_addr2;
	let addr3 =document.joinForm.m_addr3;
	let email = document.joinForm.member_email;
	let emailCheck = document.getElementById('join_num_check');
	
	

	if(isEmpty(ID)||lessThan(ID,5)||containsHS(ID)){
		alert("아이디를 옳바르게 입력해주세요");
		ID.focus();
		ID.value="";
		
		return false;
	}
	
	if (isEmpty(PW)||lessThan(PW,5)||containsHS(PW)) {
		alert("비밀번호를 옳바르게 입력해주세요");
		PW.focus();
		PW.value="";
		
		return false;
	}
	
	if (isEmpty(name)) {
		alert("이름를 옳바르게 입력해주세요");
		name.focus();
		name.value="";
		
		return false;
	}
	
	if (isEmpty(date)) {
		alert("생일을 입력해주세요");
		date.focus();
		
		return false;
	}
	
	if (isEmpty(phone)||lessThan(phone,11)) {
		alert("전화번호를 옳바르게 입력해주세요");
		phone.focus();
		
		return false;
	}
	
	if (isEmpty(addr1) || isEmpty(addr2)
			|| isEmpty(addr3)) {
		alert("주소를 입력해주세요");
		addr2.value = "";
		addr1.focus();
		return false;
	}
	
	if (isEmpty(email)) {
		alert("이메일을 입력해주세요");
		email.focus();
		
		return false;
	}
	
	if (emailCheck.value != 'emailcheck') {
		alert("이메일 인증을 해주세요");
		
		return false;
	}
	
	
}