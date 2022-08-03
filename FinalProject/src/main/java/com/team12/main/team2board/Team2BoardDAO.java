package com.team12.main.team2board;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Team2BoardDAO {

	@Autowired
	private SqlSession ss;
	
	private int allPost;
	
	
	public int countPost() {
		
		allPost = ss.getMapper(Team2BoardMapper.class).getAllpostCount();
		
		return allPost;
	}

	
	
}
