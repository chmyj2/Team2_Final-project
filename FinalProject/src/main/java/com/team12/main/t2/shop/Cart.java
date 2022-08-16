package com.team12.main.t2.shop;

import java.sql.Date;

public class Cart {

	private int cartNum;
	private String cart_UserID;
	private int cart_ProductNum;
	private int cart_ProductQuantity;
    private Date cart_Date;
    
    public Cart() {
		// TODO Auto-generated constructor stub
	}

	public Cart(int cartNum, String cart_UserID, int cart_ProductNum, int cart_ProductQuantity, Date cart_Date) {
		super();
		this.cartNum = cartNum;
		this.cart_UserID = cart_UserID;
		this.cart_ProductNum = cart_ProductNum;
		this.cart_ProductQuantity = cart_ProductQuantity;
		this.cart_Date = cart_Date;
	}

	public int getCartNum() {
		return cartNum;
	}

	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}

	public String getCart_UserID() {
		return cart_UserID;
	}

	public void setCart_UserID(String cart_UserID) {
		this.cart_UserID = cart_UserID;
	}

	public int getCart_ProductNum() {
		return cart_ProductNum;
	}

	public void setCart_ProductNum(int cart_ProductNum) {
		this.cart_ProductNum = cart_ProductNum;
	}

	public int getCart_ProductQuantity() {
		return cart_ProductQuantity;
	}

	public void setCart_ProductQuantity(int cart_ProductQuantity) {
		this.cart_ProductQuantity = cart_ProductQuantity;
	}

	public Date getCart_Date() {
		return cart_Date;
	}

	public void setCart_Date(Date cart_Date) {
		this.cart_Date = cart_Date;
	}
    
    
	
}
