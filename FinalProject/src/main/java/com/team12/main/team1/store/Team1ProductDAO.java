package com.team12.main.team1.store;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class Team1ProductDAO {
	
	@Autowired
	private SqlSession ss;
	
	// 상품 등록하기
	public void productReg(HttpServletRequest req, MultipartHttpServletRequest mr) {
		
		String path = req.getSession().getServletContext().getRealPath("resources/reviewFile");
		System.out.println("path :"+path);
		
		try {
			
			System.out.println(mr.getParameter("product_category"));
			System.out.println(mr.getFile("product_thumnail"));
			System.out.println(mr.getParameter("product_title"));
			System.out.println(mr.getParameter("product_title2"));
			System.out.println(mr.getParameter("product_price"));
			System.out.println(mr.getParameter("product_stock"));
			System.out.println(mr.getParameter("product_info"));
			System.out.println(mr.getParameter("product_manufactor"));
			MultipartFile img = mr.getFile("product_thumnail");
			System.out.println("파일이름 -------:"+img.getOriginalFilename());
			
			
			Map<String, String> products = new HashMap();
			
			products.put("product_category", mr.getParameter("product_category"));
			products.put("product_thumnail", img.getOriginalFilename());
			products.put("product_title", mr.getParameter("product_title"));
			products.put("product_title2", mr.getParameter("product_title2"));
			products.put("product_price", mr.getParameter("product_price"));
			products.put("product_stock", mr.getParameter("product_stock"));
			products.put("product_info", mr.getParameter("product_info"));
			products.put("product_manufactor", mr.getParameter("product_manufactor"));
			
			
			File f = new File(path+"/"+img.getOriginalFilename());
//			f.createNewFile();
			img.transferTo(f);
			
			int result = ss.getMapper(Team1ProductMapper.class).productReg(products);
			
			if (result == 1) {
				req.setAttribute("m", "등록성공");
				System.out.println("등록성공");
			} else {
				System.out.println("등록실패");
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "등록실패");
		}
	}
	// 전체 상품 리스트 보여주기
	public void showAllProduct(HttpServletRequest req, Team1ProductDTO product) {
		
		List<Team1ProductDAO> products = ss.getMapper(Team1ProductMapper.class).getProductList(product);
		
		
	}

}
