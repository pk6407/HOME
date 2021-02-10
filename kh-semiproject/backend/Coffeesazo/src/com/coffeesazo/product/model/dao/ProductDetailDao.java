package com.coffeesazo.product.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.coffeesazo.product.model.vo.Product;

import common.JDBCTemplate;

public class ProductDetailDao {

	public Product CoffeeDetail(Connection conn,String productname) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Product List = null;

		String sql = "SELECT * FROM cs_product p INNER JOIN cs_hashtag h ON p.fk_hastag_index = h.hashtag_index INNER JOIN cs_category ca ON h.fk_category_index = ca.category_index WHERE p.product_name = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productname);
			rs = pstmt.executeQuery();
			rs.next();
            List = new Product();

			List.setProductIndex(rs.getInt("product_index"));
			List.setFkHashtagIndex(rs.getInt("fk_hastag_index"));
			List.setFkCategoryIndex(rs.getInt("fk_category_index"));
			List.setProductName(rs.getString("product_name"));
			List.setProductPrice(rs.getInt("product_price"));
			List.setProductCount(rs.getInt("product_count"));
			List.setProductImage(rs.getString("product_image"));
			List.setProductInfo(rs.getString("product_info"));
			List.setProductText(rs.getString("product_text"));
			List.setHashtagName(rs.getString("hashtag_name"));
			List.setCategoryName(rs.getString("category_name"));





		} catch (Exception e) {

		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}
		return List;
	}
}
