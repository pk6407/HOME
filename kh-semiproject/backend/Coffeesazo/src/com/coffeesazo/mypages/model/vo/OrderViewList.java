package com.coffeesazo.mypages.model.vo;
import java.sql.Connection;
import java.util.ArrayList;
public class OrderViewList {
	private int productIndex;
	private int orderCount;
	private String productImage;
	private String productName;
	private int productPrice;
	private int orderIndex;
	
	
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

}
	


	

