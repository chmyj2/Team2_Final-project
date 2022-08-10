package com.team12.main.t2.shop;



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



@Service
public class ProductDAO {
	
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	private SqlSession ss;

	
	
	
	// 진열될 상품전체 가져오기	
	public void getAllProduct(HttpServletRequest request, Product p) {
		try {
			request.setAttribute("Product", ss.getMapper(ProductMapper.class).getAllProduct(p));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 상품전체 가져오기
	public void realGetAllProduct(HttpServletRequest request) {
		
		try {
			request.setAttribute("Product", ss.getMapper(ProductMapper.class).realGetAllProduct());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
		
	



	// 하나만 가져오기
	public void getProduct(HttpServletRequest request, Product p) {
			
			try {
				request.setAttribute("Product", ss.getMapper(ProductMapper.class).getProduct(p));
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		
	}





	
	
	// 정보 수정
	public void updateProduct(HttpServletRequest request, List<MultipartFile> multiFileList,
			MultipartFile file, String pet_category, String toy_category, String productName, int productPrice,
			String productInfo, int productStock, String onExhibition, String[] productTag, int productNum, Product p) {
		
		
		
		String productTag2 = "";
		
		if (productTag != null) {
			for (String s : productTag) {
				productTag2 += s + "!";
			}	
		}else {
			productTag2 = "태그 없음";
		}	
		
		if (pet_category == p.getPet_category()) {
			pet_category = p.getPet_category();
		}
		
		if (toy_category == p.getToy_category()) {
			toy_category = p.getToy_category();
		}
		
		
		
		String path = request.getSession().getServletContext().getRealPath("resources/t2_yj_files");
		
		System.out.println(path);
		
		
		String changeFile = "";
		String newFileName ="";
		try {
			
			
			
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

	
	
	// 단일 파일
	String fileName = file.getOriginalFilename();
	System.out.println(path);
	
	String saveFileName = UUID.randomUUID().toString() + fileName.substring(fileName.lastIndexOf("."));
	System.out.println(fileName);
	System.out.println(saveFileName);
	
	// 업로드
	p = new Product();
	
	p.setProductNum(productNum);
	p.setPet_category(pet_category);
	p.setToy_category(toy_category);
	p.setProductName(productName);;
	p.setProductPrice(productPrice);
	p.setProductInfo(productInfo);
	p.setProductStock(productStock);
	p.setOnExhibition(onExhibition);
	p.setProductTag(productTag2);
	p.setProductThumbnail(saveFileName);
	p.setProductImg(changeFile);
	p.setProductTag(productTag2);
	
	if(!file.getOriginalFilename().isEmpty()) {
		// 실제 업로드 코드
		file.transferTo(new File(path,saveFileName));
												// 파일 이름.
		ss.getMapper(ProductMapper.class).updateProduct(p);
		System.out.println("수정 성공");
	}else {
		
	}
	
			} catch (Exception e) {
				System.out.println("fail");
				e.printStackTrace();
			}
		
		
		
	}
	
	
	// 상품등록
	public void regProduct(String pet_category, String toy_category, String productName, int productPrice,
			String productInfo, int productStock, String onExhibition, MultipartFile file,
			List<MultipartFile> multiFileList, HttpServletRequest request, String[] productTag) {

		
		String productTag2 = "";
		
		
		if (productTag != null) {
			for (String s : productTag) {
				productTag2 += s + "!";
			}	
		}else {
			productTag2 = "태그 없음";
		}	
		
		
		String path = request.getSession().getServletContext().getRealPath("resources/t2_yj_files");
		
		System.out.println(path);
		
		
		String changeFile = "";
		String newFileName ="";
		try {
			
			
			
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

	
	
	// 단일 파일
		String fileName = file.getOriginalFilename();
		System.out.println(path);
	
		String saveFileName = UUID.randomUUID().toString() + fileName.substring(fileName.lastIndexOf("."));
		System.out.println(fileName);
		System.out.println(saveFileName);
	
	
	// 업로드
		Product p = new Product();
	
		p.setPet_category(pet_category);
		p.setToy_category(toy_category);
		p.setProductName(productName);;
		p.setProductPrice(productPrice);
		p.setProductInfo(productInfo);
		p.setProductStock(productStock);
		p.setOnExhibition(onExhibition);
		p.setProductTag(productTag2);
		p.setProductThumbnail(saveFileName);
		p.setProductImg(changeFile);
			
	
		if(!file.getOriginalFilename().isEmpty()) {
		// 실제 업로드 코드
			file.transferTo(new File(path,saveFileName));
												// 파일 이름.
			ss.getMapper(ProductMapper.class).regProduct(p);
			System.out.println("등록 성공");
		}else {
		
		}
	
		} catch (Exception e) {
			System.out.println("fail");
			e.printStackTrace();
		}
		
		
		
		
	}



	public void deleteProduct(HttpServletRequest request, String thumbnail, String img, int num) {


		String path = request.getSession().getServletContext().getRealPath("resources/t2_yj_files");
		
		Product p = new Product();
		System.out.println("번호 : " + num);
		p.setProductNum(num);
		
		 String img2[] = img.split("!");
		
		if (ss.getMapper(ProductMapper.class).deleteProduct(p) == 1) {
			request.setAttribute("result", "삭제성공");
			 for(int i=0 ; i<img2.length ; i++)
		        {
		            System.out.println("img2["+i+"] : "+img2[i]);
		            
		            new File(path + "/" + img2[i]).delete();
		            System.out.println("여러사진 삭제성공");
		        }
			 	new File(path + "/" + thumbnail).delete();
			 	System.out.println("1장 삭제성공");
			 
			}else {
			request.setAttribute("result", "삭제실패");
			
			}
		
		
		
		
	}}

	
	
	

	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	




	
		
		
	
	



	







	
		
		
		
		
		
	


	



		
		

		
		
		
		
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
