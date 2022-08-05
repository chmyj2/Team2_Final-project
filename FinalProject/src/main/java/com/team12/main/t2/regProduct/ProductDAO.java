package com.team12.main.t2.regProduct;



import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.team12.main.t2.viewProductPage.ViewAllProductMapper;


@Service
public class ProductDAO {
	
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	private SqlSession ss;

	


		
		
		/*
		
		try {
		String pet_category = mr.getParameter("pet_category");
		String toy_category = mr.getParameter("toy_category");
		String productName = mr.getParameter("productName");
		int productPrice = Integer.parseInt(mr.getParameter("productPrice"));
		String productInfo = mr.getParameter("productInfo");
		String onExhibition = mr.getParameter("onExhibition");
		int productStock = Integer.parseInt(mr.getParameter("productStock"));
		String[] productTag = mr.getParameterValues("productTag");
		String productThumbnail = mr.getFilesystemName("productThumbnail");
		
		String productTag2 = "";
		
		if (productTag != null) {
			for (String s : productTag) {
				System.out.println(s);
				productTag2 += s + "!";
			}
		}
		
		
			
			
			p.setProductName(productName);;
			p.setProductPrice(productPrice);
			p.setProductInfo(productInfo);
			p.setProductStock(productStock);
			p.setOnExhibition(onExhibition);
			p.setProductTag(productTag2);
			p.setPet_category(pet_category);
			p.setToy_category(toy_category);
			p.setProductThumbnail(productThumbnail);
			p.setProductImg(productImg);
			
			
			if (ss.getMapper(Product.class).regProduct(p) == 1) {
				request.setAttribute("result", "가입성공");
			} else {
				request.setAttribute("result", "가입실패");
			}*/
		/*
		 * } catch (Exception e) { e.printStackTrace(); String fileName =
		 * mr.getFilesystemName("m_photo"); new File(path + "/" + fileName).delete();
		 * request.setAttribute("result", "가입실패"); }
		 */
			
		
	

	public void getAllProduct(HttpServletRequest request) {

		try {
			request.setAttribute("products", ss.getMapper(ViewAllProductMapper.class).getAllProduct());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}




	public void regProduct(Model model, HttpServletRequest request, List<MultipartFile> multiFileList, MultipartFile file) {

			
		
		for (int i = 0; i < multiFileList.size(); i++) {
			
			String originFile = multiFileList.get(i).getOriginalFilename();
			String ext = originFile.substring(originFile.lastIndexOf("."));
			String changeFile = UUID.randomUUID().toString() + ext;
			
			System.out.println(changeFile);
				
			
		}
		
		
		String path = request.getSession().getServletContext().getRealPath("resources/t2_yj_files");
		
		
		try {
			
			
			
			String fileName = file.getOriginalFilename();
			System.out.println(path);
			
			String saveFileName = UUID.randomUUID().toString() + fileName.substring(fileName.lastIndexOf("."));
			System.out.println(fileName);
			System.out.println(saveFileName);
			
			FileDTO fDTO = new FileDTO();
			fDTO.setF_name(saveFileName);
					
			
			if(!file.getOriginalFilename().isEmpty()) {
				// 실제 업로드 코드
				file.transferTo(new File(path,saveFileName));
														// 파일 이름.
				ss.getMapper(RegProductMapper.class).regProduct(fDTO);
				model.addAttribute("r","file uploaded !");
				model.addAttribute("fileName",saveFileName);
			}else {
				model.addAttribute("r","fail...");
				
			}
			
			
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		
		
		
		
		
		
		
		
		
	}




	







	
		
		
		
		
		
	


	



		
		

		
		
		
		
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	}
