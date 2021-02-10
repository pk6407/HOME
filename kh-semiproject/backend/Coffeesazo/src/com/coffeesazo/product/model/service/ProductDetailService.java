package com.coffeesazo.product.model.service;



import java.sql.Connection;
import java.util.ArrayList;

import com.coffeesazo.Application;
import com.coffeesazo.product.model.dao.ProductDetailDao;
import com.coffeesazo.product.model.vo.Product;

import common.JDBCTemplate;


public class ProductDetailService {
	
	
	Product List = null;
	public Product CoffeeDetail(String productname) {
		try {
			Connection conn = new Application().getConn();
			List =  new ProductDetailDao().CoffeeDetail(conn,productname);
			JDBCTemplate.close(conn);
		} catch (Exception e) {

		}
		
		return List;
	}
}
