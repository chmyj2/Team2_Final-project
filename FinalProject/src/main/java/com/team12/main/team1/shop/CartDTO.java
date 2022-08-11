package com.team12.main.team1.shop;

import java.sql.Date;

public class CartDTO {
	// 카트관련
	private int Num_PK;
	private String Cart_userID;
	private int cart_product_Num;
	private int Cart_ProductQuantity;
	private Date Cart_date;
	// 프로덕트관련
	private String name;
	private double price;
	private double vat;
	// 가격관련
	private double salePrice;
	private double totalPrice;
 
	
	public CartDTO() {
		// TODO Auto-generated constructor stub
	}
	

	public int getNum_PK() {
		return Num_PK;
	}






	public void setNum_PK(int num_PK) {
		Num_PK = num_PK;
	}






	public String getCart_userID() {
		return Cart_userID;
	}






	public void setCart_userID(String cart_userID) {
		Cart_userID = cart_userID;
	}






	public int getCart_product_Num() {
		return cart_product_Num;
	}






	public void setCart_product_Num(int cart_product_Num) {
		this.cart_product_Num = cart_product_Num;
	}






	public int getCart_ProductQuantity() {
		return Cart_ProductQuantity;
	}






	public void setCart_ProductQuantity(int cart_ProductQuantity) {
		Cart_ProductQuantity = cart_ProductQuantity;
	}






	public Date getCart_date() {
		return Cart_date;
	}






	public void setCart_date(Date cart_date) {
		Cart_date = cart_date;
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






	public double getSalePrice() {
		return salePrice;
	}






	public void setSalePrice(double salePrice) {
		this.salePrice = salePrice;
	}






	public double getTotalPrice() {
		return totalPrice;
	}






	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}






	public CartDTO(int num_PK, String cart_userID, int cart_product_Num, int cart_ProductQuantity, Date cart_date,
			String name, double price, double vat, double salePrice, double totalPrice) {
		super();
		Num_PK = num_PK;
		Cart_userID = cart_userID;
		this.cart_product_Num = cart_product_Num;
		Cart_ProductQuantity = cart_ProductQuantity;
		Cart_date = cart_date;
		this.name = name;
		this.price = price;
		this.vat = vat;
		this.salePrice = salePrice;
		this.totalPrice = totalPrice;
	}






	@Override
	public String toString() {
		return "CartDTO [Num_PK=" + Num_PK + ",Cart_userID=" + Cart_userID + ",cart_product_Num=" + cart_product_Num
				+ ",Cart_ProductQuantity=" + Cart_ProductQuantity + ",Cart_date=" + Cart_date + ",name=" + name
				+ ",price=" + price + ",vat=" + vat + ",salePrice=" + salePrice + ",totalPrice=" + totalPrice + "]";
	}
	
}
