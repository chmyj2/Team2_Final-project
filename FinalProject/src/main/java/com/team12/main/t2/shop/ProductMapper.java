package com.team12.main.t2.shop;

import java.util.List;


public interface ProductMapper {


	void regProduct(Product p);

	public Object getProduct(Product p);

	void updateProduct(Product p);

	public List<Product> realGetAllProduct();

	int deleteProduct(Product p);

	public List<Product> getPetProduct(Product p);

	public List<Snack> getSnack(Product p);

	public List<Toy> getToy(Product p);


	

}
