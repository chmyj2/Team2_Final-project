package com.team12.main.t2.shop;

public class PurchasedProduct {

	private String productThumbnail;
	private String productName;
	private String productPrice;
	private String cart_ProductQuantity;
	private String cartNum;
	private String productNum;
	
	
	public PurchasedProduct() {
		// TODO Auto-generated constructor stub
	}


	public PurchasedProduct(String productThumbnail, String productName, String productPrice,
			String cart_ProductQuantity, String cartNum, String productNum) {
		super();
		this.productThumbnail = productThumbnail;
		this.productName = productName;
		this.productPrice = productPrice;
		this.cart_ProductQuantity = cart_ProductQuantity;
		this.cartNum = cartNum;
		this.productNum = productNum;
	}


	public String getProductThumbnail() {
		return productThumbnail;
	}


	public void setProductThumbnail(String productThumbnail) {
		this.productThumbnail = productThumbnail;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public String getProductPrice() {
		return productPrice;
	}


	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}


	public String getCart_ProductQuantity() {
		return cart_ProductQuantity;
	}


	public void setCart_ProductQuantity(String cart_ProductQuantity) {
		this.cart_ProductQuantity = cart_ProductQuantity;
	}


	public String getCartNum() {
		return cartNum;
	}


	public void setCartNum(String cartNum) {
		this.cartNum = cartNum;
	}


	public String getProductNum() {
		return productNum;
	}


	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}


	
}