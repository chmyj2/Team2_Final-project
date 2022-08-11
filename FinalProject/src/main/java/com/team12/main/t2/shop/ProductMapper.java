package com.team12.main.t2.shop;

import java.util.List;


public interface ProductMapper {

	public List<Product> getAllProduct(Product p);

	void regProduct(Product p);

	public Object getProduct(Product p);

	void updateProduct(Product p);

	public List<Product> realGetAllProduct();

	int deleteProduct(Product p);


	

}
