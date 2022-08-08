package com.team12.main.team2board;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

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




	public String uploadImg(MultipartFile multipartFile, HttpServletRequest request) {
	    JsonObject jsonObject = new JsonObject();
		
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("");
		String fileRoot = contextRoot+"resources/team2_files/";
		System.out.println("file Root ==============="+fileRoot);
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "resources/team2_files/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
//		String a = jsonObject.toString();
		String a = "d";
		
		System.out.println("file----------------------------------" +a);
		
		return a;
		
	}
	
	
	public void createPost(HttpServletRequest req, Team2BoardDTO board) {
		
	
		
	}






	
	
	
	
	
	
	
	
	
}
