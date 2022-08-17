package com.team12.main.t2Login;

public interface Team2loginMapper {

	Membert2 getMemberByID(Membert2 m);

	vet getVetByID(vet v);

	int checkId(Membert2 m);

	int checkEmail(Membert2 m);

	int join(Membert2 m);

	int businessNumCheck(vet v);

	int joinBusiness(vet v);

	int checkIdNaver(Membert2 m);

	int petReg(pet p);


	

}
