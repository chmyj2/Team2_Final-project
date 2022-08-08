package com.team12.main.team1.shop;

import java.sql.Date;

public class CartDTO {

	  private int Num_PK;
	  private String Cart_userID;
	  private String cart_product_Num;
	  private int Cart_ProductQuantity;
	  private Date Cart_date;
	  
	  public CartDTO() {
		// TODO Auto-generated constructor stub
	  }

	public CartDTO(int num_PK, String cart_userID, String cart_product_Num, int cart_ProductQuantity, Date cart_date) {
		super();
		Num_PK = num_PK;
		Cart_userID = cart_userID;
		this.cart_product_Num = cart_product_Num;
		Cart_ProductQuantity = cart_ProductQuantity;
		Cart_date = cart_date;
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

	public String getCart_product_Num() {
		return cart_product_Num;
	}

	public void setCart_product_Num(String cart_product_Num) {
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
	  
}
