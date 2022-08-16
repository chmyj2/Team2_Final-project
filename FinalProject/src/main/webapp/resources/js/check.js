function drUploadCheck() {
	var titleInput = document.drUploadForm.d_title;
	var fileInput = document.drUploadForm.d_file;

	if (isEmpty(titleInput)) {
		alert("?");
		titleInput.value = "";
		titleInput.focus();
		return false;
	} else if (isEmpty(fileInput)) {
		alert("?");
		return false;
	}

	return true;
}

function gUploadCheck() {
	var titleInput = document.gUploadForm.g_title;
	var fileInput = document.gUploadForm.g_file;

	if (isEmpty(titleInput)) {
		alert("?");
		titleInput.value = "";
		titleInput.focus();
		return false;
	} else if (isEmpty(fileInput)) {
		alert("?");
		return false;
	}

	return true;
}

function joinCheck() {
	var idInput = document.joinForm.member_ID;
	var pwInput = document.joinForm.member_PW;
	var pwChkInput = document.joinForm.m_pwChk;
	var nameInput = document.joinForm.member_name;
	var birthInput = document.joinForm.member_birth;
	var phoneNumInput = document.joinForm.member_phoneNum;
	var addr1Input = document.joinForm.m_addr1;
	var addr2Input = document.joinForm.m_addr2;
	var addr3Input = document.joinForm.m_addr3;
	var emailInput = document.joinForm.member_email;
	
	if (isEmpty(idInput) || containsHS(idInput)
			|| $("#member_IDInput").css("color") == "rgb(244, 67, 54)") {
		alert("ID를 입력해주세요.");
		idInput.value = "";
		idInput.focus();
		return false;
	} else if (isEmpty(pwInput) || notEquals(pwInput, pwChkInput)
			|| notContains(pwInput, "1234567890")) {
		alert("PW를 올바르게 입력해주세요.");
		pwInput.value = "";
		pwChkInput.value = "";
		pwInput.focus();
		return false;
	} else if (isEmpty(nameInput)) {
		alert("이름을 입력해주세요.");
		nameInput.value = "";
		nameInput.focus();
		return false;
	} else if (isEmpty(birthInput)) {
		alert("생년월일을 입력해주세요.");
		birthInput.value = "";
		birthInput.focus();
		return false;
	} else if (isEmpty(phoneNumInput)) {
		alert("전화번호를 입력해주세요.");
		phoneNumInput.value = "";
		phoneNumInput.focus();
		return false;
	} else if (isEmpty(addr1Input) || isEmpty(addr2Input)
			|| isEmpty(addr2Input)) {
		alert("주소를 입력해주세요.");
		addr1Input.value = "";
		addr2Input.value = "";
		addr3Input.value = "";
		addr1Input.focus();
		return false;
	}else if (isEmpty(emailInput)) {
		alert("이메일을 입력해주세요.");
		emailInput.value = "";
		emailInput.focus();
		return false;
	}

	return true;
}

function loginCheck() {
	var idInput = document.loginForm.member_ID;
	var pwInput = document.loginForm.member_PW;

	if (isEmpty(idInput) || isEmpty(pwInput)) {
		alert("아이디 또는 비밀번호를 확인해주세요?");
		idInput.value = "";
		pwInput.value = "";
		idInput.focus();
		return false;
	}

	return true;
}

/*function snsSearchCheck() {
	var searchInput = document.snsSearchForm.search;

	if (isEmpty(searchInput)) {
		alert("?");
		searchInput.focus();
		return false;
	}

	return true;
}

function snsWriteCheck() {
	var txtInput = document.snsWriteForm.s_txt;

	if (isEmpty(txtInput)) {
		alert("?");
		txtInput.focus();
		return false;
	}

	return true;
}

function snsWriteReplyCheck(f) {
	var txtInput = f.sr_txt;

	if (isEmpty(txtInput)) {
		alert("?");
		txtInput.focus();
		return false;
	}

	return true;
}
*/
function updateMemberCheck() {
	var pwInput = document.joinForm.member_PW;
	var pwChkInput = document.joinForm.m_pwChk;
	var nameInput = document.joinForm.member_name;
	var phoneNumInput = document.joinForm.member_phoneNum;
	var addr1Input = document.joinForm.m_addr1;
	var addr2Input = document.joinForm.m_addr2;
	var addr3Input = document.joinForm.m_addr3;
	var emailInput = document.joinForm.member_email;

	if (isEmpty(pwInput) || notEquals(pwInput, pwChkInput)
			|| notContains(pwInput, "1234567890")) {
		alert("PW를 올바르게 입력해주세요.");
		pwInput.value = "";
		pwChkInput.value = "";
		pwInput.focus();
		return false;
	} else if (isEmpty(nameInput)) {
		alert("이름을 입력해주세요.");
		nameInput.value = "";
		nameInput.focus();
		return false;
	} else if (isEmpty(phoneNumInput) || notContains(phoneNumInput, "1234567890")) {
		alert("전화번호를 올바르게 입력해주세요.");
		phoneNumInput.value = "";
		phoneNumInput.focus();
		return false;
	}else if (isEmpty(addr1Input) || isEmpty(addr2Input)
			|| isEmpty(addr2Input)) {
		alert("주소를 입력해주세요.");
		addr1Input.value = "";
		addr2Input.value = "";
		addr3Input.value = "";
		addr1Input.focus();
		return false;
	} else if (isEmpty(emailInput)) {
		alert("이메일을 입력해주세요.");
		emailInput.value = "";
		emailInput.focus();
		return false;
	}
	
	return true;
}