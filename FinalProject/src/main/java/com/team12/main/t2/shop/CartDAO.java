package com.team12.main.t2.shop;

import java.net.InetAddress;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartDAO {

	@Autowired
	private SqlSession ss;

	public int reqCart(Cart c) {

		try {

			if (c.getCart_UserID().equals("비회원")) {
				InetAddress myIP = InetAddress.getLocalHost();

				// getHostAddress() 사용중인 PC의 IP주소를 얻어온다.
				String strIPAddress = myIP.getHostAddress();
				c.setCart_UserID(strIPAddress);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return ss.getMapper(ProductCartMapper.class).regCart(c);

//		if (c.getCart_UserID().equals("비회원")) {
//		
//		Random rand = new Random();
//
//		String temp = Integer.toString( rand.nextInt(8) + 1);
//
//		for (int i = 0; i < 7; i++) {
//		    temp+= Integer.toString(rand.nextInt(9));
//		}
//		
//		System.out.println(temp);
//		c.setCart_UserID(temp);
//		}

	}

	public boolean checkCart(Cart c) {

		try {

			InetAddress myIP = InetAddress.getLocalHost();

			// getHostAddress() 사용중인 PC의 IP주소를 얻어온다.
			String strIPAddress = myIP.getHostAddress();
			c.setCart_UserID(strIPAddress);

		} catch (Exception e) {
			// TODO: handle exception
		}
		// 체킹하기
		if (ss.getMapper(ProductCartMapper.class).checkCart(c) == 1) {
			System.out.println("asdasd");

			return true;

		}

		return false;

	}

	// 카트 받기
	public void getCart(HttpServletRequest request, int productNum, String cart_UserID) {

		System.out.println(productNum);
		Cart c = new Cart();
		c.setCart_UserID(cart_UserID);

		request.setAttribute("Product", ss.getMapper(ProductCartMapper.class).getProductFromCart(c));

	}

	// 카드 삭제
	public int deleteCart(Cart c) {

		if (ss.getMapper(ProductCartMapper.class).deleteCart(c) == 1) {
			return 1;

		} else {
			return 0;
		}

	}

	public void goPurchasePage(HttpServletRequest request) {

		
		String[] thumbnails = request.getParameterValues("thumbnail");
		String[] names = request.getParameterValues("name");
		String[] prices = request.getParameterValues("price");
		String[] quantitys = request.getParameterValues("quantity");
		String[] cartNum = null;
		PurchasedProduct p = new PurchasedProduct();
		ArrayList<PurchasedProduct> purchasedProducts = new ArrayList<PurchasedProduct>();
		
		if (request.getParameterValues("cartNum") == null) {
			for (int i = 0; i < prices.length; i++) {
				p.setProductThumbnail(thumbnails[i]);
				p.setProductName(names[i]);
				p.setProductPrice(prices[i]);
				p.setCart_ProductQuantity(quantitys[i]);
				purchasedProducts.add(p);
			}
			
		}else {
			String[] productNum = request.getParameterValues("productNum");
			cartNum = request.getParameterValues("cartNum");
			for (int i = 0; i < prices.length; i++) {
				p = new PurchasedProduct(thumbnails[i], names[i], prices[i], quantitys[i],cartNum[i],productNum[i]);
				purchasedProducts.add(p);
				
			}
			
		};
		
		
		request.setAttribute("purchasedProducts", purchasedProducts);
		
		
	}

	public void deletePurchasedProduct(String[] cartNumArr) {
		Cart c = new Cart();
		for (int i = 0; i < cartNumArr.length; i++) {
			c.setCartNum(Integer.parseInt( cartNumArr[i]));
			ss.getMapper(ProductCartMapper.class).deletePurchasedProduct(c);
		}
		
		
		
	}

}
