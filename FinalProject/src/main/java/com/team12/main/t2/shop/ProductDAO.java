package com.team12.main.t2.shop;



import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;



@Service
public class ProductDAO {
	
	
	
	@Autowired
	private SqlSession ss;

	
	
	
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
			String productInfo, int productStock, String onExhibition, String[] productTag, int productNum) {
		
		
		Product p = new Product();
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
		
		
		
		
	}



	public void getPetCategoryProduct(HttpServletRequest request, Product p) {
		
			
			request.setAttribute("Product", ss.getMapper(ProductMapper.class).getPetProduct(p));
			
			
			
		}



	public void getSnack(HttpServletRequest request, Product p) {
		request.setAttribute("Snack", ss.getMapper(ProductMapper.class).getSnack(p));
		
	}



	public void getToy(HttpServletRequest request, Product p, String toy) {
		
		p.setToy_category(toy);
		request.setAttribute("Toy", ss.getMapper(ProductMapper.class).getToy(p));
		
	}



	public void getAllProduct(HttpServletRequest request, Product p, int total, String nowPage, String cntPerPage) {
		
		
		if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "16";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "16";
        }
		
		PagingDTO pp = new PagingDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		p.setStart(pp.getStart());
		p.setEnd(pp.getEnd());
		
		
		request.setAttribute("PagingDTO", pp);
		request.setAttribute("Product", ss.getMapper(ProductMapper.class).getAllProduct(p));
		
	}



	public int countPostList(HttpServletRequest request, Product p) {
		
		
		
		return ss.getMapper(ProductMapper.class).countProduct(p);
	}


	
	// 주문조회(운영자 전용)
	public void getOrderProduct(HttpServletRequest request, OrderDTO o, int total, String nowPage, String cntPerPage) {
		
		if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "16";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "16";
        }
		
		PagingDTO pp = new PagingDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		o.setStart(pp.getStart());
		o.setEnd(pp.getEnd());
		
		
		o.setOrder_PaymentState("결제완료");
		List<OrderDTO> orders = new ArrayList<OrderDTO>();
		orders = ss.getMapper(ProductMapper.class).getOrderbyPayment(o);
		request.setAttribute("PagingDTO", pp);
		request.setAttribute("orders",orders);
		
	}


	// 주문 배송상태 업데이트
	public void updateDeliverState(HttpServletRequest request, OrderDTO o) {
		
		System.out.println(o.getOrder_PK());
		System.out.println(o.getOrder_DeliverState());
		
		if (ss.getMapper(ProductMapper.class).updateDeliverState(o) == 1) {
			System.out.println("업데이트 성공");
		}else {
			System.out.println("업데이트 실패");
		}
		
	}



	// 주문조회 (개인)
	public void getOrderProductByUser_id(HttpServletRequest request, OrderDTO o, int total, String nowPage, String cntPerPage) {
		
		if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "16";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "16";
        }
		
		PagingDTO pp = new PagingDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		o.setStart(pp.getStart());
		o.setEnd(pp.getEnd());
		
		
		request.setAttribute("PagingDTO", pp);
		request.setAttribute("orders", ss.getMapper(ProductMapper.class).getOrderbyUserID(o));
		
	}



	public int countOrderList(HttpServletRequest request, OrderDTO o) {
		
		
		
		return ss.getMapper(ProductMapper.class).countAllOrder(o);
	}



	public void deleteMyOrder(OrderDTO o) {

		if (ss.getMapper(ProductMapper.class).deleteMyOrder(o) == 1) {
			System.out.println("삭제완료");
		}else {
			System.out.println("삭제실패");
		}
		
	}
	
		

}
	
	





	
		
		
	
		

		
		
		
		
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
