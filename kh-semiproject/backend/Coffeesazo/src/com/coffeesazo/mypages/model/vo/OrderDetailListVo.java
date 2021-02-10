package com.coffeesazo.mypages.model.vo;

import java.sql.Date;

public class OrderDetailListVo {
	private int orderIndex;
	private int productIndex;
	private int orderCount;
	private String productImage;
	private String productName;
	private int productPrice;
	private int orderDetailIndex;
	private Date orderDate;
	private String orderName;
	private String orderPhone;
	private int orderTotalPrice;
	private String orderPayment;
	private String orderReceiver;
	private String orderZipcode;
	private String orderAddress;
	private String orderReceiverPhone;
	private String orderText;
	

	public int getOrderDetailIndex() {
		return orderDetailIndex;
	}
	public void setOrderDetailIndex(int orderDetailIndex) {
		this.orderDetailIndex = orderDetailIndex;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getOrderPhone() {
		return orderPhone;
	}
	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}
	public int getOrderTotalPrice() {
		return orderTotalPrice;
	}
	public void setOrderTotalPrice(int orderTotalPrice) {
		this.orderTotalPrice = orderTotalPrice;
	}
	public String getOrderPayment() {
		return orderPayment;
	}
	public void setOrderPayment(String orderPayment) {
		this.orderPayment = orderPayment;
	}

	public String getOrderReceiver() {
		return orderReceiver;
	}
	public void setOrderReceiver(String orderReceiver) {
		this.orderReceiver = orderReceiver;
	}
	public String getOrderZipcode() {
		return orderZipcode;
	}
	public void setOrderZipcode(String orderZipcode) {
		this.orderZipcode = orderZipcode;
	}
	public String getOrderAddress() {
		return orderAddress;
	}
	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	public String getOrderReceiverPhone() {
		return orderReceiverPhone;
	}
	public void setOrderReceiverPhone(String orderReceiverPhone) {
		this.orderReceiverPhone = orderReceiverPhone;
	}
	public String getOrderText() {
		return orderText;
	}
	public void setOrderText(String orderText) {
		this.orderText = orderText;
	}
	public int getOrderIndex() {
		return orderIndex;
	}
	public void setOrderIndex(int orderIndex) {
		this.orderIndex = orderIndex;
	}
	public int getProductIndex() {
		return productIndex;
	}
	public void setProductIndex(int productIndex) {
		this.productIndex = productIndex;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
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
	@Override
	public String toString() {
		return "OrderDetailVo [orderIndex=" + orderIndex + ", productIndex=" + productIndex + ", orderCount="
				+ orderCount + ", productImage=" + productImage + ", productName=" + productName + ", productPrice="
				+ productPrice + ", orderDetailIndex=" + orderDetailIndex + ", orderDate=" + orderDate + ", orderName="
				+ orderName + ", orderPhone=" + orderPhone + ", orderTotalPrice=" + orderTotalPrice + ", orderPayment="
				+ orderPayment + ", orderReceiver=" + orderReceiver + ", orderZipcode=" + orderZipcode
				+ ", orderAddress=" + orderAddress + ", orderReceiverPhone=" + orderReceiverPhone + ", orderText="
				+ orderText + "]";
	}
	
	
	

}
