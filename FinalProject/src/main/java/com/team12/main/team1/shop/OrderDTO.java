package com.team12.main.team1.shop;

import java.sql.Date;

public class OrderDTO {
	
	private String num_PK;
	private String order_userID;
	private String order_Reciever;
	private String order_PhoneNumber;
	private String order_ProductQuantity;
	private Date order_date;
	private String order_State;
	private String order_deliveryState;
	private String order_paymentState;
	private String order_PrductPrice;
	private int order_DeliveryPrice;
	
	public OrderDTO() {
		// TODO Auto-generated constructor stub
	}

	public OrderDTO(String num_PK, String order_userID, String order_Reciever, String order_PhoneNumber,
			String order_ProductQuantity, Date order_date, String order_State, String order_deliveryState,
			String order_paymentState, String order_PrductPrice, int order_DeliveryPrice) {
		super();
		this.num_PK = num_PK;
		this.order_userID = order_userID;
		this.order_Reciever = order_Reciever;
		this.order_PhoneNumber = order_PhoneNumber;
		this.order_ProductQuantity = order_ProductQuantity;
		this.order_date = order_date;
		this.order_State = order_State;
		this.order_deliveryState = order_deliveryState;
		this.order_paymentState = order_paymentState;
		this.order_PrductPrice = order_PrductPrice;
		this.order_DeliveryPrice = order_DeliveryPrice;
	}

	public String getNum_PK() {
		return num_PK;
	}

	public void setNum_PK(String num_PK) {
		this.num_PK = num_PK;
	}

	public String getOrder_userID() {
		return order_userID;
	}

	public void setOrder_userID(String order_userID) {
		this.order_userID = order_userID;
	}

	public String getOrder_Reciever() {
		return order_Reciever;
	}

	public void setOrder_Reciever(String order_Reciever) {
		this.order_Reciever = order_Reciever;
	}

	public String getOrder_PhoneNumber() {
		return order_PhoneNumber;
	}

	public void setOrder_PhoneNumber(String order_PhoneNumber) {
		this.order_PhoneNumber = order_PhoneNumber;
	}

	public String getOrder_ProductQuantity() {
		return order_ProductQuantity;
	}

	public void setOrder_ProductQuantity(String order_ProductQuantity) {
		this.order_ProductQuantity = order_ProductQuantity;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public String getOrder_State() {
		return order_State;
	}

	public void setOrder_State(String order_State) {
		this.order_State = order_State;
	}

	public String getOrder_deliveryState() {
		return order_deliveryState;
	}

	public void setOrder_deliveryState(String order_deliveryState) {
		this.order_deliveryState = order_deliveryState;
	}

	public String getOrder_paymentState() {
		return order_paymentState;
	}

	public void setOrder_paymentState(String order_paymentState) {
		this.order_paymentState = order_paymentState;
	}

	public String getOrder_PrductPrice() {
		return order_PrductPrice;
	}

	public void setOrder_PrductPrice(String order_PrductPrice) {
		this.order_PrductPrice = order_PrductPrice;
	}

	public int getOrder_DeliveryPrice() {
		return order_DeliveryPrice;
	}

	public void setOrder_DeliveryPrice(int order_DeliveryPrice) {
		this.order_DeliveryPrice = order_DeliveryPrice;
	}

}
