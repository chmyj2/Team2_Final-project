package com.team12.main.t2.hospital;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team12.main.t2Login.Membert2;


@Service
public class HospitalDAO {

    @Autowired
    private SqlSession ss;

    
    public void hospitalView(HttpServletRequest req, HospitalDTO hDTO) {

        Hospital_ListMapper hlm = ss.getMapper(Hospital_ListMapper.class);

        req.setAttribute("Hospital",hlm.getDetailview(hDTO));

    }


	public void petinfoView(HttpServletRequest req, Membert2 m2) {
		
		Hospital_ListMapper hlm = ss.getMapper(Hospital_ListMapper.class);
		
		req.setAttribute("petDTO", hlm.getPetinfo(m2));
		
	}


	public void hopitalReserve(HttpServletRequest req, reserveDTO rDTO) {
		
			
			
		try {
			
		String mbDate =req.getParameter("mbDate");
		String pbDate =req.getParameter("pbDate");
		String rdDate =req.getParameter("rdDate");
		
		
		rDTO.setReserve_memberBirth(mbDate);
		rDTO.setReserve_petBirth(pbDate);
		rDTO.setReserve_date(rdDate);
		
		System.out.println(rDTO.getReserve_memberBirth());
		System.out.println(rDTO.getReserve_petBirth());
		System.out.println(rDTO.getReserve_date());
		
		if(ss.getMapper(Hospital_ListMapper.class).setReverse(rDTO) == 1 ) {
			
			System.out.println("성공");
			
		}else {
			System.out.println("실패");
		}
		
		
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


	public void hospitalReserveView(HttpServletRequest req, Membert2 m2) {
		
		Hospital_ListMapper hlm = ss.getMapper(Hospital_ListMapper.class);
		
		req.setAttribute("reserveView", hlm.getReserveinfo(m2));
		
	}




	
    
}

