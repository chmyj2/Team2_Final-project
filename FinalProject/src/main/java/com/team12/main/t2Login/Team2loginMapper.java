package com.team12.main.t2Login;

public interface Team2loginMapper {

	Membert2 getMemberByID(Membert2 m);

	vet getVetByID(vet v);

	int checkId(Membert2 m);

	int join(Membert2 m);

	int businessNumCheck(vet v);

	int joinBusiness(vet v);

	int checkIdNaver(Membert2 m);

	int petReg(pet p);

	int memberUpdate(Membert2 m);

	pet getPetInfo(pet p);

	int checkEmail(Membert2 m);

	

	// kakao 로그인 시 db에서 중복 된 id가 있는지 확인
	int checkKakaoID(Membert2 m);
	
	

}
