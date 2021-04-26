package kh.projectfinal.production;

import java.util.Date;

public class ProductionVo {

	private int company_index;
	private  String company_name;
	private int product_index;
	private  String product_name;
	private int product_number;
	private int product_price;
	private int warehousing_number;	
    private int warehousing_price;
	private int refurbish_number;
	private int disuse_number;
	private int release_number;
    private long release_price;
    private int stock_number;
    private long stock_price;
    private Date time;

    public long getStock_price() {
		return stock_price;
	}
	public void setStock_price(long stock_price) {
		this.stock_price = stock_price;
	}
    
	public int getCompany_index() {
		return company_index;
	}
	public void setCompany_index(int company_index) {
		this.company_index = company_index;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public int getProduct_index() {
		return product_index;
	}
	public void setProduct_index(int product_index) {
		this.product_index = product_index;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_number() {
		return product_number;
	}
	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getWarehousing_number() {
		return warehousing_number;
	}
	public void setWarehousing_number(int warehousing_number) {
		this.warehousing_number = warehousing_number;
	}
	public int getWarehousing_price() {
		return warehousing_price;
	}
	public void setWarehousing_price(int warehousing_price) {
		this.warehousing_price = warehousing_price;
	}
	public int getRefurbish_number() {
		return refurbish_number;
	}
	public void setRefurbish_number(int refurbish_number) {
		this.refurbish_number = refurbish_number;
	}
	public int getDisuse_number() {
		return disuse_number;
	}
	public void setDisuse_number(int disuse_number) {
		this.disuse_number = disuse_number;
	}
	public int getRelease_number() {
		return release_number;
	}
	public void setRelease_number(int release_number) {
		this.release_number = release_number;
	}
	public long getRelease_price() {
		return release_price;
	}
	public void setRelease_price(long release_price) {
		this.release_price = release_price;
	}
	public int getStock_number() {
		return stock_number;
	}
	public void setStock_number(int stock_number) {
		this.stock_number = stock_number;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}

}