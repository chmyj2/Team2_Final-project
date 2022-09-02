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
//로그인 비즈니스 유효성 검사
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
	//일반 멤버 회원가입 유효성 검사
	let ID =document.joinForm.member_ID;
	let IDCheck = document.getElementById('join_IDCheck');
	let PW = document.joinForm.member_PW;
	let PW2 = document.joinForm.loginPwConfirm;
	let PWCheck = document.getElementById('join_PWCheck');
	let name = document.joinForm.member_name;
	let phone = document.joinForm.member_phoneNum;
	let addr1 = document.joinForm.m_addr3;
	let addr3 = document.joinForm.m_addr2;
	let emailCheck = document.getElementById('join_emailCheckNum');
	
	if (isEmpty(ID)||lessThan(ID,5)||containsHS(ID)) {
		//ID 유형에 맞게 작성했는 지 확인하는 기능
		alert("아이디를 옳바르게 입력해주세요");
		ID.focus();
		ID.value=""
		
		return false;
	}
	
	if (IDCheck.value != 'IDcheck') {
		//중복된 ID를 사용할 경우 막기
		alert("중복된 ID입니다.")
		ID.focus();
		ID.value=""
			
		return false;
	}
	
	if(isEmpty(PW)||lessThan(PW,5)||containsHS(PW)){
		//PW 유형에 맞게 작성했는 지 확인하는 기능
		alert("비밀번호를 옳바르게 입력해주세요");
		PW.focus();
		PW.value=""
		
		return false;
	}
	
	if (PWCheck.value != 'PWCheck') {
		//PW 위 비밀번호랑 일치하지 않는 경우 막기
		
		alert("확인 비밀번호가 일치하지 않습니다.")
		PW2.focus();
		PW2.value=""
			
		return false;
		
	}
	
	if (isEmpty(name)) {
		//이름 빈칸 방지하기
		
		alert("이름을 입력해주세요")
		name.focus();
		name.value=""
			
		return false;
	}
	
	if (isEmpty(phone)||isNotNumber(phone)) {
		//전화번호 빈칸 방지하기
		
		alert("전화번호을 형식에 맞게 입력해주세요")
		phone.focus();
		phone.value=""
			
		return false;
	}
	
	if (isEmpty(addr1)) {
		//주소 빈칸 방지하기
		
		alert("주소를 입력해주세요")
		addr1.focus();
			
		return false;
	}
	
	if (isEmpty(addr3)) {
		//주소 빈칸 방지하기
		
		alert("주소를 입력해주세요")
		addr3.focus();
		addr3.value=""
			
			return false;
	}
	
	if (emailCheck.value != 'emailcheck') {
		alert("이메일 인증을 해주세요");
		
		return false;
	}
	
}

function joinIdvalild() {
	//멤버 회원가입 ID 유효성 검사(1)
	$('#joinMember_ID').keyup(function() {
		let ID = document.joinForm.member_ID;
		
		if (lessThan(ID,5)) {
			$('#idcheckResult').text('5자 이하입니다.');
			$('#idcheckResult').css('color','red')
		}else {
			$('#idcheckResult').text('');
		}
		
	})
	
	//멤버 회원가입 ID 유효성 검사(2)
	$('#joinMember_ID').blur(function() {
		let ID = document.joinForm.member_ID;
		if (containsHS(ID)) {
			$('#IDValidCheck').text('숫자 영어만 입력해주세요');
			$('#IDValidCheck').css('color','red');
		}else {
			$('#IDValidCheck').text('');			
		}
	})
	
	//멤버 회원가입 PW 유효성검사(1)
	$('#joinMember_PW').blur(function() {
		let PW = document.joinForm.joinMember_PW;
		
		if (lessThan(PW,5)||containsHS(PW)) {
			$('#PWCheckResult').text('5자 이상 숫자 영어만 입력해주세요');
			$('#PWCheckResult').css('color','red');
		}else {
			$('#PWCheckResult').text('');			
		}
	})
	
	
}

function businessJoinCheck() {
	//비즈니스 회원가입 유효성 검사
	let ID =document.busniessjoinForm.vet_ID;
	let IDCheck = document.getElementById('join_IDCheck');
	let PWCheck = document.getElementById('join_PWCheck');
	let PW = document.busniessjoinForm.vet_PW;
	let busniessNum = document.busniessjoinForm.vet_businessNum;
	let businessNumCheck =document.getElementById('join_BusinessNumCheck');
	let phone = document.busniessjoinForm.vet_phoneNum
	let addr1 = document.busniessjoinForm.m_addr3;
	let addr3 = document.busniessjoinForm.m_addr2;
	
	if (isEmpty(ID)||lessThan(ID,5)||containsHS(ID)) {
		//ID 유형에 맞게 작성했는 지 확인하는 기능
		alert("아이디를 옳바르게 입력해주세요");
		ID.focus();
		ID.value=""
		
		return false;
	}
	
	if (IDCheck.value != 'IDcheck') {
		//중복된 ID를 사용할 경우 막기
		alert("중복된 ID입니다.")
		ID.focus();
		ID.value=""
			
		return false;
	}
	
	if (PWCheck.value != 'PWCheck' || isEmpty(PW)) {
		//형식이 맞지 않게 쓴PW 막기
		alert("비밀번호 또는 비밀번호 확인값을 확인해주세요");
		PW.focus();
		
		
		return false;
	}
	
	if (businessNumCheck.value != 'BusinessNumcheck' || isEmpty(busniessNum)) {
		//사업자 번호 중복시 막기
		alert("사업자 번호를 확인해 주세요");
		busniessNum.focus();
		busniessNum.value="";
		
		return false;
	}
	
	if (isEmpty(phone)||isNotNumber(phone)) {
		//전화번호 빈칸 방지하기
		
		alert("전화번호을 형식에 맞게 입력해주세요")
		phone.focus();
		phone.value=""
			
		return false;
	}
	
	if (isEmpty(addr1)) {
		//주소 빈칸 방지하기
		
		alert("주소를 입력해주세요")
		addr1.focus();
			
		return false;
	}
	
	if (isEmpty(addr3)) {
		//주소 빈칸 방지하기
		
		alert("주소를 입력해주세요")
		addr3.focus();
		addr3.value=""
			
			return false;
	}
	
	
}

function joinBusinessCheck() {
	
	//비즈니스 회원가입 ID 유효성 검사(1)
	$('#joinbusiness_ID').keyup(function() {
		let ID = document.busniessjoinForm.vet_ID;
		
		if (lessThan(ID,5)) {
			$('#idcheckResult').text('5자 이하입니다.');
			$('#idcheckResult').css('color','red')
		}else {
			$('#idcheckResult').text('');
		}
		
	})
	
	//비즈니스 회원가입 ID 유효성 검사(2)
	$('#joinbusiness_ID').blur(function() {
		let ID = document.busniessjoinForm.vet_ID;
		if (containsHS(ID)) {
			$('#IDValidCheck').text('숫자 영어만 입력해주세요');
			$('#IDValidCheck').css('color','red');
		}else {
			$('#IDValidCheck').text('');			
		}
	})
	
	//멤버 회원가입 PW 유효성검사(1)
	$('#joinMember_PW').blur(function() {
		let PW = document.joinForm.joinMember_PW;
		
		if (lessThan(PW,5)||containsHS(PW)) {
			$('#PWCheckResult').text('5자 이상 숫자 영어만 입력해주세요');
			$('#PWCheckResult').css('color','red');
			$('#join_PWCheck').val("PWUncheck");
		}else {
			$('#PWCheckResult').text('');			
			$('#join_PWCheck').val("PWcheck");
		}
	})
	
}

function memberInfoChangeCheck() {
	let name = document.memberInfoChange.member_name;
	let phone = document.memberInfoChange.member_phoneNum;
	let addr1 = document.memberInfoChange.m_addr3;
	let addr3 = document.memberInfoChange.m_addr2;
	let emailCheck = document.getElementById('join_emailCheckNum');
	
	if (isEmpty(name)) {
		alert('이름을 입력해주세요');
		name.focus();
		
		return false;
	}
	
	if (isEmpty(phone)||isNotNumber(phone)) {
		//전화번호 빈칸 방지하기
		
		alert("전화번호을 형식에 맞게 입력해주세요")
		phone.focus();
		phone.value=""
			
		return false;
	}
	
	if (isEmpty(addr1)) {
		//주소 빈칸 방지하기
		
		alert("주소를 입력해주세요")
		addr1.focus();
			
		return false;
	}
	
	if (isEmpty(addr3)) {
		//주소 빈칸 방지하기
		
		alert("주소를 입력해주세요")
		addr3.focus();
		addr3.value=""
			
			return false;
	}
	
	if (emailCheck != 'emailcheck') {
		alert("이메일 인증을 해주세요");
		
		return false;
	}
}

function memberInfoChange() {
	$('#join-email').keyup(function() {
		$('#join_emailCheckNum').val('emailUnCheck');
	})
}

$(function() {
	joinIdvalild();
	joinBusinessCheck();
	memberInfoChange();
})
