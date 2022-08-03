package com.team12.main.t2.regProduct;

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
	 
	 public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(int productNum, String pet_category, String toy_category, String productName, int productPrice,
			String productInfo, int productStock, String onExhibition, String productThumbnail, String productImg,
			String productTag) {
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
	 
	 
	
}
