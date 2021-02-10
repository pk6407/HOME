package com.coffeesazo.notice.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.coffeesazo.Application;
import com.coffeesazo.Page;
import com.coffeesazo.notice.model.vo.NoticeVo;

import common.JDBCTemplate;

public class NoticeDao {

	public int getTotalListSize(Connection conn, String findStr) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		int totalListSize = 0;

		try {
			String sql = "SELECT COUNT(*) cnt FROM cs_notice WHERE notice_title LIKE ? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + findStr + "%");

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


	public List<NoticeVo> selectNoticeList(Connection conn, Page page) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		List<NoticeVo> noticeList = null;

		try {

			noticeList = new ArrayList<NoticeVo>();
			String findStr = page.getFindStr();
			page.setTotalListSize(getTotalListSize(conn, findStr));
			page.pageCompute();

			String sql = "SELECT * FROM ("
					+ "SELECT ROWNUM no, n.* FROM ("
					+ "SELECT * FROM cs_notice WHERE notice_title LIKE ? "
					+ "ORDER BY notice_index DESC) n"
					+ " ) WHERE no BETWEEN ? AND ?";


			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + findStr + "%");
			pstmt.setInt(2, page.getStartNo());
			pstmt.setInt(3, page.getEndNo());
//			System.out.println(page.getStartNo());
//			System.out.println(page.getEndNo());
			rs = pstmt.executeQuery();

			while(rs.next()) {
				NoticeVo noticevo = new NoticeVo();
				noticevo.setNoticeIndex(rs.getInt("notice_index"));
				noticevo.setNoticeTitle(rs.getString("notice_title"));
				noticevo.setNoticeDate(rs.getDate("notice_date"));
				noticeList.add(noticevo);		
			}		
		} catch (Exception e){
			e.printStackTrace();
			
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);	
		}
		return noticeList;
	}
	
	public NoticeVo selectNoticeDetailList(Connection conn, int noticeIndex) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		NoticeVo noticevo = null;

		String sql = "SELECT * FROM cs_notice WHERE notice_index = ?";
		

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeIndex);
			rs = pstmt.executeQuery();
			

			while(rs.next()) {
				noticevo = new NoticeVo();
				

				noticevo.setNoticeIndex(rs.getInt("notice_index"));
				noticevo.setNoticeTitle(rs.getString("notice_title"));
				noticevo.setNoticeDate(rs.getDate("notice_date"));
				noticevo.setNoticeText(rs.getString("notice_text"));
				noticevo.setNoticeFile(rs.getString("notice_file"));

			}		
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);	
		}
		return noticevo;
	}
}