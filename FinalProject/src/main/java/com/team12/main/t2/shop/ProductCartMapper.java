package com.team12.main.t2.shop;

import java.util.List;

public interface ProductCartMapper {

	int regCart(Cart c);

	public List<Product> getProductFromCart(Cart c);

	int deleteCart(Cart c);

	void updatePurchasedProduct(Product p);

	int insertPurchasedProduct(OrderDTO o);

	String getOrderNum(OrderDTO o);

	OrderDTO getOrder(OrderDTO o);
	
}
