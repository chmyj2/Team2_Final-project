package com.team12.main.team1.shop;

import java.util.List;

public interface Cartteam1Mapper {
	
	/* 카트 추가 */
	public int addCart(CartDTO cartDTO) throws Exception;
	
	/* 카트 삭제 */
	public int deleteCart(int Num_PK);
	
	/* 카트 수량 수정 */
	public int modifyCount(CartDTO cartDTO);
	
	/* 카트 목록 */
	public List<CartDTO> getCart(String Cart_userID);	
	
	/* 카트 확인 */
	public CartDTO checkCart(CartDTO cartDTO);
	
	

}
