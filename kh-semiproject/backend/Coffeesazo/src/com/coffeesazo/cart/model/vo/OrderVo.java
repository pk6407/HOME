package com.coffeesazo.cart.model.vo;

import java.util.Date;

public class OrderVo {
		private String memberId;
		private String orderAddress;
		private String orderPhone;
		private String orderPayment;
		private String orderZipcode;
		private String orederText;
		
		private String orderReceiver;
		private String orderReceiverPhone;
		private String orderTotalPrice;
		
		
		
		public String getOrderPhone() {
			return orderPhone;
		}
		public void setOrderPhone(String orderPhone) {
			this.orderPhone = orderPhone;
		}
		public String getMemberId() {
			return memberId;
		}
		public void setMemberId(String memberId) {
			this.memberId = memberId;
		}
		public String getOrderAddress() {
			return orderAddress;
		}
		public void setOrderAddress(String orderAddress) {
			this.orderAddress = orderAddress;
		}
		public String getOrderPayment() {
			return orderPayment;
		}
		public void setOrderPayment(String orderPayment) {
			this.orderPayment = orderPayment;
		}
		public String getOrderZipcode() {
			return orderZipcode;
		}
		public void setOrderZipcode(String orderZipcode) {
			this.orderZipcode = orderZipcode;
		}
		public String getOrederText() {
			return orederText;
		}
		public void setOrederText(String orederText) {
			this.orederText = orederText;
		}
		
		public String getOrderReceiver() {
			return orderReceiver;
		}
		public void setOrderReceiver(String orderReceiver) {
			this.orderReceiver = orderReceiver;
		}
		public String getOrderReceiverPhone() {
			return orderReceiverPhone;
		}
		public void setOrderReceiverPhone(String orderReceiverPhone) {
			this.orderReceiverPhone = orderReceiverPhone;
		}
		public String getOrderTotalPrice() {
			return orderTotalPrice;
		}
		public void setOrderTotalPrice(String orderTotalPrice) {
			this.orderTotalPrice = orderTotalPrice;
		}
}
