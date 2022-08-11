package com.team12.main.team1.shop;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartTeam1DAO {

	@Autowired
	private SqlSession ss;
		// add Cart
			public void addCart(CartDTO c, HttpServletRequest req) {			
				//**********				
				String Cart_userID = "testID";
				int cart_product_Num = 00001;
				int Cart_ProductQuantity = 51;
				
				c.setCart_userID(Cart_userID);
				c.setCart_product_Num(cart_product_Num);
				c.setCart_ProductQuantity(Cart_ProductQuantity);
				//**********
				
				int result = ss.getMapper(Cartteam1Mapper.class).addCart(c);
				System.out.println("결과: "+result);	
			}

	
	
	
	
	
	
	
	
	
	

}
