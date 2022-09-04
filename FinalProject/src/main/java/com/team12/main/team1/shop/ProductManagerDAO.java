package com.team12.main.team1.shop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class ProductManagerDAO {

	@Autowired
	private SqlSession ss;
	
	public void regProduct(ProductDTO p, HttpServletRequest req) {
		
		try {
		// 인코딩 타입 바꿔줘서 파라미터 받아야 함.
			String path = req.getSession().getServletContext().getRealPath("resources/team1ProductImgs");
			MultipartRequest mr = null;

			mr = new MultipartRequest(
					req, path, 10 * 1024 * 1024, 
					"utf-8", new DefaultFileRenamePolicy());
		
				//값 받아오기.					
					String num_PK = mr.getParameter("num_PK");
					String categoryNum = mr.getParameter("categoryNum");
					String name = mr.getParameter("name");
					 double price = Double.parseDouble(mr.getParameter("price"));
					  	// 부가가치세 계산
					 	double vat = price*0.1;		 
					 String contents = mr.getParameter("contents");
					
					 String thumbnail = mr.getFilesystemName("thumbnail");
					 String img1 = mr.getFilesystemName("img1");
					 String img2 = mr.getFilesystemName("img2");
					 String img3 = mr.getFilesystemName("img3");
					
					 String tag = mr.getParameter("tag");
					 String onsale = mr.getParameter("onsale");
					 int stock = Integer.parseInt(mr.getParameter("stock"));
					 
					 // 경로 확인용
					 System.out.println(path);
					 
					 // setter 설정
					 
					p.setNum_PK(num_PK);
					p.setCategoryNum(categoryNum);
					p.setContents(contents);
					p.setName(name);
					
					p.setPrice(price);
					p.setVat(vat);
					
					p.setThumbnail(thumbnail);
					p.setImg1(img1);
					p.setImg2(img2);
					p.setImg3(img3);
					
					p.setTag(tag);
					p.setOnsale(onsale);
					p.setStock(stock);
				
					// ---------- sql문 실행.					
					if (ss.getMapper(Shopteam1Mapper.class).regProduct(p) == 1	) {
						req.setAttribute("result", "등록성공");
					} else {
						req.setAttribute("result", "등록실패(서버 문제)");
					}
				} catch (Exception e) {
					e.printStackTrace();
					req.setAttribute("result", "등록실패(서버나 sql 문제)");	
					return;
				}
	}

	
	public void loadProducts(ProductDTO p, HttpServletRequest req) {
		try {
			List<ProductDTO> products = ss.getMapper(Shopteam1Mapper.class).loadProducts();
			
			req.setAttribute("products", products);
			req.setAttribute("result", "불러오기 성공");
		
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "불러오기 실패");
			return;
		}
	}

	
	
	
	
	public void loadProductsByCategory(ProductDTO p, HttpServletRequest req) {
		System.out.print("CategoryNumber: ");	System.out.println(p.getCategoryNum());
		
		try {
			List<ProductDTO> products = ss.getMapper(Shopteam1Mapper.class).loadProductsByCategory(p);
			req.setAttribute("products", products);
			req.setAttribute("result", "카테고리로 불러오기 성공");
			
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "카테고리로 불러오기 실패");
			return;
		}
		
	}
	
	public void searchProductsByWord(ProductDTO p, HttpServletRequest req) {
		System.out.print("검색어: ");	System.out.println(req.getParameter("searchWord"));
		String searchName = req.getParameter("searchWord");
			p.setName(searchName);
		
		try {
			List<ProductDTO> products = ss.getMapper(Shopteam1Mapper.class).searchProductsByWord(p);
			req.setAttribute("products", products);
			req.setAttribute("result", "이름으로 검색하기 성공");
			
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "이름으로 검색하기 실패");
			return;
		}
		
	}

	// 상품 디테일 페이지 로드
	public void loadAProduct(ProductDTO p, HttpServletRequest req) {
		try {
			ProductDTO aproduct = ss.getMapper(Shopteam1Mapper.class).loadAProduct(p);	
			req.setAttribute("p", aproduct);		
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}		
	}

	
	
	
	
	
	
	
	
	
	
}
