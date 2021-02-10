package com.coffeesazo.cart.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.coffeesazo.Application;
import com.coffeesazo.cart.model.dao.CartDao;
import com.coffeesazo.cart.model.vo.Cart;
import com.coffeesazo.cart.model.vo.CartCompare;
import com.coffeesazo.cart.model.vo.OrderIndex;
import com.coffeesazo.cart.model.vo.OrderMember;
import com.coffeesazo.cart.model.vo.OrderVo;

import common.JDBCTemplate;

public class CartService {
	ArrayList<Cart> pList = null;
    int result = 0;
    int submit = 0;
    int submit2 = 0;
    ArrayList<OrderIndex> oIndex = null;
	public ArrayList<Cart> SelectCartList(String memberid) {
		
	    
		try {
			
			Connection conn = new Application().getConn();//데이터베이스 창고 열쇠를 만듬
		    pList = new CartDao().SelectCartList(conn, memberid);
			JDBCTemplate.close(conn);
			} catch (Exception e) {
			e.printStackTrace();
		}
		return pList;
		
	}

	public int CheckCartDelete(int[] cpd, String memberid) {
		int result = 0;
		try {
			Connection conn = new Application().getConn();
			result = new CartDao().CheckCartDelete(conn,cpd,memberid);
			JDBCTemplate.close(conn);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	public int CartAllDelete(String memberid) {
		int result = 0;
		try {
			Connection conn = new Application().getConn();
			result = new CartDao().CartDeleteAll(conn,memberid);
			JDBCTemplate.close(conn);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	public int OrderAllSubmit(OrderVo ordervo) {
		int submit = 0;
		try {
			Connection conn = new Application().getConn();
			submit = new CartDao().OrderAllSubmit(conn,ordervo);
			JDBCTemplate.close(conn);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return submit;
	}

	public int OrderAllbuydetail(int[] ap, int[] apc, OrderIndex lastElement) {
		int submit2 = 0;
		try {
			Connection conn = new Application().getConn();
			result = new CartDao().OrderAllbuydetail(conn,ap,apc,lastElement);
			JDBCTemplate.close(conn);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	public ArrayList<OrderIndex> FindOrderIndex(String memberid) {
		
		try {
			Connection conn = new Application().getConn();//데이터베이스 창고 열쇠를 만듬
		    oIndex = new CartDao().FindOrderIndex(conn, memberid);
			JDBCTemplate.close(conn);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return oIndex;
	}

	public int CartAddOne(String memberid, CartCompare cartcompare) {
		int addcart = 0;
		
		try {
			Connection conn = new Application().getConn();
			addcart = new CartDao().CartAddOne(conn,memberid,cartcompare);
			JDBCTemplate.close(conn);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return addcart;
	}

	public int OrderAllbuydetail2(int pd, int c, OrderIndex lastElement) {
			int submit2 = 0;
		try {
			Connection conn = new Application().getConn();
			submit2 = new CartDao().OrderAllbuydetail2(conn,pd,c,lastElement);
			JDBCTemplate.close(conn);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return submit2;
	}

	public int DeleteLastCart(String memberid, Cart lastcart) {
		int result = 0;
		try {
			Connection conn = new Application().getConn();
			result = new CartDao().DeleteLastCart(conn,memberid,lastcart);
			JDBCTemplate.close(conn);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	public OrderMember SearchMember(String memberid) {
		OrderMember om = null;
		try {
			Connection conn = new Application().getConn();
			om = new CartDao().SearchMember(conn,memberid);
			JDBCTemplate.close(conn);
		} catch (Exception e) {
			
		}
		
		return om;
	}

	public int UpdateCart(String memberid, CartCompare cartcompare , int cal) {
		int updatecart = 0;
		try {
			Connection conn = new Application().getConn();
			updatecart = new CartDao().UpdateCart(conn,cartcompare,memberid,cal);
			JDBCTemplate.close(conn);
		} catch (Exception e) {
			
		}
		return updatecart;
	}
	
	
}
