package com.team12.main.t2.shop;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team12.main.t2.shop.Product;
import com.team12.main.t2.shop.ProductDAO;
import com.team12.main.t2Login.LoginDAO;

@Controller
public class ProductCartController {
	
	@Autowired
	private ProductDAO pDAO;
	
	@Autowired
	private LoginDAO lDAO;
	
	@Autowired
	private CartDAO cDAO;
	
	
	@ResponseBody
	@RequestMapping(value = "/add.product.in.cart", method = RequestMethod.GET)
	public int addIncart(HttpServletRequest request,Cart c) {
		
		// 상품 카드에 저장하는 일
		System.out.println(c.getCart_ProductNum());
		System.out.println(c.getCart_ProductQuantity());
		System.out.println(c.getCart_UserID());
//		if (cDAO.checkCart(c)) {
//			// 이미 장바구니에 같은 상품이 있음
//			
//			return 1;
//		}
		
		return cDAO.reqCart(c);
	}
	
	
	
	// 장바구니 가기
		@RequestMapping(value = "/CartView.go", method = RequestMethod.GET)
		public String viewProductPage(HttpServletRequest request,Product p,Cart c,
				@RequestParam("productNum") int productNum,@RequestParam("cart_UserID") String cart_UserID) {
			
			// 장바구니 가져오기
			
			lDAO.loginCheck(request);
			cDAO.getCart(request,productNum,cart_UserID);
			request.setAttribute("contentPage", "YJ/cartPage.jsp");
			
			
			return "2Team/t2_index";
		}
	
	
	

}
