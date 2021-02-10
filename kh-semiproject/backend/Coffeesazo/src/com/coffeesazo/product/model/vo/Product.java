package com.coffeesazo.product.model.vo;

public class Product {
	private int productIndex;
	private int fkHashtagIndex;
	private int fkCategoryIndex;
	private String productName;
	private int productPrice;
	private int productCount;
	private String productImage;
	private String productInfo;
	private String productText;
	private String hashtagName;
	private String categoryName;
	
	public int getProductIndex() {
		return productIndex;
	}
	public void setProductIndex(int productIndex) {
		this.productIndex = productIndex;
	}
	public int getFkHashtagIndex() {
		return fkHashtagIndex;
	}
	public void setFkHashtagIndex(int fkHashtagIndex) {
		this.fkHashtagIndex = fkHashtagIndex;
	}
	public int getFkCategoryIndex() {
		return fkCategoryIndex;
	}
	public void setFkCategoryIndex(int fkCategoryIndex) {
		this.fkCategoryIndex = fkCategoryIndex;
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
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
	public String getProductInfo() {
		return productInfo;
	}
	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}
	public String getProductText() {
		return productText;
	}
	public void setProductText(String productText) {
		this.productText = productText;
	}
	public String getHashtagName() {
		return hashtagName;
	}
	public void setHashtagName(String hashtagName) {
		this.hashtagName = hashtagName;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	

}
