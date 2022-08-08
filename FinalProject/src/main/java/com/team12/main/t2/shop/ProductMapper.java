package com.team12.main.t2.shop;

import java.util.List;


public interface ProductMapper {

	public List<Product> getAllProduct();

	void regProduct(Product p);

	public Object getProduct(Product p);




	

}
