package com.team12.main.t2.regProduct;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class ProductDAO {
	
	@Autowired
	private SqlSession ss;

	public void regProduct(Product p, HttpServletRequest request) {
		
//		String path = request.getSession().getServletContext().getRealPath("resources/files");
//		MultipartRequest mr = null;
//		try {
//			mr = new MultipartRequest(request, path, 10 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("result", "가입실패");
//			return;
//		}
//
//		try {
//			String jm_id = mr.getParameter("m_id");
//			String jm_pw = mr.getParameter("m_pw");
//			String jm_name = mr.getParameter("m_name");
//			String jm_addr1 = mr.getParameter("m_addr1");
//			String jm_addr2 = mr.getParameter("m_addr2");
//			String jm_addr3 = mr.getParameter("m_addr3");
//			
//			String jm_addr = jm_addr1 + "!" + jm_addr2 + "!" + jm_addr3;
//			
//			String jm_photo = mr.getFilesystemName("m_photo");
//			//jm_photo = URLEncoder.encode(jm_photo, "utf-8");
//			//jm_photo = jm_photo.replace("+", " ");
//			
//			p.setM_id(jm_id);
//			p.setM_pw(jm_pw);
//			p.setM_name(jm_name);
//			p.setM_addr(jm_addr);
//			p.setM_photo(jm_photo);
//
//			if (ss.getMapper(MemberMapper.class).join(p) == 1) {
//				request.setAttribute("result", "가입성공");
//			} else {
//				request.setAttribute("result", "가입실패");
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			String fileName = mr.getFilesystemName("m_photo");
//			new File(path + "/" + fileName).delete();
//			request.setAttribute("result", "가입실패");
//		}
//		
//		
//		
//		
//		
//		
//	        List<MultipartFile> fileList = mr.getFilesystemName("file");
//	        String src = mtfRequest.getParameter("src");
//	        System.out.println("src value : " + src);
//
//	        String path = "C:\\image\\";
//
//	        for (MultipartFile mf : fileList) {
//	            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
//	            long fileSize = mf.getSize(); // 파일 사이즈
//
//	            System.out.println("originFileName : " + originFileName);
//	            System.out.println("fileSize : " + fileSize);
//
//	            String safeFile = path + System.currentTimeMillis() + originFileName;
//	            try {
//	                mf.transferTo(new File(safeFile));
//	            } catch (IllegalStateException e) {
//	                // TODO Auto-generated catch block
//	                e.printStackTrace();
//	            } catch (IOException e) {
//	                // TODO Auto-generated catch block
//	                e.printStackTrace();
//	            }
//	        }
//
//	        return "redirect:/";
//	    }
//		
//		
//		
		
		
		
	}
	
	
	
	
	
}
