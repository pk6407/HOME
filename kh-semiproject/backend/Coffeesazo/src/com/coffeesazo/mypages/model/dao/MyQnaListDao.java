package com.coffeesazo.mypages.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.coffeesazo.Application;
import com.coffeesazo.Page;
import com.coffeesazo.member.model.vo.MemberVo;
import com.coffeesazo.mypages.model.vo.MyQnaList;

import common.JDBCTemplate;



public class MyQnaListDao {



	
	public int getTotalListSize(Connection conn, String findStr , String memberid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int totalListSize = 0;

		try {
			String sql = "SELECT COUNT(*) cnt FROM CS_QNA  WHERE QNA_TITLE LIKE ? AND fk_member_id = ? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + findStr + "%");
			pstmt.setString(2,  memberid);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				totalListSize = rs.getInt("cnt");						
			}

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}

		return totalListSize;

	}
	
	
	
	
	
	public List<MyQnaList> selectQnaPageList(Connection conn, Page page, String memberid) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		List<MyQnaList> qnaSearchList = null;

		try {

			qnaSearchList = new ArrayList<MyQnaList>();
			String findStr = page.getFindStr();
			page.setTotalListSize(getTotalListSize(conn, findStr , memberid));
			page.pageCompute();

			String sql = "SELECT * FROM ("
					+ "SELECT ROWNUM no, n.* FROM ("
					+ "SELECT * FROM CS_QNA WHERE QNA_TITLE LIKE ? AND fk_member_id = ? "
					+ "ORDER BY QNA_INDEX DESC) n"
					+ " ) WHERE no BETWEEN ? AND ?";


			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + findStr + "%");
			pstmt.setString(2, memberid );
			pstmt.setInt(3, page.getStartNo());
			pstmt.setInt(4, page.getEndNo());
//			System.out.println(page.getStartNo());
//			System.out.println(page.getEndNo());
			rs = pstmt.executeQuery();

			while(rs.next()) {
				MyQnaList myqnaList = new MyQnaList();
				myqnaList.setQnaIndex(rs.getInt("QNA_INDEX"));
				myqnaList.setQnaTitle(rs.getString("QNA_TITLE"));
				myqnaList.setWriteDate(rs.getDate("QNA_DATE"));

				qnaSearchList.add(myqnaList);		
			}		
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);	
		}
		return qnaSearchList;
	}



	public ArrayList<MyQnaList> SelectQnaList(Connection conn, String memberid) {
		PreparedStatement pstmt = null;// 쿼리문을 담는 박스
		ResultSet rs = null;//결과값을 다루는 아이
		ArrayList<MyQnaList> qnaList = null;
		String sql ="SELECT * FROM cs_member c INNER JOIN cs_qna q ON c.member_id = q.fk_member_id  WHERE c.member_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberid);
			rs = pstmt.executeQuery();
			qnaList = new ArrayList<MyQnaList>();
		
			while(rs.next()) {
				MyQnaList myqnaList = new MyQnaList();
				myqnaList.setUserId(rs.getString("fk_member_id"));
				myqnaList.setQnaTitle(rs.getString("qna_title"));
				myqnaList.setUserId(rs.getString("QNA_CHECK"));
				myqnaList.setQnaIndex(rs.getInt("qna_index"));
				myqnaList.setWriteDate(rs.getDate("qna_date"));
				
				qnaList.add(myqnaList);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}
		//
		return qnaList;
	}

	

	

	
	

}
