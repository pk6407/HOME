package com.coffeesazo.cart.model.vo;

public class OrderDtailVo {
	int fkProductIndex;
	int orderProductcount;
	
	
	
	public int getFkProductIndex() {
		return fkProductIndex;
	}
	public void setFkProductIndex(int fkProductIndex) {
		this.fkProductIndex = fkProductIndex;
	}
	public int getOrderProductcount() {
		return orderProductcount;
	}
	public void setOrderProductcount(int orderProductcount) {
		this.orderProductcount = orderProductcount;
	}

}
