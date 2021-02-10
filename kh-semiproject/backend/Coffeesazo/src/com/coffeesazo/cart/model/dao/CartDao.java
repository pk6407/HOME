package com.coffeesazo.cart.model.dao;

import java.sql.Connection; 
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.coffeesazo.cart.model.vo.Cart;
import com.coffeesazo.cart.model.vo.CartCompare;
import com.coffeesazo.cart.model.vo.OrderIndex;
import com.coffeesazo.cart.model.vo.OrderMember;
import com.coffeesazo.cart.model.vo.OrderVo;

import common.JDBCTemplate;

public class CartDao {

	public ArrayList<Cart> SelectCartList(Connection conn, String memberid) {
		
		PreparedStatement pstmt = null;// 쿼리문을 담는 박스
		ResultSet rs = null;//결과값을 다루는 아이
		ArrayList<Cart> pList = null;
		
		String sql = " SELECT p.product_index,  p.product_image,  p.product_name, p.product_price, c.order_count FROM cs_member m INNER JOIN cs_cart c ON m.member_id = c.fk_member_id INNER JOIN cs_product p ON c.fk_product_index = p.product_index WHERE m.member_id = ? " ;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberid);//setString(물음표위치, 넣어줄값)
			rs = pstmt.executeQuery();
			pList = new ArrayList<Cart>();
			
			while(rs.next()) {
				Cart cart = new Cart();
				cart.setProductIndex(rs.getInt("product_index"));
				cart.setProductImage(rs.getString("product_image"));
				cart.setProductName(rs.getString("product_name"));
				cart.setProductPrice(rs.getInt("product_price"));
				cart.setOrderCount(rs.getInt("order_count"));
				
				//첫번째vo가 꽉참
				
				pList.add(cart);
				
				//Cart객채를 0~6번인덱스로 만듬
			}
				
				
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}
		
		return pList;
	}

	public int CheckCartDelete(Connection conn, int[] cpd, String memberid) {
		PreparedStatement pstmt = null;// 쿼리문을 담는 박스
		ResultSet rs = null;//결과값을 다루는 아이
		
		int result = 0;
		String params = "";
		for(int i=0; i<cpd.length; i++) {
			params += cpd[i];
			if(i <cpd.length-1) {
				params += ",";
			}
		}
		System.out.println(params);
		System.out.println(memberid);
		String sql = "DELETE FROM cs_cart WHERE fk_member_id = ? AND fk_product_index IN ("+params+")";
		
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
		return result;
	}

	public int CartDeleteAll(Connection conn, String memberid) {
		PreparedStatement pstmt = null;// 쿼리문을 담는 박스
		ResultSet rs = null;//결과값을 다루는 아이
		int result = 0;
		String sql = "DELETE FROM cs_cart WHERE fk_member_id = ?";
		
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
		return result;
	}

	public int OrderAllSubmit(Connection conn, OrderVo ordervo) {
		PreparedStatement pstmt = null;// 쿼리문을 담는 박스
		ResultSet rs = null;//결과값을 다루는 아이
		int submit = 0;
		String sql = "INSERT INTO cs_order VALUES(seq_order_index.NEXTVAL, ?, ?, ?, ?, ?,sysdate, ?, ?, ?)";
		
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,ordervo.getMemberId());
			pstmt.setString(2,ordervo.getOrderAddress());
			pstmt.setString(3,ordervo.getOrderPayment());
			pstmt.setString(4,ordervo.getOrderZipcode());
			pstmt.setString(5,ordervo.getOrederText());
			pstmt.setString(6,ordervo.getOrderReceiver());
			pstmt.setString(7,ordervo.getOrderReceiverPhone());
			pstmt.setString(8,ordervo.getOrderTotalPrice());
			submit=pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}
		return submit;
	}

	public int OrderAllbuydetail(Connection conn, int[] ap, int[] apc, OrderIndex lastElement) {
		PreparedStatement pstmt = null;// 쿼리문을 담는 박스
		ResultSet rs = null;//결과값을 다루는 아이
		int submit2 = 0;
		String sql = "INSERT INTO cs_order_detail VALUES(seq_order_detail_index.NEXTVAL,?,?,?)";
		
		try {
			for(int i=0; i<ap.length; i++) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,lastElement.getOrderIndex());
				pstmt.setInt(2,ap[i]);
				pstmt.setInt(3, apc[i]);
				submit2=pstmt.executeUpdate();
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return submit2;
	}

	public ArrayList<OrderIndex> FindOrderIndex(Connection conn, String memberid) {
		PreparedStatement pstmt = null;// 쿼리문을 담는 박스
		ResultSet rs = null;//결과값을 다루는 아이
		ArrayList<OrderIndex> oIndex = null;
		String sql = "SELECT * FROM cs_order WHERE fk_member_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberid);//setString(물음표위치, 넣어줄값)
			rs = pstmt.executeQuery();
			oIndex = new ArrayList<OrderIndex>();
			while(rs.next()) {
				OrderIndex orderindex = new OrderIndex();
				orderindex.setOrderIndex(rs.getInt("order_index"));
				oIndex.add(orderindex);
				
				
				
			}
			
		} catch (Exception e) {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}
		return oIndex;
	}

	public int CartAddOne(Connection conn, String memberid, CartCompare cartcompare) {
		PreparedStatement pstmt = null;// 쿼리문을 담는 박스
		ResultSet rs = null;//결과값을 다루는 아이
		int addcart = 0;
		String sql = "INSERT INTO cs_cart VALUES(seq_cart_index.NEXTVAL,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,memberid);
			pstmt.setInt(2,cartcompare.getProductIndex());
			pstmt.setInt(3,cartcompare.getOrderCount());
		    addcart=pstmt.executeUpdate();
		} catch (Exception e) {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}
		return addcart;
	}

	public int OrderAllbuydetail2(Connection conn, int pd, int c, OrderIndex lastElement) {
		PreparedStatement pstmt = null;// 쿼리문을 담는 박스
		ResultSet rs = null;//결과값을 다루는 아이
		int submit2 = 0;
		String sql = "INSERT INTO cs_order_detail VALUES(seq_order_detail_index.NEXTVAL,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,lastElement.getOrderIndex());
			pstmt.setInt(2,pd);
			pstmt.setInt(3,c);
			submit2=pstmt.executeUpdate();
		} catch (Exception e) {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}
		return submit2;
	}

	public int DeleteLastCart(Connection conn, String memberid, Cart lastcart) {
		int result = 0;
		PreparedStatement pstmt = null;// 쿼리문을 담는 박스
		ResultSet rs = null;//결과값을 다루는 아이
		String sql = "DELETE FROM cs_cart WHERE fk_member_id = ? AND fk_product_index = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,memberid);
			pstmt.setInt(2,lastcart.getProductIndex());
			result=pstmt.executeUpdate();
		} catch (Exception e) {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}
		return result;
	}

	public OrderMember SearchMember(Connection conn, String memberid) {
		OrderMember om = null;
		PreparedStatement pstmt = null;// 쿼리문을 담는 박스
		ResultSet rs = null;//결과값을 다루는 아이
		String sql = "SELECT * FROM cs_member WHERE member_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,memberid);
			rs=pstmt.executeQuery();
			rs.next();
			om = new OrderMember();
			
			om.setMemberEmail(rs.getString("member_email"));
			om.setMemberName(rs.getString("member_name"));
			om.setMemberPhone(rs.getString("member_phone"));
		} catch (Exception e) {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}
		return om;
	}

	public int UpdateCart(Connection conn, CartCompare cartcompare, String memberid, int cal) {
		int updatecart = 0;
		PreparedStatement pstmt = null;// 쿼리문을 담는 박스
		ResultSet rs = null;//결과값을 다루는 아이
		String sql = "UPDATE cs_cart SET order_count = ? WHERE fk_product_index = ? AND FK_MEMBER_ID = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,cal);
			pstmt.setInt(2,cartcompare.getProductIndex());
			pstmt.setString(3,memberid);
			updatecart=pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return updatecart;
	}

}
