package com.team12.main.team1.store;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.team12.main.t2.shop.Product;
import com.team12.main.t2.shop.ProductMapper;

@Service
public class Team1ProductDAO {
	
	@Autowired
	private SqlSession ss;
	
	// 상품 등록하기
	public void productReg(HttpServletRequest req, MultipartHttpServletRequest mr, List<MultipartFile> multiFileList) {
		
		String path = req.getSession().getServletContext().getRealPath("resources/reviewFile");
		System.out.println("path :"+path);
		
		try {
			
			System.out.println(mr.getParameter("product_category"));
			System.out.println(mr.getFile("product_sub_category"));
			System.out.println(mr.getFile("product_thumnail"));
			System.out.println(mr.getParameter("product_title"));
			System.out.println(mr.getParameter("product_title2"));
			System.out.println(mr.getParameter("product_price"));
			System.out.println(mr.getParameter("product_stock"));
			System.out.println(mr.getParameter("product_info"));
			System.out.println(mr.getParameter("product_manufactor"));
			MultipartFile img = mr.getFile("product_thumnail");
			System.out.println("파일이름 -------:"+img.getOriginalFilename());
			
			
//			Map<String, String> products = new HashMap();
//			
//			products.put("product_category", mr.getParameter("product_category"));
//			products.put("product_thumnail", img.getOriginalFilename());
//			products.put("product_title", mr.getParameter("product_title"));
//			products.put("product_title2", mr.getParameter("product_title2"));
//			products.put("product_price", mr.getParameter("product_price"));
//			products.put("product_stock", mr.getParameter("product_stock"));
//			products.put("product_info", mr.getParameter("product_info"));
//			products.put("product_manufactor", mr.getParameter("product_manufactor"));
			
			//다중파일
			
			String newFileName = "";
			String changeFile = "";
			
			
			for (int i = 0; i < multiFileList.size(); i++) {
				
				// 다중 파일
				String originFile = multiFileList.get(i).getOriginalFilename();
				String ext = originFile.substring(originFile.lastIndexOf("."));
				newFileName = UUID.randomUUID().toString() + ext;
				System.out.println(newFileName);
				changeFile += newFileName + "!";

			
				File uploadFile = new File(path + "/" + newFileName);
						multiFileList.get(i).transferTo(uploadFile);
						System.out.println("다중 파일 업로드 성공!");
						
			}
			
			Team1ProductDTO p = new Team1ProductDTO();
			p.setProduct_category(mr.getParameter("product_category"));
			p.setProduct_sub_category(mr.getParameter("product_sub_category"));
			p.setProduct_thumnail(img.getOriginalFilename());
			p.setProduct_detail(changeFile);
			p.setProduct_title(mr.getParameter("product_title"));
			p.setProduct_title2(mr.getParameter("product_title2"));
			p.setProduct_price(Integer.parseInt(mr.getParameter("product_price")));
			p.setProduct_stock(Integer.parseInt(mr.getParameter("product_stock")));
			p.setProduct_info(mr.getParameter("product_info"));
			p.setProduct_manufactor(mr.getParameter("product_manufactor"));
			
			
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
			
			int result = ss.getMapper(Team1ProductMapper.class).productReg(p);
			
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
		
		req.setAttribute("products",ss.getMapper(Team1ProductMapper.class).getProductList(product));
		
	}
	
	public void loadAProduct(Team1ProductDTO p, HttpServletRequest req) {

		req.setAttribute("product",ss.getMapper(Team1ProductMapper.class).getProduct(p));
		
	}
	
	// 사료 가져오기
	public void getfood(HttpServletRequest req, Team1ProductDTO product) {
		System.out.println("1");
		
		req.setAttribute("foods",ss.getMapper(Team1ProductMapper.class).getFoodProduct(product));
		
	}
	// 상품 가져오기
	public void getProduct(HttpServletRequest req, String product_sub_category2, Team1ProductDTO product) {
		System.out.println("2");
		Team1ProductDTO p = new Team1ProductDTO();
		p.setProduct_sub_category(product_sub_category2);
		p.setProduct_category(req.getParameter("product_category"));
		req.setAttribute("toys",ss.getMapper(Team1ProductMapper.class).getToyProduct(p));
		
	}
	public void insertOrder(HttpServletRequest req, Order o, String billState, String billState1, String billState2) {
		
		String Shipping_Address = billState + billState1 + billState2;
		o.setShipping_Address(Shipping_Address);
		
		if (ss.getMapper(Team1ProductMapper.class).orderInsert(o) == 1) {
			System.out.println("등록성공");
		}else {
			System.out.println("등록실패");
			
		}
		
		
	}
	public void getOrder(HttpServletRequest req, Order o) {
		
		req.setAttribute("orders", ss.getMapper(Team1ProductMapper.class).getOrderList(o));		
		
		
		
	}

}
