package com.team12.main.team1.shop;

import java.util.List;

public interface Shopteam1Mapper {

	int regProduct(ProductDTO p);

	List<ProductDTO> loadProducts();

	List<ProductDTO> loadProductsByCategory(ProductDTO p);

	List<ProductDTO> searchProductsByWord(ProductDTO p);

}
