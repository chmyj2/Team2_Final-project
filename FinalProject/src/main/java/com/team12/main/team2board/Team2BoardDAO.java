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
	
	private int totalPage;
	
	
	public int countPost(HttpServletRequest req, Team2BoardDTO board) {
		
	int	allPost = ss.getMapper(Team2BoardMapper.class).getAllpostCount(board);
		
		 totalPage = (int) Math.ceil((double)allPost/10);
		
		req.setAttribute("r", totalPage);
		
		return totalPage;
	}



	public void showPostList(HttpServletRequest req, Team2BoardDTO board) {
	
		String vpage = req.getParameter("vpage");
		   if( vpage == null) {
			   vpage = "1";
		   }
		   

		 
		  int page = Integer.parseInt(vpage);
		  
		  if(page != 1) {
			  board.setRnStart(page*10-9);
			  board.setRnEnd(page*10);
		  }  else {
			  board.setRnStart(1);
			  board.setRnEnd(10);
		  }
		

		
		List<Team2BoardDTO> posts = ss.getMapper(Team2BoardMapper.class).getPostList(board);
		
		req.setAttribute("posts", posts);
		
	}



	public void createPost(HttpServletRequest req, Team2BoardDTO board) {
		
		
	}

	
	
	
	
	
	
	
	
	
}
