package com.team12.main.team2board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Team2BoardDAO {

	@Autowired
	private SqlSession ss;
	
	
	
	public int countPost(HttpServletRequest req, Team2BoardDTO board) {
		
	int	allPost = ss.getMapper(Team2BoardMapper.class).getAllpostCount(board);
		
		int totalPage = (int) Math.ceil((double)allPost/10);
		
		req.setAttribute("r", totalPage);
		
		return totalPage;
	}



	public void showPostList(HttpServletRequest req, Team2BoardDTO board) {
		
		List<Team2BoardDTO> posts = ss.getMapper(Team2BoardMapper.class).getPostList(board);
		
		req.setAttribute("posts", posts);
		
	}

	
	
	
	
	
	
	
	
	
}
