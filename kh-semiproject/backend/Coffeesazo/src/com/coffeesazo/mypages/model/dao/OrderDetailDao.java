package com.coffeesazo.mypages.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.coffeesazo.mypages.model.vo.OrderDetailListVo;

import common.JDBCTemplate;

public class OrderDetailDao {

	public List<OrderDetailListVo> selectOrderDetailList(Connection conn, String memberId, int orderIndex) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<OrderDetailListVo> orderDetailList = null;

		try {
			String sql = "SELECT * FROM cs_member m "
					+ "INNER JOIN cs_order o ON m.member_id = o.fk_member_id "
					+ "INNER JOIN cs_order_detail d ON o.order_index = d.fk_order_index "
					+ "INNER JOIN cs_product p ON d.fk_product_index = p.product_index "
					+ "WHERE m.member_id = ? AND o.order_index = ? "
					+ "ORDER BY p.product_index ASC";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, orderIndex);
			rs = pstmt.executeQuery();
			orderDetailList = new ArrayList<>();

			while(rs.next()) {
				OrderDetailListVo orderDetailVo = new OrderDetailListVo();
				orderDetailVo.setOrderIndex(rs.getInt("order_index"));
				orderDetailVo.setOrderDate(rs.getDate("order_date"));
				orderDetailVo.setOrderName(rs.getString("member_name"));
				orderDetailVo.setOrderPhone(rs.getString("member_phone"));
				orderDetailVo.setOrderTotalPrice(rs.getInt("order_total_price"));
				orderDetailVo.setOrderPayment(rs.getString("order_payment"));
				orderDetailVo.setOrderIndex(rs.getInt("order_index"));
				orderDetailVo.setProductImage(rs.getString("product_image"));
				orderDetailVo.setProductIndex(rs.getInt("product_index"));
				orderDetailVo.setProductName(rs.getString("product_name"));
				orderDetailVo.setOrderCount(rs.getInt("order_product_count"));
				orderDetailVo.setProductPrice(rs.getInt("product_price"));
				orderDetailVo.setOrderReceiver(rs.getString("order_receiver"));
				orderDetailVo.setOrderZipcode(rs.getString("order_zipcode"));
				orderDetailVo.setOrderAddress(rs.getString("order_address"));
				orderDetailVo.setOrderReceiverPhone(rs.getString("order_receiver_phone"));
				orderDetailVo.setOrderText(rs.getString("order_text"));

				orderDetailList.add(orderDetailVo);

			}


		} catch(Exception e) {
			e.printStackTrace();

		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}

		return orderDetailList;
	}


	public int deleteOrderDetailList(Connection conn, String memberId, int orderIndex) {
		PreparedStatement pstmt = null;
		int affectedRows = 0;

		try {
			String sql = "DELETE FROM cs_order WHERE fk_member_id = ? AND order_index = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, memberId);
			pstmt.setInt(2, orderIndex);

			affectedRows = pstmt.executeUpdate();

			if (affectedRows > 0) {
				System.out.println("주문 삭제 성공");
			} else {
				System.out.println("주문 삭제 실패");
			}

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return affectedRows;
	}

}
