package com.team12.main.t2.shop;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team12.main.t2Login.LoginDAO;

@Controller
public class ProductCartController {
	
	@Autowired
	private ProductDAO pDAO;
	
	@Autowired
	private LoginDAO lDAO;
	
	@Autowired
	private CartDAO cDAO;
	
	
	
	
	
	// 이동--------------------------------------------------------------------------------------------------------------------------
	
	// 장바구니 가기
		@RequestMapping(value = "/CartView.go", method = RequestMethod.GET)
		public String viewProductPage(HttpServletRequest request,Product p,Cart c,
				@RequestParam("productNum") int productNum,@RequestParam("cart_UserID") String cart_UserID) {
				
			// 장바구니 가져오기
			pDAO.getProduct(request,p);
			cDAO.getCart(request,productNum,cart_UserID);
			if (lDAO.loginCheck(request)) {
				
				request.setAttribute("contentPage", "YJ/cartPage.jsp");
			}else {
				request.setAttribute("contentPage", "YJ/purchasePageCheckMember.jsp");
					
			}
				
			return "2Team/t2_index";
			}
	
		
		@RequestMapping(value = "/purchasePage.go", method = RequestMethod.GET)
		public String test(HttpServletRequest request,Product p) {
			
			if (lDAO.loginCheck(request)) {
			// 장바구니 가져오기
			lDAO.splitAddr(request);
			cDAO.goPurchasePage(request);
			request.setAttribute("contentPage", "YJ/purchasedPage.jsp");
			}else {
				request.setAttribute("contentPage", "YJ/purchasePageCheckMember.jsp");
			}
			return "2Team/t2_index";
		}
	
	
	
	
			
			
			
	// 기능--------------------------------------------------------------------------------------------------------------------------
	
	
	
		// 장바구니 추가
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
	
	
	
		
		// 장바구니 삭제
		@ResponseBody
		@RequestMapping(value = "/delete.cart", method = RequestMethod.GET)
		public int deleteCart(HttpServletRequest request,Cart c) {
			
			// 상품 카드에 저장하는 일
			return cDAO.deleteCart(c);
		}
		
		
		
		// 카카오결재
		
		@ResponseBody
		@RequestMapping(value = "/kakaopay", method = RequestMethod.POST)
		public String kakaopay(@RequestParam("totalPrice")int totalPrice) {
			System.out.println(totalPrice);
			try {
				// 보내는 부분
				URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
				HttpURLConnection connection = (HttpURLConnection) address.openConnection(); // 서버연결
				connection.setRequestMethod("POST");
				connection.setRequestProperty("Authorization", "KakaoAK d83f64974e606d9bd2534f65748965b0"); // 어드민 키
				connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
				connection.setDoOutput(true); // 서버한테 전달할게 있는지 없는지
				String parameter = "cid=TC0ONETIME" // 가맹점 코드
						+ "&partner_order_id=partner_order_id" // 가맹점 주문번호
						+ "&partner_user_id=partner_user_id" // 가맹점 회원 id
						+ "&item_name=테스트" // 상품명
						+ "&quantity=1" // 상품 수량
						+ "&total_amount="+ totalPrice // 총 금액
						+ "&vat_amount=0" // 부가세
						+ "&tax_free_amount=0" // 상품 비과세 금액
						+ "&approval_url=http://localhost:8080/main/kakaoSuccess" // 결제 성공 시
						+ "&fail_url=http://localhost:8080/kakaoPayCancel" // 결제 실패 시
						+ "&cancel_url=http://localhost:8080/kakaoPaySuccessFail"; // 결제 취소 시
				OutputStream send = connection.getOutputStream(); // 이제 뭔가를 를 줄 수 있다.
				DataOutputStream dataSend = new DataOutputStream(send); // 이제 데이터를 줄 수 있다.
				dataSend.writeBytes(parameter); // OutputStream은 데이터를 바이트 형식으로 주고 받기로 약속되어 있다. (형변환)
				dataSend.close(); // flush가 자동으로 호출이 되고 닫는다. (보내고 비우고 닫다)
				
				int result = connection.getResponseCode(); // 전송 잘 됐나 안됐나 번호를 받는다.
				InputStream receive; // 받다
				
				if(result == 200) {
					receive = connection.getInputStream();
				}else {
					receive = connection.getErrorStream(); 
				}
				// 읽는 부분
				InputStreamReader read = new InputStreamReader(receive); // 받은걸 읽는다.
				BufferedReader change = new BufferedReader(read); // 바이트를 읽기 위해 형변환 버퍼리더는 실제로 형변환을 위해 존제하는 클레스는 아니다.
				// 받는 부분
				return change.readLine(); // 문자열로 형변환을 알아서 해주고 찍어낸다 그리고 본인은 비워진다.
				
			} catch (MalformedURLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "";
		}
		
		
		
		
		// 구매 후 DB에서 상품 삭제
		@ResponseBody
		@RequestMapping(value = "/delete.purchasedProduct", method = RequestMethod.GET)
		public int deletePurchasedProduct(HttpServletRequest request) {
		
			// 상품 카드에서 삭제하는 일
		
			String productNumArr = request.getParameter("productNumArr");
			System.out.println(productNumArr);
			
			//return cDAO.deletePurcahsedCart();
			return 0 ;
		}
		
		
		
		
		// 자식창 이동
		@RequestMapping(value = "/kakaoSuccess", method = RequestMethod.GET)
		public String kakaoSuccess(HttpServletRequest request) {
		return "2Team/YJ/kakaoPayClose";
		}
		
		
		
		
		// 장바구니 삭제
		@RequestMapping(value = "/deleteAndInserPurchasedProduct", method = RequestMethod.GET)
		public String deleteCart(HttpServletRequest request,@RequestParam("cartNumArr") String [] cartNumArr) {
			System.out.println("여기까지오냐");
			cDAO.deletePurchasedProduct(cartNumArr);
			lDAO.loginCheck(request);
			
			request.setAttribute("contentPage", "YJ/paymentSuccess.jsp");
			
			return "2Team/t2_index";
		}
	

}
