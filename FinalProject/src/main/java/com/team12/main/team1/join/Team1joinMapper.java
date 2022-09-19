package com.team12.main.team1.join;

import com.team12.main.t2Login.Membert2;

public interface Team1joinMapper {

	int join(Membert2 m);

	Membert2 getMemberByID(Membert2 m);

	int update(Membert2 m);

	int bye(Membert2 m);

	int getMemberNum(Membert2 m);
	

	int kakaoJoin(Membert2 m);
	
	String find_id(Membert2 m);
 

	


	


}
