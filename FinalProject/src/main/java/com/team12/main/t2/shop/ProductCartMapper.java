package com.team12.main.t2.shop;

import java.util.List;

public interface ProductCartMapper {

	int regCart(Cart c);

	int checkCart(Cart c);


	public List<Product> getProductFromCart(Cart c);

}
