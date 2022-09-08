package com.team12.main.t2.shop;

import java.util.List;


public interface ProductMapper {


	void regProduct(Product p);

	public Product getProduct(Product p);

	void updateProduct(Product p);

	public List<Product> realGetAllProduct();

	int deleteProduct(Product p);

	public List<Product> getPetProduct(Product p);

	public List<Snack> getSnack(Product p);

	public List<Toy> getToy(Product p);

	public List<Product> getAllProduct(Product p);

	int countProduct(Product p);

	public List<OrderDTO> getOrderbyPayment(OrderDTO o);

	int updateDeliverState(OrderDTO o);

	public List<OrderDTO> getOrderbyUserID(OrderDTO o);

	int countOrder(OrderDTO o);

	int countAllOrder(OrderDTO o);

	int deleteMyOrder(OrderDTO o);




	

}
