package com.team12.main.team1.store;

import java.util.List;
import java.util.Map;

import com.team12.main.t2.shop.Product;
import com.team12.main.t2.shop.Snack;
import com.team12.main.t2.shop.Toy;

public interface Team1ProductMapper {



	int productReg(Team1ProductDTO p);

	List<Team1ProductDAO> getProductList(Team1ProductDTO product);
	
	Team1ProductDTO getProduct(Team1ProductDTO p);

	List<Team1ProductDAO> getFoodProduct(Team1ProductDTO product);

	List<Team1ProductDAO> getToyProduct(Team1ProductDTO p);

	int orderInsert(Order o);

	List<Order> getOrderList(Order o);


}
