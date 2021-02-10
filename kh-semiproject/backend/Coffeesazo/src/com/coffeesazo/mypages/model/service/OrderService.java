package com.coffeesazo.mypages.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import com.coffeesazo.Application;
import com.coffeesazo.mypages.model.dao.OrderListDao;
import com.coffeesazo.mypages.model.vo.OrderViewList;

import common.JDBCTemplate;

public class OrderService {
	ArrayList<OrderViewList> odList = null;
    int result = 0;
	public ArrayList<OrderViewList> SelectOrderList(String memberid) {
		
	    
		try {
			
			Connection conn = new Application().getConn();//데이터베이스 창고 열쇠를 만듬
			odList = new OrderListDao().SelectOrderList(conn, memberid);
			JDBCTemplate.close(conn);
			} catch (Exception e) {
			e.printStackTrace();
		}
		return odList;
		
	}

	
	
	
	public int OrderDelete(int[] cod, String memberid) {
		int result = 0;
		try {
			Connection conn = new Application().getConn();
			result = new OrderListDao().CheckOrderDelete(conn,cod,memberid);
			JDBCTemplate.close(conn);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}


	
	
}
