package com.coffeesazo.mypages.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.coffeesazo.mypages.model.vo.OrderViewList;

import common.JDBCTemplate;

public class OrderListDao {

	public ArrayList<OrderViewList> SelectOrderList(Connection conn, String memberid) {
		PreparedStatement pstmt = null;// 쿼리문을 담는 박스
		ResultSet rs = null;//결과값을 다루는 아이
		ArrayList<OrderViewList> odList = null;		
		//p. 가 어디서나온거?
		String sql = " SELECT * FROM cs_member c INNER JOIN cs_order o ON c.member_id = o.fk_member_id INNER JOIN cs_order_detail d ON o.order_index =  d.fk_order_index INNER JOIN cs_product p ON d.fk_product_index = p.product_index WHERE c.member_id = ? "
				+ "ORDER BY o.order_index ASC";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberid);
			rs = pstmt.executeQuery();
			odList = new ArrayList<OrderViewList>();
		
			while(rs.next()) {
				OrderViewList orderList = new OrderViewList();
				orderList.setProductIndex(rs.getInt("product_index"));
				orderList.setProductName(rs.getString("product_name"));
				orderList.setProductPrice(rs.getInt("product_price"));
				orderList.setOrderCount(rs.getInt("order_product_count"));
				orderList.setProductImage(rs.getString("product_image"));
				orderList.setOrderIndex(rs.getInt("order_index"));
				//첫번째vo가 꽉참
				
				odList.add(orderList);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}
		//
		return odList;
	}

	
	
	public int CheckOrderDelete(Connection conn, int[] cod, String memberid) {
		PreparedStatement pstmt = null;// 쿼리문을 담는 박스
		ResultSet rs = null;//결과값을 다루는 아이
		
		int result = 0;
		String params = "";
		for(int i=0; i<cod.length; i++) {
			params += cod[i];
			if(i <cod.length-1) {
				params += ",";
			}
		}
		System.out.println(params);
		System.out.println(memberid);
		//밑문장해석필유
		String sql = "DELETE FROM cs_order WHERE fk_member_id = ? AND order_index IN ("+params+")";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberid);
			result=pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}
		System.out.println("리설트입니다"+result);
		return result;
	}



}
