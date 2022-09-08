package com.team12.main.t2.shop;

import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

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

	}


	// 카트 받기
	public void getCart(HttpServletRequest request,String cart_UserID) {

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
		String[] productNum = null;
		PurchasedProduct p = new PurchasedProduct();
		ArrayList<PurchasedProduct> purchasedProducts = new ArrayList<PurchasedProduct>();
		
		if (request.getParameterValues("cartNum") == null) {
			for (int i = 0; i < prices.length; i++) {
				p.setProductThumbnail(thumbnails[i]);
				p.setProductName(names[i]);
				p.setProductPrice(prices[i]);
				p.setCart_ProductQuantity(quantitys[i]);
				p.setProductNum(request.getParameter("productNum"));
				purchasedProducts.add(p);
			}
			
		}else {
			productNum = request.getParameterValues("productNum");
			cartNum = request.getParameterValues("cartNum");
			for (int i = 0; i < prices.length; i++) {
				p = new PurchasedProduct(thumbnails[i], names[i], prices[i], quantitys[i],cartNum[i],productNum[i]);
				purchasedProducts.add(p);
				
			}
			
		};
		
		
		request.setAttribute("purchasedProducts", purchasedProducts);
		
		
	}
	
	
	// 구매완료한 제품 장바구니삭제
	public void deletePurchasedProduct(String[] cartNumArr) {
		
		Cart c = new Cart();
		for (int i = 0; i < cartNumArr.length; i++) {
			c.setCartNum(Integer.parseInt(cartNumArr[i]));
			System.out.println(c.getCartNum());
			ss.getMapper(ProductCartMapper.class).deleteCart(c);
			System.out.println("삭제성공");
		}
		
		
		
	}

	
	// 구매완료 후 재고 수정
	public void updatePurchasedProduct(String[] productNumArr, String[] quantityArr) {

		Product p = new Product();
		
			for (int i = 0; i < productNumArr.length; i++) {
				p.setProductNum(Integer.parseInt(productNumArr[i]));
				p.setCart_ProductQuantity(Integer.parseInt(quantityArr[i]));
				ss.getMapper(ProductCartMapper.class).updatePurchasedProduct(p);
				System.out.println("재고수정성공");
		}
		
	}

	
	// 주문테이블 등록
	public void insertPurchasedProduct(HttpServletRequest request, String[] productNumArr, String[] quantityArr, String shipAddress,
			String phoneNum, String billState, String billState1, String billState2, String memo, String[] pricekArr,
			String totalPrice, String recipient, String[] thumbnailArr) {

		
		OrderDTO o = new OrderDTO();
		
		String productNum = "";
		String quantity = "";
		String price = "";
		String thumbnail = "";
		String address = billState + "!" + billState1 + "!" + billState2;
		
		
		
		for (String a : productNumArr) {
			productNum += a + "!";
		}
		
		for (String b : quantityArr) {
			quantity += b + "!";
		}
		
		for (String c : pricekArr) {
			price += c + "!";
		}
		
		for (String d : thumbnailArr) {
			thumbnail += d + "!";
		}
		
		
		Random rand = new Random();
		
			String temp = Integer.toString( rand.nextInt(10) + 1);
			for (int i = 0; i < 9; i++) {
			    temp+= Integer.toString(rand.nextInt(11));
			}
			
		
		o.setOrder_Num(temp);
		o.setOrder_User_ID(shipAddress);
		o.setOrder_ProductNum(productNum);
		o.setOrder_PhoneNumber(phoneNum);
		o.setProduct_Quantity(quantity);
		o.setShipping_Address(address);
		if (memo == "") {
			o.setShipping_Memo("빠른 배송부탁드립니다.");
		}else {
			o.setShipping_Memo(memo);
		}
		o.setProduct_Price(price);
		o.setOrder_TotalPrice(totalPrice);
		o.setRecipient(recipient);
		o.setThumbnail(thumbnail);
		
		
		if ( ss.getMapper(ProductCartMapper.class).insertPurchasedProduct(o) == 1) {
			System.out.println("등록 성공");
		}else {
			System.out.println("등록 실패");
		}
		
		
		
		request.setAttribute("order_Num", temp);
		
		
		
		}


	public void getCart2(HttpServletRequest request) {
		
		Cart c = new Cart();
		
		if (request.getParameter("member_ID") == null) {
			c.setCart_UserID(request.getParameter("vet_ID"));
		}else {
			c.setCart_UserID(request.getParameter("member_ID"));
		}

		request.setAttribute("Product", ss.getMapper(ProductCartMapper.class).getProductFromCart(c));
		
		
		
	}


	public String getOrderNum(OrderDTO o) {
		
		return ss.getMapper(ProductCartMapper.class).getOrderNum(o);
	}


	public void getOrder(OrderDTO o, HttpServletRequest request) {
		request.setAttribute("order", ss.getMapper(ProductCartMapper.class).getOrder(o));
		
	}
	
	





	
	




}
