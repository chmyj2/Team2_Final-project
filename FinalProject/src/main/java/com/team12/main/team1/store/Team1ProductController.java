package com.team12.main.team1.store;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team12.main.team1.join.MemberDAO;
import com.team12.main.team1.shop.review.Team1ReviewDAO;
import com.team12.main.team1.shop.review.Team1ReviewDTO;

@Controller
public class Team1ProductController {

	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
    private Team1ReviewDAO rDAO;
	
	@Autowired
	private Team1ProductDAO mpDAO;
	
	// 마스터 상품등록 페이지 이동
	@RequestMapping(value = "/master.reg", method = RequestMethod.GET)
	public String masterReg(HttpServletRequest req) {
		
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "master/masterProductUpdate.jsp");
		
		return "1Team/t1_index";
	}
	
	
	// 상품등록하기
	@RequestMapping(value = "/master.create", method = RequestMethod.POST)
	public String masterCreate(HttpServletRequest req, MultipartHttpServletRequest mr,@RequestParam("product_detail")List<MultipartFile> multiFileList ) {
		
		mDAO.loginCheck(req);
		mpDAO.productReg(req, mr,multiFileList);
		req.setAttribute("contentPage", "master/masterProductUpdate.jsp");
		
		return "1Team/t1_index";
	}
	
	
		@RequestMapping(value="/enter.team1StoreFor", method = RequestMethod.GET)
		public String shopEntering(Team1ProductDTO product, HttpServletRequest req,@RequestParam("product_sub_category2") String product_sub_category2) {
				
			mDAO.loginCheck(req);
			
			// 모든 상품 불러오기
			mpDAO.showAllProduct(req,product);
			mpDAO.getfood(req,product);
			mpDAO.getProduct(req,product_sub_category2,product);
			
			if (req.getParameter("product_category").equals("dog")) {
				req.setAttribute("contentPage", "master/team1ShopForDog.jsp");
				
			}else {
				req.setAttribute("contentPage", "master/team1ShopForCat.jsp");
				
			}
			
			return "1Team/t1_index";
		}
	
	
		// 상품 디테일 페이지로 이동
		@RequestMapping(value="/get.aProductTeam1",method = RequestMethod.GET )
		public String detailAProduct(Team1ReviewDTO review, Team1ProductDTO p, HttpServletRequest req, Order o){
			
			//로그인체크
			mDAO.loginCheck(req);
			
			//리뷰 리스트 가져오기
	        rDAO.showReviewList(req, review);
	        
	        //전체 리뷰 평균 가져오기
	        rDAO.showAllReviewAvg(req);
			
			//상품 하나 가져오기
			mpDAO.loadAProduct(p,req);
			
			
			req.setAttribute("contentPage", "master/team1shopProductDetail.jsp");
			return "1Team/t1_index";
		}
		
		
	
		// 구매 페이지로 이동
		@RequestMapping(value="/purchasePage.go_team1",method = RequestMethod.GET )
		public String purchasePageGo_team1(Team1ReviewDTO review, Team1ProductDTO p, HttpServletRequest req){
			
			//로그인체크
			if (mDAO.loginCheck(req)) {
				
				//리뷰 리스트 가져오기
				
				
				//상품 하나 가져오기
				mpDAO.loadAProduct(p,req);
				
				mDAO.splitAddr(req);
				req.setAttribute("contentPage", "master/purchasePage.jsp");
				
			} else {
				req.setAttribute("contentPage", "../LDH/loginAndJoin.jsp");
			}
			return "1Team/t1_index";
		}
		
		
		
		// 카카오결재
		
				@ResponseBody
				@RequestMapping(value = "/team1_kakaopay", method = RequestMethod.POST)
				public String kakaopay(@RequestParam("totalPrice")int totalPrice) {
					System.out.println(totalPrice);
			try {
				// 보내는 부분
				URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
				HttpURLConnection connection = (HttpURLConnection) address.openConnection(); // 서버연결
				connection.setRequestMethod("POST");
				connection.setRequestProperty("Authorization", "KakaoAK 0b70a228ec23532e2f3fc3ea484264bd"); // 어드민 키
				connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
				connection.setDoOutput(true); // 서버한테 전달할게 있는지 없는지
				String parameter = "cid=TC0ONETIME" // 가맹점 코드
						+ "&partner_order_id=partner_order_id" // 가맹점 주문번호
						+ "&partner_user_id=partner_user_id" // 가맹점 회원 id
						+ "&item_name=댕스티니" // 상품명
						+ "&quantity=1" // 상품 수량
						+ "&total_amount="+ totalPrice // 총 금액
						+ "&vat_amount=0" // 부가세
						+ "&tax_free_amount=0" // 상품 비과세 금액
						+ "&approval_url=http://localhost:8080/main/Team1kakaoSuccess" // 결제 성공 시
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
				
				// 자식창 이동
				@RequestMapping(value = "/Team1kakaoSuccess", method = RequestMethod.GET)
				public String kakaoSuccess(HttpServletRequest request) {
				return "1Team/master/kakaoPayClose";
				}
				
				
				// 구매완료 페이지로 이동
				@RequestMapping(value = "/team1PaymentSuccess.go", method = RequestMethod.GET)
				public String team1PaymentSuccess(HttpServletRequest request) {
					System.out.println("여기까지오냐");
					mDAO.loginCheck(request);
					
					request.setAttribute("contentPage", "master/team1PaymentSuccess.jsp");
					
					return "1Team/t1_index";
				}
					
				
					//주문 저장
					@RequestMapping(value="/orderInsert.do",method = RequestMethod.GET )
					public String orderInsertDo(HttpServletRequest req,Order o,@RequestParam("billState") String billState,
							@RequestParam("billState") String billState1,
							@RequestParam("billState") String billState2){
						
						mpDAO.insertOrder(req,o,billState,billState1,billState2);
						
						return "redirect:orderRedirect.go";
					}
					
					
					@RequestMapping(value="/orderRedirect.go",method = RequestMethod.GET )
					public String orderRedirectGo(HttpServletRequest req){
						
						System.out.println("요기옴?");
						mDAO.loginCheck(req);
						
						req.setAttribute("contentPage", "master/team1PaymentSuccess.jsp");
						return "1Team/t1_index";
					}
					
					@RequestMapping(value="/Purchased.Info",method = RequestMethod.GET )
					public String orderRedirectGo(HttpServletRequest req, Order o){
						
						mDAO.loginCheck(req);
						mpDAO.getOrder(req,o);
						
						req.setAttribute("contentPage", "master/team1OrderInfo.jsp");
						return "1Team/t1_index";
					}
					
					
					
					
			
	
}
