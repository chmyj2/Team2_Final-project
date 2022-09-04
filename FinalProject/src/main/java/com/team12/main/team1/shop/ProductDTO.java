package com.team12.main.team1.shop;

public class ProductDTO {
   private String num_PK;
   private String categoryNum;
   private String name;
   private double price;
   private double vat;
   private String contents;
   private String thumbnail;
   private String img1;
   private String img2;
   private String img3;
   private String tag;
   private String onsale;
   private int stock;
   
   public ProductDTO() {
	// TODO Auto-generated constructor stub
   }

	public ProductDTO(String num_PK, String categoryNum, String name, double price, double vat, String contents,
			String thumbnail, String img1, String img2, String img3, String tag, String onsale, int stock) {
		super();
		this.num_PK = num_PK;
		this.categoryNum = categoryNum;
		this.name = name;
		this.price = price;
		this.vat = vat;
		this.contents = contents;
		this.thumbnail = thumbnail;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
		this.tag = tag;
		this.onsale = onsale;
		this.stock = stock;
	}

	public String getNum_PK() {
		return num_PK;
	}

	public void setNum_PK(String num_PK) {
		this.num_PK = num_PK;
	}

	public String getCategoryNum() {
		return categoryNum;
	}

	public void setCategoryNum(String categoryNum) {
		this.categoryNum = categoryNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getVat() {
		return vat;
	}

	public void setVat(double vat) {
		this.vat = vat;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getImg2() {
		return img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2;
	}

	public String getImg3() {
		return img3;
	}

	public void setImg3(String img3) {
		this.img3 = img3;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getOnsale() {
		return onsale;
	}

	public void setOnsale(String onsale) {
		this.onsale = onsale;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}
   
   
}
