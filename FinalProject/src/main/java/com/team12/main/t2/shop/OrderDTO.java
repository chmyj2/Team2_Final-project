package com.team12.main.t2.shop;

import java.sql.Date;

public class OrderDTO {

	
	private String Order_Num ;
	private String  Order_User_ID;
	private String Order_ProductNum;
	private String Order_PhoneNumber;
	private String Product_Quantity;
	private Date Order_Date;
	private String Shipping_Address;
	private String Order_DeliverState;
	private String Order_State;
	private String Order_PaymentState;
	private String Product_Price;
	private String Order_TotalPrice;
	private int Order_PK;
	private String Shipping_Memo;
	private String Recipient;
	private String Thumbnail;
	private int start;
	private int end;
	
	
	public OrderDTO() {
		// TODO Auto-generated constructor stub
	}


	public OrderDTO(String order_Num, String order_User_ID, String order_ProductNum, String order_PhoneNumber,
			String product_Quantity, Date order_Date, String shipping_Address, String order_DeliverState,
			String order_State, String order_PaymentState, String product_Price, String order_TotalPrice, int order_PK,
			String shipping_Memo, String recipient, String thumbnail, int start, int end) {
		super();
		Order_Num = order_Num;
		Order_User_ID = order_User_ID;
		Order_ProductNum = order_ProductNum;
		Order_PhoneNumber = order_PhoneNumber;
		Product_Quantity = product_Quantity;
		Order_Date = order_Date;
		Shipping_Address = shipping_Address;
		Order_DeliverState = order_DeliverState;
		Order_State = order_State;
		Order_PaymentState = order_PaymentState;
		Product_Price = product_Price;
		Order_TotalPrice = order_TotalPrice;
		Order_PK = order_PK;
		Shipping_Memo = shipping_Memo;
		Recipient = recipient;
		Thumbnail = thumbnail;
		this.start = start;
		this.end = end;
	}


	public String getOrder_Num() {
		return Order_Num;
	}


	public void setOrder_Num(String order_Num) {
		Order_Num = order_Num;
	}


	public String getOrder_User_ID() {
		return Order_User_ID;
	}


	public void setOrder_User_ID(String order_User_ID) {
		Order_User_ID = order_User_ID;
	}


	public String getOrder_ProductNum() {
		return Order_ProductNum;
	}


	public void setOrder_ProductNum(String order_ProductNum) {
		Order_ProductNum = order_ProductNum;
	}


	public String getOrder_PhoneNumber() {
		return Order_PhoneNumber;
	}


	public void setOrder_PhoneNumber(String order_PhoneNumber) {
		Order_PhoneNumber = order_PhoneNumber;
	}


	public String getProduct_Quantity() {
		return Product_Quantity;
	}


	public void setProduct_Quantity(String product_Quantity) {
		Product_Quantity = product_Quantity;
	}


	public Date getOrder_Date() {
		return Order_Date;
	}


	public void setOrder_Date(Date order_Date) {
		Order_Date = order_Date;
	}


	public String getShipping_Address() {
		return Shipping_Address;
	}


	public void setShipping_Address(String shipping_Address) {
		Shipping_Address = shipping_Address;
	}


	public String getOrder_DeliverState() {
		return Order_DeliverState;
	}


	public void setOrder_DeliverState(String order_DeliverState) {
		Order_DeliverState = order_DeliverState;
	}


	public String getOrder_State() {
		return Order_State;
	}


	public void setOrder_State(String order_State) {
		Order_State = order_State;
	}


	public String getOrder_PaymentState() {
		return Order_PaymentState;
	}


	public void setOrder_PaymentState(String order_PaymentState) {
		Order_PaymentState = order_PaymentState;
	}


	public String getProduct_Price() {
		return Product_Price;
	}


	public void setProduct_Price(String product_Price) {
		Product_Price = product_Price;
	}


	public String getOrder_TotalPrice() {
		return Order_TotalPrice;
	}


	public void setOrder_TotalPrice(String order_TotalPrice) {
		Order_TotalPrice = order_TotalPrice;
	}


	public int getOrder_PK() {
		return Order_PK;
	}


	public void setOrder_PK(int order_PK) {
		Order_PK = order_PK;
	}


	public String getShipping_Memo() {
		return Shipping_Memo;
	}


	public void setShipping_Memo(String shipping_Memo) {
		Shipping_Memo = shipping_Memo;
	}


	public String getRecipient() {
		return Recipient;
	}


	public void setRecipient(String recipient) {
		Recipient = recipient;
	}


	public String getThumbnail() {
		return Thumbnail;
	}


	public void setThumbnail(String thumbnail) {
		Thumbnail = thumbnail;
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