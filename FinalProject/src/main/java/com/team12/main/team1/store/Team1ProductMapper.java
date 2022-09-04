package com.team12.main.team1.store;

import java.util.List;
import java.util.Map;

public interface Team1ProductMapper {



	int productReg(Team1ProductDTO p);

	List<Team1ProductDAO> getProductList(Team1ProductDTO product);

	Team1ProductDTO getProduct(Team1ProductDTO p);


}
