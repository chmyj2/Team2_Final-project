package com.team12.main.team1.join;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;



@Service
public class MemberDAO {
	
	@Autowired
	private SqlSession ss;
	

	public void join(Member m, HttpServletRequest req){
		// TODO Auto-generated method stub
		
		       
			
		
			String jm_address1 = req.getParameter("m_addr1");
			String jm_address2 = req.getParameter("m_addr2");
			String jm_address3 = req.getParameter("m_addr3");
			
			String jm_addr = jm_address1 + "!" + jm_address2  + "!" + jm_address3;
			
		
			Date jm_date = Date.valueOf(req.getParameter("member_birth"));


			m.setMember_ID(req.getParameter("member_ID"));
			m.setMember_PW(req.getParameter("member_PW"));
			m.setMember_name(req.getParameter("member_name"));
			m.setMember_birth(jm_date);
			m.setMember_sex(req.getParameter("member_sex"));
			m.setMember_phoneNum(req.getParameter("member_phoneNum"));
	        m.setMember_address(jm_addr);
	        m.setMember_email(req.getParameter("member_email"));



	if (ss.getMapper(Team1joinMapper.class).join(m) == 1) {
		req.setAttribute("result", "가입성공");
	} else {
		req.setAttribute("result", "가입실패");
	}
		      
} 


	public void login(Member m, HttpServletRequest req) {
		// TODO Auto-generated method stub
		m.setMember_linkWhere(1);
		Member dbMember = ss.getMapper(Team1joinMapper.class).getMemberByID(m);
		if (dbMember != null) {
			if (m.getMember_PW().equals(dbMember.getMember_PW())) {
				req.getSession().setAttribute("loginMember", dbMember);
				req.getSession().setMaxInactiveInterval(60 * 10);
			} else {
				req.setAttribute("result", "로그인 실패(PW오류)");
			}
		} else {
			req.setAttribute("result", "로그인 실패(미가입ID)");
		}
		
		
		
	}

	public boolean loginCheck(HttpServletRequest req) {
		Member m = (Member) req.getSession().getAttribute("loginMember");
		if (m != null) {
			req.setAttribute("loginPage", "../LDH/loginSuccess.jsp");
			return true;
		} 
			req.setAttribute("loginPage", "../LDH/beforeLogin.jsp");
			return false;
		}
	
	public void splitAddr(HttpServletRequest req) {
		Member m = (Member) req.getSession().getAttribute("loginMember");
		String jm_addr = m.getMember_address();
		String[] jm_addr2 = jm_addr.split("!");
		req.setAttribute("addr", jm_addr2);

	}

	public void logout(HttpServletRequest req) {
		// TODO Auto-generated method stub
		req.getSession().setAttribute("loginMember", null);
	}

	
	
	
	
	
	public void update(Member m, HttpServletRequest req) {
		// TODO Auto-generated method stub
		
	try {
		
	
		String jm_address1 = req.getParameter("jm_addr1");
		String jm_address2 = req.getParameter("jm_addr2");
		String jm_address3 = req.getParameter("jm_addr3");

		String jm_addr = jm_address1 + "!" + jm_address2 + "!" + jm_address3;


		m.setMember_ID(req.getParameter("jm_id"));
		m.setMember_PW(req.getParameter("jm_pw"));
		m.setMember_name(req.getParameter("jm_name"));
		m.setMember_phoneNum(req.getParameter("jm_pNum"));
   
		m.setMember_address(jm_addr);
        m.setMember_email(req.getParameter("jm_email"));
		
//        System.out.println(m.getMember_ID());
//        System.out.println(m.getMember_PW());
//        System.out.println(m.getMember_name());
//        System.out.println(m.getMember_phoneNum());
//        System.out.println(jm_addr);
//        System.out.println(m.getMember_email());
//        



		if (ss.getMapper(Team1joinMapper.class).update(m) == 1) {
			req.setAttribute("result", "수정성공");
			req.getSession().setAttribute("loginMember", m);
		} else {
			req.setAttribute("result", "수정실패");
		}
	} catch (Exception e) {
		e.printStackTrace();
		req.setAttribute("result", "수정실패");
		// TODO: handle exception
	}
		
	}
	

	public void bye(HttpServletRequest req) {
		// TODO Auto-generated method stub
		
		try {
			Member m = (Member) req.getSession().getAttribute("loginMember");

			//int msgCount = ss.getMapper(SNSMapper.class).getMsgCountByOwner(m);
			//int allMsgCount = sDAO.getAllMsgCount();

			if (ss.getMapper(Team1joinMapper.class).bye(m) == 1) {
				req.setAttribute("result", "탈퇴성공");

				//sDAO.setAllMsgCount(allMsgCount - msgCount);

				String path = req.getSession().getServletContext().getRealPath("resources/files");
//				String jm_photo = m.getM_photo();
//				jm_photo = URLDecoder.decode(jm_photo, "utf-8");
//				new File(path + "/" + jm_photo).delete();

				logout(req);
				loginCheck(req);
			} else {
				req.setAttribute("result", "탈퇴실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "탈퇴실패");
		}
		
	}
	
	

	public int getMemberNum(Member m, HttpServletRequest req) {
		//System.out.println(ss.getMapper(MemberMapper.class).getMemberNum(m));
		return ss.getMapper(Team1joinMapper.class).getMemberNum(m);
	}
	
	
	
	
	// 카카오 토큰 가져오기
	private String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로

            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=64c1168aec7c4fd20862f02cda8f9856");  //본인이 발급받은 key
            sb.append("&redirect_uri=http://localhost:8080/main/member.kakao");     // 본인이 설정해 놓은 경로
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();

            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return access_Token;
    }
	
	// 카카오 유저 정보 가져오기
	private HashMap<String, Object>  getUserInfo (String access_Token) {

        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
//            String profile_image = properties.getAsJsonObject().get("profile_image").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();

            userInfo.put("nickname", nickname);
            userInfo.put("email", email);
//            userInfo.put("profile_image", profile_image);

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return userInfo;
    }

	
	public void joinKakao(HttpServletRequest req, String code) {
		String tempToken = getAccessToken(code);
		HashMap<String, Object> userInfo = getUserInfo(tempToken);
		 
//		kakaoMember tempMember = new kakaoMember();
//		tempMember.setK_acTokken(tempToken);
//		tempMember.setK_nickname(userInfo.get("nickname").toString());
//		tempMember.setK_email(userInfo.get("email").toString());
//		tempMember.setK_memberID("");
		
		Member tempMember = new Member();
		tempMember.setMember_ID("");
		tempMember.setMember_name(userInfo.get("nickname").toString());
		tempMember.setMember_email(userInfo.get("email").toString());
		tempMember.setMember_sex("");
		tempMember.setMember_address("");
		tempMember.setMember_PW("");
		tempMember.setMember_linkWhere(3);
		tempMember.setMember_phoneNum("");
		
		
		
		
		
		ss.getMapper(Team1joinMapper.class).kakaoJoin(tempMember);
	}
	
//	String member_ID =req.getParameter("member_ID");
//	String member_name = req.getParameter("member_name");
//	String member_email = req.getParameter("member_email");
//	String member_sex = req.getParameter("member_sex");
//	
//	String member_address = " ";
//	String member_PW = " ";
//	int member_linkWhere = 3;
//	String member_phoneNum = " "; 
//	
//	
//	m.setMember_ID(member_ID);
//	m.setMember_PW(member_PW);
//	m.setMember_linkWhere(member_linkWhere);
//	m.setMember_name(member_name);
//	m.setMember_sex(member_sex);
//	m.setMember_phoneNum(member_phoneNum);
//	m.setMember_email(member_email);
//	m.setMember_address(member_address);
//	m.setMember_birth(null);
//	
	
	}

		