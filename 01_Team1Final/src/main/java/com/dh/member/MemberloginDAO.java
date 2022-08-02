package com.dh.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberloginDAO {

	@Autowired
	private SqlSession ss;
	
	
}
