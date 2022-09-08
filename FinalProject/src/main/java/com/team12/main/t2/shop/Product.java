package com.team12.main.t2.shop;

public class Product {
	 private int productNum;
	 private String pet_category;
	 private String toy_category;
	 private String productName;
	 private int productPrice;
	 private String productInfo;
	 private int productStock;
	 private String onExhibition;
	 private String productThumbnail;
	 private String productImg;
	 private String productTag;
	 private int cart_ProductQuantity;
	 private int cartNum;
	 private int start;
	 private int end;
	 
	 
	 public Product() {
		// TODO Auto-generated constructor stub
	}


	public Product(int productNum, String pet_category, String toy_category, String productName, int productPrice,
			String productInfo, int productStock, String onExhibition, String productThumbnail, String productImg,
			String productTag, int cart_ProductQuantity, int cartNum, int start, int end) {
		super();
		this.productNum = productNum;
		this.pet_category = pet_category;
		this.toy_category = toy_category;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productInfo = productInfo;
		this.productStock = productStock;
		this.onExhibition = onExhibition;
		this.productThumbnail = productThumbnail;
		this.productImg = productImg;
		this.productTag = productTag;
		this.cart_ProductQuantity = cart_ProductQuantity;
		this.cartNum = cartNum;
		this.start = start;
		this.end = end;
	}


	public int getProductNum() {
		return productNum;
	}


	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}


	public String getPet_category() {
		return pet_category;
	}


	public void setPet_category(String pet_category) {
		this.pet_category = pet_category;
	}


	public String getToy_category() {
		return toy_category;
	}


	public void setToy_category(String toy_category) {
		this.toy_category = toy_category;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public int getProductPrice() {
		return productPrice;
	}


	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}


	public String getProductInfo() {
		return productInfo;
	}


	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}


	public int getProductStock() {
		return productStock;
	}


	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}


	public String getOnExhibition() {
		return onExhibition;
	}


	public void setOnExhibition(String onExhibition) {
		this.onExhibition = onExhibition;
	}


	public String getProductThumbnail() {
		return productThumbnail;
	}


	public void setProductThumbnail(String productThumbnail) {
		this.productThumbnail = productThumbnail;
	}


	public String getProductImg() {
		return productImg;
	}


	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}


	public String getProductTag() {
		return productTag;
	}


	public void setProductTag(String productTag) {
		this.productTag = productTag;
	}


	public int getCart_ProductQuantity() {
		return cart_ProductQuantity;
	}


	public void setCart_ProductQuantity(int cart_ProductQuantity) {
		this.cart_ProductQuantity = cart_ProductQuantity;
	}


	public int getCartNum() {
		return cartNum;
	}


	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}


	public int getStart() {
		return start;
	}


	public void setStart(int start) {
		this.start = start;
	}


	public int getEnd() {
		return end;
	}


	public void setEnd(int end) {
		this.end = end;
	}

	
	 
	 
	 
}