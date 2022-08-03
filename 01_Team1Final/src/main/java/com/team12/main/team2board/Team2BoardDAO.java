package com.team12.main.team2board;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Team2BoardDAO {

	@Autowired
	private SqlSession ss;
	
	private int allPost;
	
	
	public int countPost(HttpServletRequest req, Team2BoardDTO board) {
		
		allPost = ss.getMapper(Team2BoardMapper.class).getAllpostCount(board);
		
		
		
		req.setAttribute("r", allPost);
		return allPost;
	}

	
	
}
